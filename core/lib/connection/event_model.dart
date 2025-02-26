part of '../core.dart';

class MiniAppEventCoreModel {
  final String? type;
  final String? value;

  MiniAppEventCoreModel({this.type, this.value});

  factory MiniAppEventCoreModel.fromJson(Map<String, dynamic> json) {
    return MiniAppEventCoreModel(
      type: json['type'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'value': value,
    };
  }

  @override
  String toString() => jsonEncode(toJson());
}
