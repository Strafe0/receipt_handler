import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:receipt_handler/data/product/product_ofd_ru/product_ofd_ru.dart';
import 'package:receipt_handler/data/receipt/receipt_interface.dart';
import 'package:receipt_handler/utils/money_from_json.dart';

part 'receipt_ofd_ru.freezed.dart';
part 'receipt_ofd_ru.g.dart';

@freezed
class ReceiptOfdRu with _$ReceiptOfdRu implements IReceipt {
  @JsonSerializable(explicitToJson: true)
  const factory ReceiptOfdRu({
    @JsonKey(name: "User") required String retailPlace,
    @JsonKey(name: "Amount_Total", fromJson: moneyFromJson) required double totalSum,
    @JsonKey(name: "Items") required List<ProductOfdRu> products,
    @JsonKey(name: "DateTime") required DateTime dateTime,
  }) = _ReceiptOfdRu;

  factory ReceiptOfdRu.fromJson(Map<String, dynamic> json) => _$ReceiptOfdRuFromJson(json);
}