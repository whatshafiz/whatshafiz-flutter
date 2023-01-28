import 'Settings.dart';

class SettingsModel {
  SettingsModel({
    this.settings,
  });

  SettingsModel.fromJson(dynamic json) {
    if (json['settings'] != null) {
      settings = [];
      json['settings'].forEach((v) {
        print("==> saf $v");
        settings?.add(Settings.fromJson(v));
      });
    }
  }

  List<Settings>? settings;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (settings != null) {
      map['settings'] = settings?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
