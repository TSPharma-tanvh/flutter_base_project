// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_second_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExampleSecondRequest _$ExampleSecondRequestFromJson(
        Map<String, dynamic> json) =>
    ExampleSecondRequest(
      dispatch: json['dispatch'] as String,
      func: json['func'] as String,
      userLogin: json['user_login'] as String,
      userType: json['user_type'] as String,
      readPolicy: (json['read_policy'] as num).toInt(),
      deviceId: json['deviceid'] as String,
    );

Map<String, dynamic> _$ExampleSecondRequestToJson(
        ExampleSecondRequest instance) =>
    <String, dynamic>{
      'dispatch': instance.dispatch,
      'func': instance.func,
      'user_login': instance.userLogin,
      'user_type': instance.userType,
      'read_policy': instance.readPolicy,
      'deviceid': instance.deviceId,
    };
