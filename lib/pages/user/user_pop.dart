import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitchen_bot/config/ui_config.dart';
import 'package:kitchen_bot/controller/order_controller.dart';
import 'package:kitchen_bot/tempdata.dart';

class UserPop extends StatelessWidget {
  const UserPop({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: GetBuilder<OrderController>(
        builder: (ordercontrol) {
          return Container(
            color: firstColor,
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Your Order ID:'),
                Text("#${orderToAdd.orderID!}"),
                InkWell(
                  onTap: () {
                    ordercontrol.addOrderToList(order: orderToAdd);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    color: secondColor,
                    child: const Text('Confirm Order'),
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

userPop(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return const UserPop();
    },
  );
}
