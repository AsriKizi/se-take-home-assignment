import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitchen_bot/config/ui_config.dart';
import 'package:kitchen_bot/controller/bot_controller.dart';
import 'package:kitchen_bot/controller/order_controller.dart';
import 'package:kitchen_bot/pages/bot/manager_bot.dart';
import 'package:kitchen_bot/pages/bot/manager_page.dart';
import 'package:kitchen_bot/pages/order/order_list.dart';
import 'package:kitchen_bot/pages/user/user_page.dart';
import 'package:kitchen_bot/tempdata.dart';

// ---> order page
class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BotController>(
      builder: (botcontrol) {
        return GetBuilder<OrderController>(
          builder: (ordercontrol) {
            return Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () => Get.to(() => const UserPage()),
                        child: Container(
                          color: secondColor,
                          child: const Text('Add Order'),
                        ),
                      ),
                      const ManagerBot(),
                      InkWell(
                        onTap: () => Get.to(() => const ManagerPage()),
                        child: Container(
                          color: secondColor,
                          child: const Text('Add Bot'),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: FutureBuilder(
                      future: ordercontrol.getOrderList(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Row(
                            children: [
                              OrderList(
                                  type: 'Pending Order',
                                  data: allorder
                                      .where((element) =>
                                          element!.orderStatus == 0)
                                      .toList()),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  children: [
                                    OrderList(
                                        type: 'Preparing Order',
                                        data: allorder
                                            .where((element) =>
                                                element!.orderStatus == 2)
                                            .toList()),
                                    const SizedBox(height: 10),
                                    OrderList(
                                        type: 'Order On Hold',
                                        data: allorder
                                            .where((element) =>
                                                element!.orderStatus == 3)
                                            .toList()),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              OrderList(
                                  type: 'Complete Order',
                                  data: allorder
                                      .where((element) =>
                                          element!.orderStatus == 1)
                                      .toList()),
                            ],
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
