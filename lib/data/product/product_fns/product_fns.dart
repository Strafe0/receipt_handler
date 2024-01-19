import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:receipt_handler/data/product/product_interface.dart';
import 'package:receipt_handler/utils/money_from_json.dart';

part 'product_fns.freezed.dart';
part 'product_fns.g.dart';

@freezed
class ProductFns with _$ProductFns implements IProduct {
  const factory ProductFns(
      {required String name,
      @JsonKey(fromJson: moneyFromJson) required double price,
      required double quantity,
      @JsonKey(fromJson: moneyFromJson) required double sum}) = _ProductFns;

  factory ProductFns.fromJson(Map<String, dynamic> json) => _$ProductFnsFromJson(json);
}

