import 'package:json_annotation/json_annotation.dart';

part 'example_second_request.g.dart';

@JsonSerializable()
class ExampleSecondRequest {
  @JsonKey(name: 'dispatch')
  final String dispatch;

  @JsonKey(name: 'func')
  final String func;

  @JsonKey(name: 'user_login')
  final String userLogin;

  @JsonKey(name: 'user_type')
  final String userType;

  @JsonKey(name: 'read_policy')
  final int readPolicy;

  @JsonKey(name: 'deviceid')
  final String deviceId;

  ExampleSecondRequest({
    required this.dispatch,
    required this.func,
    required this.userLogin,
    required this.userType,
    required this.readPolicy,
    required this.deviceId,
  });

  factory ExampleSecondRequest.fromJson(Map<String, dynamic> json) =>
      _$ExampleSecondRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ExampleSecondRequestToJson(this);
}
