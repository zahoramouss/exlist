import 'package:flutter/material.dart';
import'../Resources/resource.dart';
Widget tfield(context,TextEditingController txtedit, Icon icon,String hint){
   double  bheight = MediaQuery.of(context).size.height * .069;
   double bwidth = MediaQuery.of(context).size.width * .85;
  return Container(
    margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*.10),
    height: bheight,
    width:bwidth,
    child:TextField(
       controller: txtedit,
      decoration: InputDecoration(
          prefixIcon:icon ,
          hintText: hint,
          hintStyle:TextStyle(
            color: white,
          ) ,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            borderSide: BorderSide(
              color:white,
              width: 3,
            ),
          )
      ),

    ),
  );
}