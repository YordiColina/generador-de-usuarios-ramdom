
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pruebab/views/profile.dart';
import 'package:pruebab/views/signup.dart';

import '../helper/helperfunctions.dart';
import '../modal/DataUsers.dart';
import '../services/auth.dart';
import '../services/database.dart';
import '../widget.dart';

class signin extends StatefulWidget {


  const signin({Key? key}) : super(key: key);

  @override
  _signinState createState() => _signinState();
}

class _signinState extends State<signin> {
  final formkey=GlobalKey<FormState>();
  AuthMethods authMethods= new AuthMethods();
  DatabaseMethods databaseMethods= new DatabaseMethods();
  TextEditingController emailController =new TextEditingController();
  TextEditingController passwordController =new TextEditingController();
  List pers = [];
  bool isloading=false;
  QuerySnapshot? snapshotUserInfo;
  signIn() async {

    CollectionReference datos = FirebaseFirestore.instance.collection(
        'usuarios');
    QuerySnapshot users = await datos.where(
        "email", isEqualTo: emailController.text).get();
    if (users.docs.length != 0) {
      for (var per in users.docs) {
        print(per.data());
        setState(() {
          pers.add(per);
        }
        );
      }
    }

    Datos Url = Datos(pers[0]['name'],
        pers[0]['email']);







    if (formkey.currentState!.validate()){
      //HelperFunctions.saveUserNameloggedlocalInfo(usernameController.text);
      HelperFunctions.saveUserEmailloggedlocalInfo(emailController.text);
      databaseMethods.getUserByUserEmail(emailController.text).then((val){
        snapshotUserInfo=val;
        HelperFunctions.saveUserNameloggedlocalInfo(snapshotUserInfo?.docs[0].get("name"));

      });
      setState(() {
        isloading=true;
      });

      
      authMethods.sigInWhitEmailAndPassword(emailController.text, passwordController.text).then((val){
        if (val!=null){

          HelperFunctions.saveUserloggedlocalInfo(true);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> profile(Url)
          ));
        }

      });
      

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(  preferredSize: const Size.fromHeight(50),child: appBarMain(context)

      ),
    body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height - 50,
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Form(
                key: formkey,
                child: Column(
                  children:[
                TextFormField(
                    validator: (val){
                      return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val!) ?
                      null : "Enter correct email";
                    },
                  controller:  emailController,
                  style: simpleTextStyle(),
                  decoration: textFieldInputDecoration("email")
                ),
                TextFormField(
                    obscureText: true,
                    validator:  (val){
                      return val!.length < 6 ? "Enter Password 6+ characters" : null;
                    },
                  controller: passwordController,
                  style: simpleTextStyle(),
                  decoration: textFieldInputDecoration("password")
                ),
             ] ),
              ),
              SizedBox(height: 8,),
              Container(
                alignment: Alignment.centerRight,
              child:Container(
                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                child: Text("Forgot Password?",style: simpleTextStyle(),),
              ),
              ),
              SizedBox(height: 8,),
              GestureDetector(
                onTap: (){
                  signIn();
                },
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors:[
                      const Color.fromARGB(255, 56, 182, 255),
                      const Color.fromARGB(255, 56, 182, 255)

                    ]

                    ),
                    borderRadius:BorderRadius.circular(30)
                  ),
                  child: Text("Sign In",style: MediumTextStyle()
                  ),
                ),
              ),
              SizedBox(height: 16,),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                   color: Colors.white,
                    borderRadius:BorderRadius.circular(30)
                ),
                child: Text("Sign In with Google",style: TextStyle(
                  color: Colors.black87,
                  fontSize:17,
                ),
                ),
              ),
              SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Text("Don't have account? ",style: MediumTextStyle(),),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder:(contex)=>signup()));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical:17),
                        child: Text("Register now",style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          decoration: TextDecoration.underline
                        )
                        ,),
                      ),
                    )
                    ]
                  ),
              SizedBox(height: 50,),
            ],
          ),
        ),

      ),
    ),


    );
  }
}
