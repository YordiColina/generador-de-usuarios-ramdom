import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseMethods {

 Future getUserByUsername(String Username) async {
    List datos = [];
   CollectionReference users = FirebaseFirestore.instance.collection('usuarios');
     QuerySnapshot result = await users.where("name", isEqualTo: Username).get();
   return result;

    }

 Future getUserByUserEmail(String UserEmail) async {
   List datos = [];
   CollectionReference users = FirebaseFirestore.instance.collection('usuarios');
   QuerySnapshot result = await users.where("email", isEqualTo: UserEmail).get();
   return result;

 }


    uploadUserInfo(userMap) {
      CollectionReference users = FirebaseFirestore.instance.collection(
          'usuarios');
      users.add(userMap);
    }








}
