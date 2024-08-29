import 'package:json_annotation/json_annotation.dart';

part 'example_response.g.dart';

@JsonSerializable()
class ExampleResponse {
  @JsonKey(name: "status")
  final String? status;

  @JsonKey(name: "message")
  final String? message;

  @JsonKey(name: "user_login")
  final String? userLogin;

  @JsonKey(name: "user_phone")
  final String? userPhone;

  @JsonKey(name: "user_fullname")
  final String? userFullname;

  @JsonKey(name: "redirect")
  final String? redirect;

  ExampleResponse({
    required this.status,
    required this.message,
    required this.userLogin,
    required this.userPhone,
    required this.userFullname,
    required this.redirect,
  });

  factory ExampleResponse.fromJson(Map<String, dynamic> json) =>
      _$ExampleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ExampleResponseToJson(this);
}
