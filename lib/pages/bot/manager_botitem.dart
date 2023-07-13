import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitchen_bot/config/ui_config.dart';
import 'package:kitchen_bot/controller/bot_controller.dart';
import 'package:kitchen_bot/controller/order_controller.dart';
import 'package:kitchen_bot/models/bot_model.dart';

class ManagerBotItem extends StatefulWidget {
  final BotModel worker;
  const ManagerBotItem({super.key, required this.worker});

  @override
  State<ManagerBotItem> createState() => _ManagerBotItemState();
}

class _ManagerBotItemState extends State<ManagerBotItem> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BotController>(
      builder: (botcontrol) {
        return Container(
          color: secondColor,
          child: Column(
            children: [
              Text('Worker ${widget.worker.botID!}'),
              Text(widget.worker.botStatus == 2
                  ? 'Preparing: #${widget.worker.itemHold!.orderID!}'
                  : 'idle'),
            ],
          ),
        );
      },
    );
  }
}
