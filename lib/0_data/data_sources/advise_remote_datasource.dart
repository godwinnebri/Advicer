import 'dart:convert';

import 'package:adviser_app/0_data/exceptions/exceptions.dart';
import 'package:adviser_app/0_data/models/advise_model.dart';
import 'package:http/http.dart' as http;

abstract class AdviseRemoteDataSource {
  /// requests random advise from api
  /// returns [AdviseModel] if successful
  /// throws a server exception if status code != 200
  Future<AdviseModel> getRandomAdviseFromApi();
}

class AdviseRemoteDataSourceImpl implements AdviseRemoteDataSource {
  AdviseRemoteDataSourceImpl({required this.client});
  final http.Client client;

  @override
  Future<AdviseModel> getRandomAdviseFromApi() async {
    final response = await client.get(
        Uri.parse('https://api.flutter-community.com/api/v1/advice'),
        headers: {
          'content-type': 'application/json',
        });
    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final responseBody = json.decode(response.body);
      return AdviseModel.fromJson(responseBody);
    }
  }
}
