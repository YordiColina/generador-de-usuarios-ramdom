
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pruebab/helper/helperfunctions.dart';
import 'package:pruebab/services/database.dart';


import '../models/DataUsers.dart';
import '../widget.dart';


class profile extends StatefulWidget {
 final Datos dato;
  const profile( this.dato) : super();

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  TextEditingController emailController =new TextEditingController();
  TextEditingController nameController =new TextEditingController();


  @override
  Widget build(BuildContext context) {


    emailController.text=widget.dato.correo;
    nameController.text=widget.dato.nombre;
      return Scaffold(
        appBar:PreferredSize(  preferredSize: const Size.fromHeight(50),child: appBarMain(context)

        ),
        body: ListView(
          children: [



                  Padding(
                    padding: EdgeInsets.all(10),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/man.png'),
                      radius:120,
                    ),
                  ),


              Container(
                height: MediaQuery.of(context).size.height -420,
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Form(

                        child: Column(
                            children:[
                              TextFormField(


                                  controller:  nameController,
                                  style: simpleTextStyle(),
                                  decoration: textFieldInputDecoration("name")
                              ),
                              TextFormField(

                                  controller: emailController,
                                  style: simpleTextStyle(),
                                  decoration: textFieldInputDecoration("email")
                              ),
                            ] ),
                      ),








                      SizedBox(height: 15,),
                    ],
                  ),
                ),

              ),
            ],
          ),
        );



  }
}

class datosPersona {

  String nombre = "";

  String correo = "";


  datosPersona(nombre, apellido, correo, foto, edad, web) {
    this.nombre = nombre;

    this.correo = correo;
  }
}