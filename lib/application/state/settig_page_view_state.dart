enum PushNotificationStatus {
  on,
  off,
}

class SettingPageViewState {
  final String appVersion;
  final PushNotificationStatus pushNotificationStatus;

//<editor-fold desc="Data Methods">
  const SettingPageViewState({
    required this.appVersion,
    required this.pushNotificationStatus,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SettingPageViewState &&
          runtimeType == other.runtimeType &&
          appVersion == other.appVersion &&
          pushNotificationStatus == other.pushNotificationStatus);

  @override
  int get hashCode => appVersion.hashCode ^ pushNotificationStatus.hashCode;

  @override
  String toString() {
    return 'SettingPageViewState{ appVersion: $appVersion, pushNotificationStatus: $pushNotificationStatus,}';
  }

  SettingPageViewState copyWith({
    String? appVersion,
    PushNotificationStatus? pushNotificationStatus,
  }) {
    return SettingPageViewState(
      appVersion: appVersion ?? this.appVersion,
      pushNotificationStatus:
          pushNotificationStatus ?? this.pushNotificationStatus,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'appVersion': this.appVersion,
      'pushNotificationStatus': this.pushNotificationStatus,
    };
  }

  factory SettingPageViewState.fromMap(Map<String, dynamic> map) {
    return SettingPageViewState(
      appVersion: map['appVersion'] as String,
      pushNotificationStatus:
          map['pushNotificationStatus'] as PushNotificationStatus,
    );
  }

//</editor-fold>
}
