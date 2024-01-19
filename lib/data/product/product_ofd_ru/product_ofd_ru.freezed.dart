// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_ofd_ru.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductOfdRu _$ProductOfdRuFromJson(Map<String, dynamic> json) {
  return _ProductOfdRu.fromJson(json);
}

/// @nodoc
mixin _$ProductOfdRu {
  @JsonKey(name: "Name")
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: "Price", fromJson: moneyFromJson)
  double get price => throw _privateConstructorUsedError;
  @JsonKey(name: "Quantity")
  double get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: "Total", fromJson: moneyFromJson)
  double get sum => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductOfdRuCopyWith<ProductOfdRu> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductOfdRuCopyWith<$Res> {
  factory $ProductOfdRuCopyWith(
          ProductOfdRu value, $Res Function(ProductOfdRu) then) =
      _$ProductOfdRuCopyWithImpl<$Res, ProductOfdRu>;
  @useResult
  $Res call(
      {@JsonKey(name: "Name") String name,
      @JsonKey(name: "Price", fromJson: moneyFromJson) double price,
      @JsonKey(name: "Quantity") double quantity,
      @JsonKey(name: "Total", fromJson: moneyFromJson) double sum});
}

/// @nodoc
class _$ProductOfdRuCopyWithImpl<$Res, $Val extends ProductOfdRu>
    implements $ProductOfdRuCopyWith<$Res> {
  _$ProductOfdRuCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? price = null,
    Object? quantity = null,
    Object? sum = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      sum: null == sum
          ? _value.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductOfdRuImplCopyWith<$Res>
    implements $ProductOfdRuCopyWith<$Res> {
  factory _$$ProductOfdRuImplCopyWith(
          _$ProductOfdRuImpl value, $Res Function(_$ProductOfdRuImpl) then) =
      __$$ProductOfdRuImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Name") String name,
      @JsonKey(name: "Price", fromJson: moneyFromJson) double price,
      @JsonKey(name: "Quantity") double quantity,
      @JsonKey(name: "Total", fromJson: moneyFromJson) double sum});
}

/// @nodoc
class __$$ProductOfdRuImplCopyWithImpl<$Res>
    extends _$ProductOfdRuCopyWithImpl<$Res, _$ProductOfdRuImpl>
    implements _$$ProductOfdRuImplCopyWith<$Res> {
  __$$ProductOfdRuImplCopyWithImpl(
      _$ProductOfdRuImpl _value, $Res Function(_$ProductOfdRuImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? price = null,
    Object? quantity = null,
    Object? sum = null,
  }) {
    return _then(_$ProductOfdRuImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      sum: null == sum
          ? _value.sum
          : sum // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductOfdRuImpl implements _ProductOfdRu {
  const _$ProductOfdRuImpl(
      {@JsonKey(name: "Name") required this.name,
      @JsonKey(name: "Price", fromJson: moneyFromJson) required this.price,
      @JsonKey(name: "Quantity") required this.quantity,
      @JsonKey(name: "Total", fromJson: moneyFromJson) required this.sum});

  factory _$ProductOfdRuImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductOfdRuImplFromJson(json);

  @override
  @JsonKey(name: "Name")
  final String name;
  @override
  @JsonKey(name: "Price", fromJson: moneyFromJson)
  final double price;
  @override
  @JsonKey(name: "Quantity")
  final double quantity;
  @override
  @JsonKey(name: "Total", fromJson: moneyFromJson)
  final double sum;

  @override
  String toString() {
    return 'ProductOfdRu(name: $name, price: $price, quantity: $quantity, sum: $sum)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductOfdRuImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.sum, sum) || other.sum == sum));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, price, quantity, sum);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductOfdRuImplCopyWith<_$ProductOfdRuImpl> get copyWith =>
      __$$ProductOfdRuImplCopyWithImpl<_$ProductOfdRuImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductOfdRuImplToJson(
      this,
    );
  }
}

abstract class _ProductOfdRu implements ProductOfdRu {
  const factory _ProductOfdRu(
      {@JsonKey(name: "Name") required final String name,
      @JsonKey(name: "Price", fromJson: moneyFromJson)
      required final double price,
      @JsonKey(name: "Quantity") required final double quantity,
      @JsonKey(name: "Total", fromJson: moneyFromJson)
      required final double sum}) = _$ProductOfdRuImpl;

  factory _ProductOfdRu.fromJson(Map<String, dynamic> json) =
      _$ProductOfdRuImpl.fromJson;

  @override
  @JsonKey(name: "Name")
  String get name;
  @override
  @JsonKey(name: "Price", fromJson: moneyFromJson)
  double get price;
  @override
  @JsonKey(name: "Quantity")
  double get quantity;
  @override
  @JsonKey(name: "Total", fromJson: moneyFromJson)
  double get sum;
  @override
  @JsonKey(ignore: true)
  _$$ProductOfdRuImplCopyWith<_$ProductOfdRuImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
