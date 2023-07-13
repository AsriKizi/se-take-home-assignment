import 'dart:developer';

import 'package:get/get.dart';
import 'package:kitchen_bot/models/order_model.dart';
import 'package:kitchen_bot/tempdata.dart';

class OrderController extends GetxController {
  // ---> add order to list
  addOrderToList({required OrderModel order}) {
    if (order.orderType == 1) {
      viporder.add(order);
    } else {
      normalorder.add(order);
    }
    update();
    Get.back();
    Get.back();
  }
  // ---> end

  // ---> generate order id
  getOrderId({required int type}) {
    var id = '';
    if (type == 1) {
      runVOrder++;
      id = 'V$runVOrder';
    } else {
      runNOrder++;
      id = 'N$runNOrder';
    }
    orderToAdd = OrderModel(orderID: id, orderStatus: 0, orderType: type);
    update();
  }
  // ---> end

  // ---> get all order list
  Future<List<OrderModel?>> getOrderList() async {
    List<OrderModel?> data = [];
    data.addAll(viporder);
    data.addAll(normalorder);
    allorder = data;
    return data;
  }
  // ---> end
}
