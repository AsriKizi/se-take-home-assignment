import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitchen_bot/config/ui_config.dart';
import 'package:kitchen_bot/controller/bot_controller.dart';
import 'package:kitchen_bot/controller/order_controller.dart';
import 'package:kitchen_bot/controller/root_controller.dart';
import 'package:kitchen_bot/pages/order/order_page.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<RootController>(
        init: RootController(),
        builder: (rootcontrol) {
          return GetBuilder<OrderController>(
            init: OrderController(),
            builder: (ordercontrol) {
              return GetBuilder<BotController>(
                init: BotController(),
                builder: (botcontrol) {
                  return Container(
                    decoration: BoxDecoration(
                      color: firstColor,
                    ),
                    child: const OrderPage(),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
