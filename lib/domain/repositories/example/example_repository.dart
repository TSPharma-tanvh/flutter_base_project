import 'package:flutter_base_project/data/models/request/auth/example_request.dart';
import 'package:flutter_base_project/data/models/request/auth/example_second_request.dart';
import 'package:flutter_base_project/domain/entities/example/example_entity.dart';

abstract class ExampleRepository {
  Future<bool> exampleGet(ExampleRequest request);

  Future<ExampleEntity> examplePost(ExampleSecondRequest request);
}
