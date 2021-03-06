// Mocks generated by Mockito 5.1.0 from annotations
// in pruebab/test/repository_test/user_repository_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i7;

import 'package:mockito/mockito.dart' as _i1;
import 'package:pruebab/data_source/db_data_source.dart' as _i8;
import 'package:pruebab/data_source/rest_data_sorce.dart' as _i6;
import 'package:pruebab/models/user.dart' as _i9;
import 'package:pruebab/models/user_location.dart' as _i3;
import 'package:pruebab/models/user_name.dart' as _i2;
import 'package:pruebab/models/user_picture.dart' as _i4;
import 'package:sqflite/sqflite.dart' as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeUserName_0 extends _i1.Fake implements _i2.UserName {}

class _FakeUserLocation_1 extends _i1.Fake implements _i3.UserLocation {}

class _FakeUserPicture_2 extends _i1.Fake implements _i4.UserPicture {}

class _FakeDatabase_3 extends _i1.Fake implements _i5.Database {}

/// A class which mocks [RestDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockRestDataSource extends _i1.Mock implements _i6.RestDataSource {
  MockRestDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i7.Future<_i2.UserName> getName() =>
      (super.noSuchMethod(Invocation.method(#getName, []),
              returnValue: Future<_i2.UserName>.value(_FakeUserName_0()))
          as _i7.Future<_i2.UserName>);
  @override
  _i7.Future<_i3.UserLocation> getLocation() => (super.noSuchMethod(
          Invocation.method(#getLocation, []),
          returnValue: Future<_i3.UserLocation>.value(_FakeUserLocation_1()))
      as _i7.Future<_i3.UserLocation>);
  @override
  _i7.Future<_i4.UserPicture> getPicture() =>
      (super.noSuchMethod(Invocation.method(#getPicture, []),
              returnValue: Future<_i4.UserPicture>.value(_FakeUserPicture_2()))
          as _i7.Future<_i4.UserPicture>);
}

/// A class which mocks [DbDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockDbDataSource extends _i1.Mock implements _i8.DbDataSource {
  MockDbDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Database get db => (super.noSuchMethod(Invocation.getter(#db),
      returnValue: _FakeDatabase_3()) as _i5.Database);
  @override
  set db(_i5.Database? _db) => super.noSuchMethod(Invocation.setter(#db, _db),
      returnValueForMissingStub: null);
  @override
  _i7.Future<int> save(_i9.User? toSave) =>
      (super.noSuchMethod(Invocation.method(#save, [toSave]),
          returnValue: Future<int>.value(0)) as _i7.Future<int>);
  @override
  _i7.Future<int> delete(_i9.User? toDelete) =>
      (super.noSuchMethod(Invocation.method(#delete, [toDelete]),
          returnValue: Future<int>.value(0)) as _i7.Future<int>);
  @override
  _i7.Future<List<_i9.User>> getAllUsers() =>
      (super.noSuchMethod(Invocation.method(#getAllUsers, []),
              returnValue: Future<List<_i9.User>>.value(<_i9.User>[]))
          as _i7.Future<List<_i9.User>>);
}
