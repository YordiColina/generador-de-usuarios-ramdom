

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:mockito/annotations.dart';
import 'package:pruebab/data_source/db_data_source.dart';
import 'package:pruebab/data_source/rest_data_sorce.dart';
import 'package:pruebab/models/user.dart';
import 'package:pruebab/models/user_location.dart';
import 'package:pruebab/models/user_name.dart';
import 'package:pruebab/models/user_picture.dart';
import 'package:pruebab/repository/user_repository.dart';

import 'user_repository_test.mocks.dart';


@GenerateMocks([RestDataSource, DbDataSource])
void main() {
  late MockRestDataSource restDataSource;
  late MockDbDataSource dBDataSource;

  late UserRepository repository;

  setUp(() {
    restDataSource = MockRestDataSource();
    dBDataSource = MockDbDataSource();

    repository = UserRepository(restDataSource, dBDataSource);
  });

  test('User is created successfully', () async {
    when(restDataSource.getName()).thenAnswer((_) async => mockName);
    when(restDataSource.getLocation()).thenAnswer((_) async => mockLocation);
    when(restDataSource.getPicture()).thenAnswer((_) async => mockImage);
    when(dBDataSource.save(any)).thenAnswer((_) async => 1);

    final newUser = await repository.getNewUser();

    expect(newUser.name, 'Yordi');
    expect(newUser.lastName, 'Colina');
    expect(newUser.city, 'Usaquen');
    expect(newUser.thumbnail, 'https://www.randomimage.com');

    verify(dBDataSource.save(newUser)).called(1);
  });

  test('Get all users successfully', () async {
    when(dBDataSource.getAllUsers()).thenAnswer((_) async => [mockUser]);

    final users = await repository.getAllUsers();

    expect(users.length, 1);
    expect(users[0].name, 'Yordi');
  });

  test('Delete user successfully', () async {
    when(dBDataSource.delete(mockUser)).thenAnswer((_) async => 1);
    final result = await repository.deleteUser(mockUser);

    expect(result, true);
  });
}

final mockName = UserName('Mr', 'Yordi', 'Colina');
final mockLocation = UserLocation('Usaquen', 'Bogota');
final mockImage = UserPicture('https://www.randomimage.com');
const mockUser =  User('Yordi', 'Colina', 'Colombia', 'https://www.someImage.com');




