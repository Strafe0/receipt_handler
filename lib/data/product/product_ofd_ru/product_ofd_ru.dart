import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:receipt_handler/data/product/product_interface.dart';
import 'package:receipt_handler/utils/from_json_functions.dart';

part 'product_ofd_ru.freezed.dart';
part 'product_ofd_ru.g.dart';

@freezed
class ProductOfdRu with _$ProductOfdRu implements IProduct {
  const factory ProductOfdRu({
    @JsonKey(name: "Name") required String name,
    @JsonKey(name: "Price", fromJson: moneyFromJson) required double price,
    @JsonKey(name: "Quantity") required double quantity,
    @JsonKey(name: "Total", fromJson: moneyFromJson) required double sum,
  }) = _ProductOfdRu;

  factory ProductOfdRu.fromJson(Map<String, dynamic> json) => _$ProductOfdRuFromJson(json);
}