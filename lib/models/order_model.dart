class OrderModel {
  final String? orderID;
  /// 0 pending, 1 complete, 2 preparing, 3 hold
  int? orderStatus;
  final int? orderType;

  OrderModel({
    this.orderID,
    this.orderStatus,
    this.orderType,
  });
}
