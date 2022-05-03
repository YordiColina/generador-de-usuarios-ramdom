


import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pruebab/repository/user_repository.dart';
import 'package:pruebab/views/addusers.dart';
import 'package:pruebab/views/profile.dart';
import 'package:pruebab/views/signin.dart';

import 'data_source/db_data_source.dart';
import 'data_source/rest_data_sorce.dart';
import 'helper/authenticate.dart';
import 'helper/helperfunctions.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dbDataSource = await DbDataSource.init();
  final userDataSource = RestDataSource();
  final userRepository = UserRepository(userDataSource, dbDataSource);

  Get.put(userRepository);


  await Firebase.initializeApp().then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   bool userIsLoggedIn= false;
  @override
  void initState() {
    getLoggedInState();
    super.initState();
  }
  getLoggedInState()async{
    await HelperFunctions.getUserLoggedInSharedPreference().then((value) {
      setState(() {
        userIsLoggedIn=value!;
      });

    });
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xff1F1F1F),

        primarySwatch: Colors.blue,
      ),
      home:Add_user()


    );
  }
}



