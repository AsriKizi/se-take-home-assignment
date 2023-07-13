import 'package:kitchen_bot/models/order_model.dart';

class BotModel {
  final int? botID;

  /// 0 = idle 1 = working
  int? botStatus;
  OrderModel? itemHold;

  BotModel({
    required this.botID,
    this.botStatus,
    this.itemHold,
  });
}
