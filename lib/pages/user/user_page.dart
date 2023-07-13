import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitchen_bot/config/assets_config.dart';
import 'package:kitchen_bot/config/ui_config.dart';
import 'package:kitchen_bot/controller/order_controller.dart';
import 'package:kitchen_bot/pages/user/user_pop.dart';

// ---> order page
class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<OrderController>(
        builder: (ordercontrol) {
          return Container(
            width: MediaQuery.of(context).size.width,
            color: firstColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  appImage.logo,
                  height: MediaQuery.of(context).size.width * 0.2,
                ),
                InkWell(
                  onTap: () {
                    ordercontrol.getOrderId(type: 0);
                    userPop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    color: secondColor,
                    child: const Text('Normal Order'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    ordercontrol.getOrderId(type: 1);
                    userPop(context);
                  },
                  child: Container(
                    color: secondColor,
                    padding: const EdgeInsets.all(10),
                    child: const Text('VIP Order'),
                  ),
                ),
                InkWell(
                  onTap: () => Get.back(),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    color: secondColor,
                    child: const Text('Back'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
