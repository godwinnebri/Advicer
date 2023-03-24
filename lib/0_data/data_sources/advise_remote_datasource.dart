import 'dart:convert';

import 'package:adviser_app/0_data/exceptions/exceptions.dart';
import 'package:adviser_app/0_data/models/advice_model.dart';
import 'package:http/http.dart' as http;

abstract class AdviceRemoteDataSource {
  /// requests random advise from api
  /// returns [AdviceModel] if successful
  /// throws a server exception if status code != 200
  Future<AdviceModel> getRandomAdviseFromApi();
}

class AdviceRemoteDataSourceImpl implements AdviceRemoteDataSource {
  AdviceRemoteDataSourceImpl({required this.client});
  final http.Client client;

  @override
  Future<AdviceModel> getRandomAdviseFromApi() async {
    final response = await client.get(
        Uri.parse('https://api.flutter-community.com/api/v1/advice'),
        headers: {
          'content-type': 'application/json',
        });
    if (response.statusCode != 200) {
      throw ServerException();
    } else {
      final responseBody = json.decode(response.body);
      return AdviceModel.fromJson(responseBody);
    }
  }
}
