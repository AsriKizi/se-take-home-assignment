import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitchen_bot/config/assets_config.dart';
import 'package:kitchen_bot/config/ui_config.dart';
import 'package:kitchen_bot/controller/bot_controller.dart';

// ---> order page
class ManagerPage extends StatelessWidget {
  const ManagerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BotController>(
        builder: (botcontrol) {
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
                  onTap: () => botcontrol.addBot(),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    color: secondColor,
                    child: const Text('Add Worker'),
                  ),
                ),
                InkWell(
                  onTap: () => botcontrol.removeBot(),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    color: secondColor,
                    child: const Text('Remove Worker'),
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
