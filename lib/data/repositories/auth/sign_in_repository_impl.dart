import 'package:core/core.dart';
import 'package:flutter_base_project/data/datasource/remote/base_repository.dart';
import 'package:flutter_base_project/data/models/request/auth/example_request.dart';
import 'package:flutter_base_project/data/models/request/auth/example_second_request.dart';
import 'package:flutter_base_project/data/models/response/base/base_response.dart';
import 'package:flutter_base_project/domain/entities/example/example_entity.dart';
import 'package:flutter_base_project/domain/repositories/example/example_repository.dart';

class ExampleRepositoryImpl extends BaseRepository
    implements ExampleRepository {
  @override
  Future<bool> exampleGet(ExampleRequest request) async {
    late bool isDone = false;

    final queries = request.toJson();

    final result = await ResultUtilsCore.guardAsync(
        () => get("/the link to api after baseUrl", null, queries));

    // Handle the result
    await result.ifSuccess((data) async {
      final data = result.data;
      final response = BaseResponse.fromJson(data?.data);
      if (response.status == "OK") {
        isDone = true;
      }
    });

    return isDone;
  }

  @override
  Future<ExampleEntity> examplePost(ExampleSecondRequest request) async {
    // TODO: implement examplePost
    throw UnimplementedError();
  }
}
