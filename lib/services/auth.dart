

import 'package:firebase_auth/firebase_auth.dart';

import '../modal/usuario.dart';
class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;

 Usuario? _usuariofromfirebase(User user){
     return user!=null ? Usuario(userId: user.uid) : null;
  }
  Future sigInWhitEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword
        (email: email, password: password);
      User? usuario = result.user;
      return _usuariofromfirebase(usuario!);
    } catch (e) {
     print(e.toString());
    }
  }

   Future signUpwhitEmailAndPassword(String email,String password)async {
     try{
       UserCredential result=await _auth.createUserWithEmailAndPassword(email: email, password: password);
       User? usuario = result.user;
     }catch(e){
       print(e.toString());
     }

   }
   Future resetPass(String email)async{
       try{
       return _auth.sendPasswordResetEmail(email: email);
       }catch(e){
           print(e.toString());
       }

   }

   Future signOut()async{
     try{
       return await _auth.signOut();
     }catch(e){
       print(e.toString());
     }
   }
}