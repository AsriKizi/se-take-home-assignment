import 'package:flutter/material.dart';
import 'package:kitchen_bot/models/order_model.dart';

class OrderList extends StatelessWidget {
  final String type;
  final List<OrderModel?> data;
  const OrderList({super.key, required this.data, required this.type});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(type),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 3 / 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: data
                  .map((e) => Container(
                        alignment: Alignment.center,
                        color: Colors.yellow,
                        child: Text(e!.orderID.toString()),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
