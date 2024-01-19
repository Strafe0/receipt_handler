// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_ofd_ru.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductOfdRuImpl _$$ProductOfdRuImplFromJson(Map<String, dynamic> json) =>
    _$ProductOfdRuImpl(
      name: json['Name'] as String,
      price: moneyFromJson(json['Price']),
      quantity: (json['Quantity'] as num).toDouble(),
      sum: moneyFromJson(json['Total']),
    );

Map<String, dynamic> _$$ProductOfdRuImplToJson(_$ProductOfdRuImpl instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Price': instance.price,
      'Quantity': instance.quantity,
      'Total': instance.sum,
    };
