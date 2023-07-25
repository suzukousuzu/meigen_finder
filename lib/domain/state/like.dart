import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meigen_finder/domain/state/converter/quote_converter.dart';
import 'package:meigen_finder/domain/state/quote.dart';

part 'like.freezed.dart';

@freezed
class Like with _$Like {
  const factory Like({
    @QuoteConverter() required Quote quote,
  }) = _Like;
}
