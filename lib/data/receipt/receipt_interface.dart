import 'package:receipt_handler/data/product/product_interface.dart';

abstract class IReceipt {
  abstract final String retailPlace;
  abstract final List<IProduct> products;
  abstract final double totalSum;
  abstract final DateTime dateTime;
}

class EmptyReceipt implements IReceipt {
  @override
  final String retailPlace;
  @override
  final List<IProduct> products;
  @override
  final double totalSum;
  @override
  final DateTime dateTime;

  EmptyReceipt()
      : retailPlace = "",
        products = [],
        totalSum = 0,
        dateTime = DateTime(2023, 8, 26);
}