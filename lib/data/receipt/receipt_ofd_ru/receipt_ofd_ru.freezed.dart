// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receipt_ofd_ru.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReceiptOfdRu _$ReceiptOfdRuFromJson(Map<String, dynamic> json) {
  return _ReceiptOfdRu.fromJson(json);
}

/// @nodoc
mixin _$ReceiptOfdRu {
  @JsonKey(name: "Calculation_Place")
  String get retailPlace => throw _privateConstructorUsedError;
  @JsonKey(name: "Amount_Total", fromJson: moneyFromJson)
  double get totalSum => throw _privateConstructorUsedError;
  @JsonKey(name: "Items")
  List<ProductOfdRu> get products => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReceiptOfdRuCopyWith<ReceiptOfdRu> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiptOfdRuCopyWith<$Res> {
  factory $ReceiptOfdRuCopyWith(
          ReceiptOfdRu value, $Res Function(ReceiptOfdRu) then) =
      _$ReceiptOfdRuCopyWithImpl<$Res, ReceiptOfdRu>;
  @useResult
  $Res call(
      {@JsonKey(name: "Calculation_Place") String retailPlace,
      @JsonKey(name: "Amount_Total", fromJson: moneyFromJson) double totalSum,
      @JsonKey(name: "Items") List<ProductOfdRu> products});
}

/// @nodoc
class _$ReceiptOfdRuCopyWithImpl<$Res, $Val extends ReceiptOfdRu>
    implements $ReceiptOfdRuCopyWith<$Res> {
  _$ReceiptOfdRuCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? retailPlace = null,
    Object? totalSum = null,
    Object? products = null,
  }) {
    return _then(_value.copyWith(
      retailPlace: null == retailPlace
          ? _value.retailPlace
          : retailPlace // ignore: cast_nullable_to_non_nullable
              as String,
      totalSum: null == totalSum
          ? _value.totalSum
          : totalSum // ignore: cast_nullable_to_non_nullable
              as double,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductOfdRu>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReceiptOfdRuImplCopyWith<$Res>
    implements $ReceiptOfdRuCopyWith<$Res> {
  factory _$$ReceiptOfdRuImplCopyWith(
          _$ReceiptOfdRuImpl value, $Res Function(_$ReceiptOfdRuImpl) then) =
      __$$ReceiptOfdRuImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "Calculation_Place") String retailPlace,
      @JsonKey(name: "Amount_Total", fromJson: moneyFromJson) double totalSum,
      @JsonKey(name: "Items") List<ProductOfdRu> products});
}

/// @nodoc
class __$$ReceiptOfdRuImplCopyWithImpl<$Res>
    extends _$ReceiptOfdRuCopyWithImpl<$Res, _$ReceiptOfdRuImpl>
    implements _$$ReceiptOfdRuImplCopyWith<$Res> {
  __$$ReceiptOfdRuImplCopyWithImpl(
      _$ReceiptOfdRuImpl _value, $Res Function(_$ReceiptOfdRuImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? retailPlace = null,
    Object? totalSum = null,
    Object? products = null,
  }) {
    return _then(_$ReceiptOfdRuImpl(
      retailPlace: null == retailPlace
          ? _value.retailPlace
          : retailPlace // ignore: cast_nullable_to_non_nullable
              as String,
      totalSum: null == totalSum
          ? _value.totalSum
          : totalSum // ignore: cast_nullable_to_non_nullable
              as double,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductOfdRu>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ReceiptOfdRuImpl implements _ReceiptOfdRu {
  const _$ReceiptOfdRuImpl(
      {@JsonKey(name: "Calculation_Place") required this.retailPlace,
      @JsonKey(name: "Amount_Total", fromJson: moneyFromJson)
      required this.totalSum,
      @JsonKey(name: "Items") required final List<ProductOfdRu> products})
      : _products = products;

  factory _$ReceiptOfdRuImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReceiptOfdRuImplFromJson(json);

  @override
  @JsonKey(name: "Calculation_Place")
  final String retailPlace;
  @override
  @JsonKey(name: "Amount_Total", fromJson: moneyFromJson)
  final double totalSum;
  final List<ProductOfdRu> _products;
  @override
  @JsonKey(name: "Items")
  List<ProductOfdRu> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'ReceiptOfdRu(retailPlace: $retailPlace, totalSum: $totalSum, products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiptOfdRuImpl &&
            (identical(other.retailPlace, retailPlace) ||
                other.retailPlace == retailPlace) &&
            (identical(other.totalSum, totalSum) ||
                other.totalSum == totalSum) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, retailPlace, totalSum,
      const DeepCollectionEquality().hash(_products));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiptOfdRuImplCopyWith<_$ReceiptOfdRuImpl> get copyWith =>
      __$$ReceiptOfdRuImplCopyWithImpl<_$ReceiptOfdRuImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReceiptOfdRuImplToJson(
      this,
    );
  }
}

abstract class _ReceiptOfdRu implements ReceiptOfdRu {
  const factory _ReceiptOfdRu(
      {@JsonKey(name: "Calculation_Place") required final String retailPlace,
      @JsonKey(name: "Amount_Total", fromJson: moneyFromJson)
      required final double totalSum,
      @JsonKey(name: "Items")
      required final List<ProductOfdRu> products}) = _$ReceiptOfdRuImpl;

  factory _ReceiptOfdRu.fromJson(Map<String, dynamic> json) =
      _$ReceiptOfdRuImpl.fromJson;

  @override
  @JsonKey(name: "Calculation_Place")
  String get retailPlace;
  @override
  @JsonKey(name: "Amount_Total", fromJson: moneyFromJson)
  double get totalSum;
  @override
  @JsonKey(name: "Items")
  List<ProductOfdRu> get products;
  @override
  @JsonKey(ignore: true)
  _$$ReceiptOfdRuImplCopyWith<_$ReceiptOfdRuImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
