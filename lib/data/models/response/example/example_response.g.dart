// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExampleResponse _$ExampleResponseFromJson(Map<String, dynamic> json) =>
    ExampleResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
      userLogin: json['user_login'] as String?,
      userPhone: json['user_phone'] as String?,
      userFullname: json['user_fullname'] as String?,
      redirect: json['redirect'] as String?,
    );

Map<String, dynamic> _$ExampleResponseToJson(ExampleResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'user_login': instance.userLogin,
      'user_phone': instance.userPhone,
      'user_fullname': instance.userFullname,
      'redirect': instance.redirect,
    };
