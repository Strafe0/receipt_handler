// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_fns.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReceiptFnsImpl _$$ReceiptFnsImplFromJson(Map<String, dynamic> json) =>
    _$ReceiptFnsImpl(
      retailPlace: json['retailPlace'] as String,
      totalSum: moneyFromJson(json['totalSum']),
      products: (json['items'] as List<dynamic>)
          .map((e) => ProductFns.fromJson(e as Map<String, dynamic>))
          .toList(),
      dateTime: DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$$ReceiptFnsImplToJson(_$ReceiptFnsImpl instance) =>
    <String, dynamic>{
      'retailPlace': instance.retailPlace,
      'totalSum': instance.totalSum,
      'items': instance.products.map((e) => e.toJson()).toList(),
      'dateTime': instance.dateTime.toIso8601String(),
    };
