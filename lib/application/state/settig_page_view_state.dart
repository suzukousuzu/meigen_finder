class SettingPageViewState {
  final String appVersion;

//<editor-fold desc="Data Methods">
  const SettingPageViewState({
    required this.appVersion,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SettingPageViewState &&
          runtimeType == other.runtimeType &&
          appVersion == other.appVersion);

  @override
  int get hashCode => appVersion.hashCode;

  @override
  String toString() {
    return 'SettingPageViewState{' + ' appVersion: $appVersion,' + '}';
  }

  SettingPageViewState copyWith({
    String? appVersion,
  }) {
    return SettingPageViewState(
      appVersion: appVersion ?? this.appVersion,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'appVersion': this.appVersion,
    };
  }

  factory SettingPageViewState.fromMap(Map<String, dynamic> map) {
    return SettingPageViewState(
      appVersion: map['appVersion'] as String,
    );
  }

//</editor-fold>
}
