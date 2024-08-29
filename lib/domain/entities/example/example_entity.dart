import 'package:flutter_base_project/data/models/response/example/example_response.dart';

class ExampleEntity {
  final String status;
  final String message;
  final String redirect;
  final String userLogin;
  final String userPhone;
  final String userFullname;

  ExampleEntity({
    required this.status,
    required this.message,
    required this.redirect,
    required this.userLogin,
    required this.userPhone,
    required this.userFullname,
  });

  ExampleEntity copyWith({
    String? status,
    String? message,
    String? redirect,
    String? userLogin,
    String? userPhone,
    String? userFullname,
  }) {
    return ExampleEntity(
      status: status ?? this.status,
      message: message ?? this.message,
      redirect: redirect ?? this.redirect,
      userLogin: userLogin ?? this.userLogin,
      userPhone: userPhone ?? this.userPhone,
      userFullname: userFullname ?? this.userFullname,
    );
  }

  factory ExampleEntity.empty() {
    return ExampleEntity(
      status: '',
      message: '',
      redirect: '',
      userLogin: '',
      userFullname: '',
      userPhone: '',
    );
  }

  static ExampleEntity fromResponse(ExampleResponse response) {
    return ExampleEntity(
      status: response.status ?? "",
      message: response.message ?? "",
      redirect: response.redirect ?? "",
      userLogin: response.userLogin ?? "",
      userFullname: response.userFullname ?? "",
      userPhone: response.userPhone ?? "",
    );
  }
}
