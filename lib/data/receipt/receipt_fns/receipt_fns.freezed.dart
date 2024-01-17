// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receipt_fns.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReceiptFns _$ReceiptFnsFromJson(Map<String, dynamic> json) {
  return _ReceiptFns.fromJson(json);
}

/// @nodoc
mixin _$ReceiptFns {
  String get retailPlace => throw _privateConstructorUsedError;
  double get totalSum => throw _privateConstructorUsedError;
  @JsonKey(name: "items")
  List<ProductFns> get products => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReceiptFnsCopyWith<ReceiptFns> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiptFnsCopyWith<$Res> {
  factory $ReceiptFnsCopyWith(
          ReceiptFns value, $Res Function(ReceiptFns) then) =
      _$ReceiptFnsCopyWithImpl<$Res, ReceiptFns>;
  @useResult
  $Res call(
      {String retailPlace,
      double totalSum,
      @JsonKey(name: "items") List<ProductFns> products});
}

/// @nodoc
class _$ReceiptFnsCopyWithImpl<$Res, $Val extends ReceiptFns>
    implements $ReceiptFnsCopyWith<$Res> {
  _$ReceiptFnsCopyWithImpl(this._value, this._then);

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
              as List<ProductFns>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReceiptFnsImplCopyWith<$Res>
    implements $ReceiptFnsCopyWith<$Res> {
  factory _$$ReceiptFnsImplCopyWith(
          _$ReceiptFnsImpl value, $Res Function(_$ReceiptFnsImpl) then) =
      __$$ReceiptFnsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String retailPlace,
      double totalSum,
      @JsonKey(name: "items") List<ProductFns> products});
}

/// @nodoc
class __$$ReceiptFnsImplCopyWithImpl<$Res>
    extends _$ReceiptFnsCopyWithImpl<$Res, _$ReceiptFnsImpl>
    implements _$$ReceiptFnsImplCopyWith<$Res> {
  __$$ReceiptFnsImplCopyWithImpl(
      _$ReceiptFnsImpl _value, $Res Function(_$ReceiptFnsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? retailPlace = null,
    Object? totalSum = null,
    Object? products = null,
  }) {
    return _then(_$ReceiptFnsImpl(
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
              as List<ProductFns>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ReceiptFnsImpl implements _ReceiptFns {
  const _$ReceiptFnsImpl(
      {required this.retailPlace,
      required this.totalSum,
      @JsonKey(name: "items") required final List<ProductFns> products})
      : _products = products;

  factory _$ReceiptFnsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReceiptFnsImplFromJson(json);

  @override
  final String retailPlace;
  @override
  final double totalSum;
  final List<ProductFns> _products;
  @override
  @JsonKey(name: "items")
  List<ProductFns> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'ReceiptFns(retailPlace: $retailPlace, totalSum: $totalSum, products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiptFnsImpl &&
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
  _$$ReceiptFnsImplCopyWith<_$ReceiptFnsImpl> get copyWith =>
      __$$ReceiptFnsImplCopyWithImpl<_$ReceiptFnsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReceiptFnsImplToJson(
      this,
    );
  }
}

abstract class _ReceiptFns implements ReceiptFns {
  const factory _ReceiptFns(
          {required final String retailPlace,
          required final double totalSum,
          @JsonKey(name: "items") required final List<ProductFns> products}) =
      _$ReceiptFnsImpl;

  factory _ReceiptFns.fromJson(Map<String, dynamic> json) =
      _$ReceiptFnsImpl.fromJson;

  @override
  String get retailPlace;
  @override
  double get totalSum;
  @override
  @JsonKey(name: "items")
  List<ProductFns> get products;
  @override
  @JsonKey(ignore: true)
  _$$ReceiptFnsImplCopyWith<_$ReceiptFnsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
