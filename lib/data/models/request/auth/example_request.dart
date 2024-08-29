import 'package:json_annotation/json_annotation.dart';

part 'example_request.g.dart';

@JsonSerializable()
class ExampleRequest {
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

  ExampleRequest({
    required this.dispatch,
    required this.func,
    required this.userLogin,
    required this.userType,
    required this.readPolicy,
    required this.deviceId,
  });

  factory ExampleRequest.fromJson(Map<String, dynamic> json) =>
      _$ExampleRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ExampleRequestToJson(this);
}
