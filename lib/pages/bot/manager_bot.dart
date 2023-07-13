import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kitchen_bot/controller/bot_controller.dart';
import 'package:kitchen_bot/controller/order_controller.dart';
import 'package:kitchen_bot/pages/bot/manager_botitem.dart';
import 'package:kitchen_bot/tempdata.dart';

class ManagerBot extends StatelessWidget {
  const ManagerBot({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BotController>(
      builder: (botcontrol) {
        return GetBuilder<OrderController>(
          builder: (ordercontrol) {
            return Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: botList
                    .map(
                      (e) => FutureBuilder(
                        future: botcontrol.assignOrderItem(id: e!.botID!),
                        builder: (context, snapshot) {
                          return ManagerBotItem(
                            worker: e,
                          );
                        },
                      ),
                    )
                    .toList(),
              ),
            );
          },
        );
      },
    );
  }
}
