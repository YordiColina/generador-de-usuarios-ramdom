


import 'package:cloud_firestore/cloud_firestore.dart';
import'package:flutter/material.dart';
import 'package:pruebab/helper/authenticate.dart';
import 'package:pruebab/modal/DataUsers.dart';
import 'package:pruebab/views/profile.dart';
import 'package:pruebab/views/signin.dart';

import '../helper/helperfunctions.dart';
import '../services/auth.dart';
import '../services/database.dart';
import '../widget.dart';

class signup extends StatefulWidget {

  const signup({Key? key}) : super(key: key);


  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {

  bool isLoading=false;
  DatabaseMethods databaseMethods= new DatabaseMethods();
  AuthMethods authMethods=new AuthMethods();
  final formkey=GlobalKey<FormState>();

  TextEditingController usernameController =new TextEditingController();
  TextEditingController emailController =new TextEditingController();
  TextEditingController passwordController =new TextEditingController();




  signMeUp()async{
    if(formkey.currentState!.validate()){
      setState(() {
        isLoading=true;
      });
       authMethods.signUpwhitEmailAndPassword(emailController.text, passwordController.text).then((val) async {
        //print("${val.Uid}");
         Map<String,String> userInfoMap={
           "name" : usernameController.text,
           "email": emailController.text
         };








         HelperFunctions.saveUserNameloggedlocalInfo(usernameController.text);
         HelperFunctions.saveUserEmailloggedlocalInfo(emailController.text);


       databaseMethods.uploadUserInfo(userInfoMap);
         HelperFunctions.saveUserloggedlocalInfo(true);

        Navigator.pushReplacement(context, MaterialPageRoute(builder:(contex)=>signin()));
        });
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(  preferredSize: const Size.fromHeight(50),child: appBarMain(context),
      ),
      body: isLoading ? Container(
        child: Center(child: CircularProgressIndicator()),
      ): SingleChildScrollView(
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
                      return val!.isEmpty|| val.length<3 ? "Enter Username 3+ characters" :null;
                    },
                    controller: usernameController,
                      style: simpleTextStyle(),
                      decoration: textFieldInputDecoration("Username")
                  ),
                  TextFormField(

                    validator: (val){
                      return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val!) ?
                      null : "Enter correct email";
                    },
                    controller: emailController,
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
                  ]),
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
                  signMeUp();
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
                    child: Text("Sign Up",style: MediumTextStyle()
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
                      Text("Already have account? ",style: MediumTextStyle(),),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder:(contex)=>signin()));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text("SignIn now",style: TextStyle(
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
