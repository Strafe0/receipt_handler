// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_ofd_ru.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReceiptOfdRuImpl _$$ReceiptOfdRuImplFromJson(Map<String, dynamic> json) =>
    _$ReceiptOfdRuImpl(
      retailPlace: json['Calculation_Place'] as String,
      totalSum: moneyFromJson(json['Amount_Total']),
      products: (json['Items'] as List<dynamic>)
          .map((e) => ProductOfdRu.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ReceiptOfdRuImplToJson(_$ReceiptOfdRuImpl instance) =>
    <String, dynamic>{
      'Calculation_Place': instance.retailPlace,
      'Amount_Total': instance.totalSum,
      'Items': instance.products.map((e) => e.toJson()).toList(),
    };
