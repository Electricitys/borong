import 'package:borong/screens/cart_screen.dart';
import 'package:borong/utilities/contra/colors.dart';
import 'package:borong/widgets/contra/contra_appbar.dart';
import 'package:borong/widgets/contra/contra_box.dart';
import 'package:borong/widgets/contra/contra_button_solid.dart';
import 'package:borong/widgets/contra/contra_divider.dart';
import 'package:borong/widgets/contra/contra_text.dart';
import 'package:borong/widgets/contra/contra_toast_screen.dart';
import 'package:borong/widgets/contra/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart' show NumberFormat;

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({Key? key}) : super(key: key);

  static const String routeName = '/order-detail-screen';

  @override
  // ignore: library_private_types_in_public_api
  _OrderDetailScreenState createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  final Uuid uuid = const Uuid();
  final NumberFormat oCcy = NumberFormat("#,##0", "id_ID");
  final List<_OrderItem> orderItems = <_OrderItem>[];
  final _OrderDetail orderDetail = _OrderDetail();

  @override
  void initState() {
    orderItems.add(_OrderItem(
      name: "Kaos Denium",
      price: 10000,
      quantity: 2,
      total: 10000 * 2,
    ));
    orderItems.add(_OrderItem(
      name: "Kaos Denium",
      price: 10000,
      quantity: 2,
      total: 10000 * 2,
    ));
    orderItems.add(_OrderItem(
      name: "Kaos Denium",
      price: 25000,
      quantity: 2,
      total: 25000 * 2,
    ));
    orderItems.add(_OrderItem(
      name: "Kaos Denium",
      price: 10000,
      quantity: 2,
      total: 10000 * 2,
    ));

    orderDetail.subtotal =
        orderItems.fold<double>(0, (value, element) => element.total + value);
    orderDetail.platformFee = orderDetail.subtotal * 0.01;
    orderDetail.total = orderDetail.platformFee + orderDetail.subtotal;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: ContraColors.persianBlue,
      appBar: CustomAppBar(
        height: kToolbarHeight + statusBarHeight,
        child: const ContraAppbar(
          title: "Order Detail",
          titleStyle: TextStyle(
            color: ContraColors.white,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 12.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: const <Widget>[
                      ContraText(
                        alignment: Alignment.centerLeft,
                        text: "Shipping Address",
                        color: ContraColors.white,
                        size: 16,
                      ),
                      SizedBox(height: 8.0),
                      ContraText(
                        alignment: Alignment.centerLeft,
                        text: "Imanuel Pundoko",
                        color: ContraColors.white,
                        size: 16,
                        weight: FontWeight.normal,
                      ),
                      SizedBox(height: 8.0),
                      ContraText(
                        alignment: Alignment.centerLeft,
                        text: "Desa sea, jaga 3, kec. Pineleng, kab. Minahasa",
                        color: ContraColors.white,
                        size: 16,
                        weight: FontWeight.normal,
                      ),
                      // SizedBox(height: 12.0),
                      // ContraText(
                      //   alignment: Alignment.centerLeft,
                      //   text: "Payment Method",
                      //   color: ContraColors.white,
                      //   size: 16,
                      // ),
                      // SizedBox(height: 8.0),
                      // ContraText(
                      //   alignment: Alignment.centerLeft,
                      //   text: "Cash on Delivery",
                      //   color: ContraColors.white,
                      //   size: 16,
                      //   weight: FontWeight.normal,
                      // )
                    ],
                  ),
                ),
                const SizedBox(height: 12.0),
                Expanded(
                  flex: 2,
                  child: ContraBox(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 24.0),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24.0),
                            child: Column(
                              children: orderItems
                                  .map(
                                    (orderItem) => _OrderListItem(
                                      label: Column(children: <Widget>[
                                        ContraText(
                                          text: orderItem.name,
                                          size: 16,
                                          weight: FontWeight.normal,
                                        ),
                                        ContraText(
                                          text:
                                              "${orderItem.quantity} x Rp. ${oCcy.format(orderItem.price)}",
                                          size: 12,
                                          color: ContraColors.santasGray,
                                          weight: FontWeight.normal,
                                        ),
                                      ]),
                                      price: oCcy.format(orderItem.total),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Column(
                            children: <Widget>[
                              const ContraDivider(),
                              _OrderListItem(
                                  label: "Subtotal",
                                  price: oCcy.format(orderDetail.subtotal)),
                              _OrderListItem(
                                  label: "Platform fee",
                                  price: oCcy.format(orderDetail.platformFee)),
                              const ContraDivider(),
                              _OrderListItem(
                                  label: "Total",
                                  price: oCcy.format(orderDetail.total)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12.0),
                          child: ContraButtonSolid(
                            text: "Order",
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ContraToastScreen(
                                    title: "Complete",
                                    type: ContraToastType.success,
                                    subtitle: 'Order has been placed',
                                    onDismiss: () {
                                      Navigator.pushNamedAndRemoveUntil(
                                          context, '/', (_) => false);
                                    },
                                  ),
                                ),
                              );
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => ContraToastScreen(
                              //       title: "Error",
                              //       type: ContraToastType.error,
                              //       subtitle: 'Order has been canceled',
                              //       onDismiss: () {
                              //         Navigator.pop(context);
                              //       },
                              //     ),
                              //   ),
                              // );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _OrderItem {
  final String name;
  final double price;
  final double quantity;
  final double total;

  _OrderItem({
    required this.name,
    required this.price,
    required this.quantity,
    required this.total,
  });
}

class _OrderDetail {
  late double subtotal;
  late double total;
  late double platformFee;
  _OrderDetail({
    this.subtotal = 0,
    this.total = 0,
    this.platformFee = 0,
  });
}

class _OrderListItem extends StatelessWidget {
  final dynamic label;
  final String price;

  const _OrderListItem({
    Key? key,
    required this.label,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers, avoid_init_to_null
    late Widget? _label = null;
    if (label is Widget) _label = label;
    if (label is String) {
      _label = ContraText(
        alignment: Alignment.centerLeft,
        text: label,
        size: 16,
        weight: FontWeight.normal,
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (_label != null) Expanded(flex: 1, child: _label),
          ContraText(
            alignment: Alignment.topLeft,
            text: "Rp. $price",
            size: 16,
            weight: FontWeight.normal,
          ),
        ],
      ),
    );
  }
}
