import 'dart:developer';

import 'package:get/get.dart';
import 'package:kitchen_bot/models/bot_model.dart';
import 'package:kitchen_bot/models/order_model.dart';
import 'package:kitchen_bot/tempdata.dart';

class BotController extends GetxController {
  // ---> add worker to botlist
  addBot() {
    botList.add(BotModel(botStatus: 1, botID: botList.length));
    update();
    Get.back();
  }
  // ---> end

  // ---> remove new worker from botlist
  removeBot() {
    if (botList.last!.itemHold != null) {
      allorder
          .singleWhere((element) => element == botList.last!.itemHold)!
          .orderStatus = 3;
    }
    botList.removeLast();
    update();
    Get.back();
  }
  // ---> end

  // ---> assign order item to process
  Future assignOrderItem({required int id}) async {
    try {
      // ---> check if bot is busy or not
      if (botList.singleWhere((element) => element!.botID == id)!.botStatus ==
          1) {
        OrderModel? item = allorder.firstWhereOrNull(
            (element) => element!.orderStatus == 3); // ---> get hold item first
        item ??= allorder.firstWhereOrNull((element) =>
            element!.orderStatus == 0); // ---> get pending item if hold empty

        if (item != null) {
          botList.singleWhere((element) => element!.botID == id)!.itemHold =
              item;
          botList.singleWhere((element) => element!.botID == id)!.botStatus = 2;
          allorder.singleWhere((element) => element == item)!.orderStatus = 2;
          // ---> processing the order
          Future.delayed(Duration(seconds: 10), () => completeOrder(id: id));
        } else {
          // ---> maintain bot status idle
          botList.singleWhere((element) => element!.botID == id)!.botStatus = 1;
        }
      }
    } catch (e) {
      log('getOrderItem error: $e');
    }
  }
  // ---> end

  // ---> complete order bot
  completeOrder({required int id}) {
    try {
      // ---> try to chnage order status
      allorder
          .singleWhere((element) =>
              element ==
              botList.singleWhere((element) => element!.botID == id)!.itemHold)!
          .orderStatus = 1;
      // ---> chnage bot stats idle
      botList.singleWhere((element) => element!.botID == id)!.botStatus = 1;
    } catch (e) {
      // ---> this item is on hold
      log('order item on hold');
    }
    update();
  }
  // ---> end
}
