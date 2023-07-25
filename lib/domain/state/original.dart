import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meigen_finder/domain/state/converter/quote_converter.dart';
import 'package:meigen_finder/domain/state/quote.dart';

part 'original.freezed.dart';

@freezed
class Original with _$Original {
  const factory Original({
    @QuoteConverter() required Quote quote,
  }) = _Original;
}
