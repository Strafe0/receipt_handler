// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_fns.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductFns _$ProductFnsFromJson(Map<String, dynamic> json) {
  return _ProductFns.fromJson(json);
}

/// @nodoc
mixin _$ProductFns {
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  double get sum => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductFnsCopyWith<ProductFns> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductFnsCopyWith<$Res> {
  factory $ProductFnsCopyWith(
          ProductFns value, $Res Function(ProductFns) then) =
      _$ProductFnsCopyWithImpl<$Res, ProductFns>;
  @useResult
  $Res call({String name, double price, double quantity, double sum});
}

/// @nodoc
class _$ProductFnsCopyWithImpl<$Res, $Val extends ProductFns>
    implements $ProductFnsCopyWith<$Res> {
  _$ProductFnsCopyWithImpl(this._value, this._then);

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
abstract class _$$ProductFnsImplCopyWith<$Res>
    implements $ProductFnsCopyWith<$Res> {
  factory _$$ProductFnsImplCopyWith(
          _$ProductFnsImpl value, $Res Function(_$ProductFnsImpl) then) =
      __$$ProductFnsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, double price, double quantity, double sum});
}

/// @nodoc
class __$$ProductFnsImplCopyWithImpl<$Res>
    extends _$ProductFnsCopyWithImpl<$Res, _$ProductFnsImpl>
    implements _$$ProductFnsImplCopyWith<$Res> {
  __$$ProductFnsImplCopyWithImpl(
      _$ProductFnsImpl _value, $Res Function(_$ProductFnsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? price = null,
    Object? quantity = null,
    Object? sum = null,
  }) {
    return _then(_$ProductFnsImpl(
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
class _$ProductFnsImpl with DiagnosticableTreeMixin implements _ProductFns {
  const _$ProductFnsImpl(
      {required this.name,
      required this.price,
      required this.quantity,
      required this.sum});

  factory _$ProductFnsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductFnsImplFromJson(json);

  @override
  final String name;
  @override
  final double price;
  @override
  final double quantity;
  @override
  final double sum;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProductFns(name: $name, price: $price, quantity: $quantity, sum: $sum)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProductFns'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('quantity', quantity))
      ..add(DiagnosticsProperty('sum', sum));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductFnsImpl &&
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
  _$$ProductFnsImplCopyWith<_$ProductFnsImpl> get copyWith =>
      __$$ProductFnsImplCopyWithImpl<_$ProductFnsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductFnsImplToJson(
      this,
    );
  }
}

abstract class _ProductFns implements ProductFns {
  const factory _ProductFns(
      {required final String name,
      required final double price,
      required final double quantity,
      required final double sum}) = _$ProductFnsImpl;

  factory _ProductFns.fromJson(Map<String, dynamic> json) =
      _$ProductFnsImpl.fromJson;

  @override
  String get name;
  @override
  double get price;
  @override
  double get quantity;
  @override
  double get sum;
  @override
  @JsonKey(ignore: true)
  _$$ProductFnsImplCopyWith<_$ProductFnsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
