import 'package:borong/models/data.dart';

enum OrderStatus {
  /// Waiting to pay
  waiting,

  /// Waiting to get confirmation from the seller
  pending,

  /// Waiting to be shipped
  processing,

  /// Completed
  completed,

  /// Canceled
  canceled,
}

enum OrderType {
  buy,
  sell,
}

class OrderDetailEntity extends DataEntity {
  final String userId;
  final int total;
  final String shippingAddress;
  final String consignee;
  final OrderType type;
  final OrderStatus status;
  OrderDetailEntity({
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

class OrderItemEntity extends DataEntity {
  final String name;
  final double price;
  final int quantity;
  final String productId;
  final String orderId;

  OrderItemEntity({
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
