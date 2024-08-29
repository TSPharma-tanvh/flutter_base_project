import 'package:flutter_base_project/data/models/request/auth/example_request.dart';
import 'package:flutter_base_project/data/models/request/auth/example_second_request.dart';
import 'package:flutter_base_project/domain/entities/example/example_entity.dart';
import 'package:flutter_base_project/domain/repositories/example/example_repository.dart';

class ExampleUsecase {
  final ExampleRepository _usecase;
  ExampleUsecase(this._usecase);

  Future<bool> exampleGet(ExampleRequest request) async {
    return await _usecase.exampleGet(request);
  }

  Future<ExampleEntity> examplePost(ExampleSecondRequest request) async {
    return await _usecase.examplePost(request);
  }
}
