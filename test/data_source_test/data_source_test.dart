


import 'dart:io';


import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:pruebab/data_source/rest_data_sorce.dart';

void main() {
  test('User name is fetched correctly', () async {
    final dataSource = _getDataSource('api_name.json');
    final name = await dataSource.getName();

    expect(name.title, 'Mrs');
    expect(name.first, 'Ria');
    expect(name.last, 'Krauss');
  });

  test('Location is fetched correctly', () async {
    final dataSource = _getDataSource('api_location.json');
    final location = await dataSource.getLocation();

    expect(location.city, 'Red Rock');
    expect(location.state, 'Ontario');
  });

  test('Picture is fetched correctly', () async {
    final dataSource = _getDataSource('api_picture.json');
    final picture = await dataSource.getPicture();

    expect(picture.thumbnail, contains("https://randomuser.me/api/portraits/thumb/men/85.jpg"));
  });

  test('Exception is thrown correctly', () async {
    final provider = _getDataSource('api_invalid.json');

    expect(provider.getName(), throwsNoSuchMethodError);
  });
}

final headers = {
  HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
};

RestDataSource _getDataSource(String fileName) =>
    RestDataSource(httpClient: _getMockProvider(fileName));

MockClient _getMockProvider(String fileName) {
  return MockClient((_) async {
    final fileData =
    await File('test/data_source_test/$fileName').readAsString();
    return Response(fileData, 200, headers: headers);
  });
}

