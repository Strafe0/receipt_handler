// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_fns.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductFnsImpl _$$ProductFnsImplFromJson(Map<String, dynamic> json) =>
    _$ProductFnsImpl(
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: (json['quantity'] as num).toDouble(),
      sum: (json['sum'] as num).toDouble(),
    );

Map<String, dynamic> _$$ProductFnsImplToJson(_$ProductFnsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'quantity': instance.quantity,
      'sum': instance.sum,
    };
