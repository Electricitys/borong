import 'package:borong/models/data.dart';

enum OrderStatus {
  pending,
  processing,
  completed,
  canceled,
}

enum OrderType {
  buy,
  sell,
}

class OrderDetail extends DataEntity {
  final String userId;
  final int total;
  final String shippingAddress;
  final String consignee;
  final OrderType type;
  final OrderStatus status;
  OrderDetail({
    required this.userId,
    required this.total,
    required this.shippingAddress,
    required this.consignee,
    required this.type,
    required this.status,
    required super.id,
    required super.createdAt,
    required super.updatedAt,
  });
}

class OrderItem extends DataEntity {
  final String name;
  final double price;
  final int quantity;
  final String productId;
  final String orderId;

  OrderItem({
    required this.name,
    required this.price,
    required this.quantity,
    required this.productId,
    required this.orderId,
    required super.id,
    required super.createdAt,
    required super.updatedAt,
  });
}
