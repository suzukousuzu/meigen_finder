// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'original.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Original {
  @QuoteConverter()
  Quote get quote => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OriginalCopyWith<Original> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OriginalCopyWith<$Res> {
  factory $OriginalCopyWith(Original value, $Res Function(Original) then) =
      _$OriginalCopyWithImpl<$Res, Original>;
  @useResult
  $Res call({@QuoteConverter() Quote quote});

  $QuoteCopyWith<$Res> get quote;
}

/// @nodoc
class _$OriginalCopyWithImpl<$Res, $Val extends Original>
    implements $OriginalCopyWith<$Res> {
  _$OriginalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quote = null,
  }) {
    return _then(_value.copyWith(
      quote: null == quote
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as Quote,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $QuoteCopyWith<$Res> get quote {
    return $QuoteCopyWith<$Res>(_value.quote, (value) {
      return _then(_value.copyWith(quote: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OriginalCopyWith<$Res> implements $OriginalCopyWith<$Res> {
  factory _$$_OriginalCopyWith(
          _$_Original value, $Res Function(_$_Original) then) =
      __$$_OriginalCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@QuoteConverter() Quote quote});

  @override
  $QuoteCopyWith<$Res> get quote;
}

/// @nodoc
class __$$_OriginalCopyWithImpl<$Res>
    extends _$OriginalCopyWithImpl<$Res, _$_Original>
    implements _$$_OriginalCopyWith<$Res> {
  __$$_OriginalCopyWithImpl(
      _$_Original _value, $Res Function(_$_Original) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quote = null,
  }) {
    return _then(_$_Original(
      quote: null == quote
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as Quote,
    ));
  }
}

/// @nodoc

class _$_Original implements _Original {
  const _$_Original({@QuoteConverter() required this.quote});

  @override
  @QuoteConverter()
  final Quote quote;

  @override
  String toString() {
    return 'Original(quote: $quote)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Original &&
            (identical(other.quote, quote) || other.quote == quote));
  }

  @override
  int get hashCode => Object.hash(runtimeType, quote);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OriginalCopyWith<_$_Original> get copyWith =>
      __$$_OriginalCopyWithImpl<_$_Original>(this, _$identity);
}

abstract class _Original implements Original {
  const factory _Original({@QuoteConverter() required final Quote quote}) =
      _$_Original;

  @override
  @QuoteConverter()
  Quote get quote;
  @override
  @JsonKey(ignore: true)
  _$$_OriginalCopyWith<_$_Original> get copyWith =>
      throw _privateConstructorUsedError;
}
