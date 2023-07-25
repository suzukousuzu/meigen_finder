import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meigen_finder/domain/state/quote.dart';

class QuoteConverter implements JsonConverter<Quote, Map<String, dynamic>> {
  const QuoteConverter();

  @override
  Quote fromJson(Map<String, dynamic> json) {
    return Quote.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(Quote data) => data.toJson();
}
