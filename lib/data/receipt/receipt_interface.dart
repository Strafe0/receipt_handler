import 'package:receipt_handler/data/product/product_interface.dart';

abstract class IReceipt {
  abstract final String retailPlace;
  abstract final List<IProduct> products;
  abstract final double totalSum;
}

class EmptyReceipt implements IReceipt {
  @override
  final String retailPlace;
  @override
  final List<IProduct> products;
  @override
  final double totalSum;

  EmptyReceipt()
      : retailPlace = "",
        products = [],
        totalSum = 0;
}