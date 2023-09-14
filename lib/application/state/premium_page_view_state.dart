class PremiumPageViewState {
  final bool isPremium;
  final String premiumPriceString;

//<editor-fold desc="Data Methods">
  const PremiumPageViewState({
    required this.isPremium,
    required this.premiumPriceString,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PremiumPageViewState &&
          runtimeType == other.runtimeType &&
          isPremium == other.isPremium &&
          premiumPriceString == other.premiumPriceString);

  @override
  int get hashCode => isPremium.hashCode ^ premiumPriceString.hashCode;

  @override
  String toString() {
    return 'PremiumPageViewState{' +
        ' isPremium: $isPremium,' +
        ' premiumPriceString: $premiumPriceString,' +
        '}';
  }

  PremiumPageViewState copyWith({
    bool? isPremium,
    String? premiumPriceString,
  }) {
    return PremiumPageViewState(
      isPremium: isPremium ?? this.isPremium,
      premiumPriceString: premiumPriceString ?? this.premiumPriceString,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isPremium': isPremium,
      'premiumPriceString': premiumPriceString,
    };
  }

  factory PremiumPageViewState.fromMap(Map<String, dynamic> map) {
    return PremiumPageViewState(
      isPremium: map['isPremium'] as bool,
      premiumPriceString: map['premiumPriceString'] as String,
    );
  }

//</editor-fold>
}