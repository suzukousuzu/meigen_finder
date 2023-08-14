import 'package:meigen_finder/domain/collection/emotional_type.dart';
import 'package:meigen_finder/domain/collection/todays_quote.dart';

class HomePageViewState {
  EmotionalType? emotionalType;
  TodaysQuote? todaysQuote;

//<editor-fold desc="Data Methods">
  HomePageViewState({
    this.emotionalType,
    this.todaysQuote,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HomePageViewState &&
          runtimeType == other.runtimeType &&
          emotionalType == other.emotionalType &&
          todaysQuote == other.todaysQuote);

  @override
  int get hashCode => emotionalType.hashCode ^ todaysQuote.hashCode;

  @override
  String toString() {
    return 'HomePageViewState{' +
        ' emotionalType: $emotionalType,' +
        ' todaysQuote: $todaysQuote,' +
        '}';
  }

  HomePageViewState copyWith({
    EmotionalType? emotionalType,
    TodaysQuote? todaysQuote,
  }) {
    return HomePageViewState(
      emotionalType: emotionalType ?? this.emotionalType,
      todaysQuote: todaysQuote ?? this.todaysQuote,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'emotionalType': this.emotionalType,
      'todaysQuote': this.todaysQuote,
    };
  }

  factory HomePageViewState.fromMap(Map<String, dynamic> map) {
    return HomePageViewState(
      emotionalType: map['emotionalType'] as EmotionalType,
      todaysQuote: map['todaysQuote'] as TodaysQuote,
    );
  }

//</editor-fold>
}

extension Computed on HomePageViewState {
  bool get isButtonEnable => emotionalType != null && todaysQuote != null;
}
