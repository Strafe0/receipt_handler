import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:receipt_handler/data/product/product_fns/product_fns.dart';
import 'package:receipt_handler/data/receipt/receipt_interface.dart';
import 'package:receipt_handler/utils/money_from_json.dart';

part 'receipt_fns.freezed.dart';
part 'receipt_fns.g.dart';

@freezed
class ReceiptFns with _$ReceiptFns implements IReceipt {
  @JsonSerializable(explicitToJson: true)
  const factory ReceiptFns({
    required String retailPlace,
    @JsonKey(fromJson: moneyFromJson) required double totalSum,
    @JsonKey(name: "items") required List<ProductFns> products,
  }) = _ReceiptFns;

  factory ReceiptFns.fromJson(Map<String, dynamic> json) => _$ReceiptFnsFromJson(json);
}