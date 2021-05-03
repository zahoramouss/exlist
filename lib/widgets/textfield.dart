import 'package:flutter/material.dart';
import'../Resources/resource.dart';
Widget tfield(context,TextEditingController txtedit, Icon icon,String hint,double margin,){
   double  bheight = MediaQuery.of(context).size.height * .067;
   double bwidth = MediaQuery.of(context).size.width * .80;
  return Container(
    margin:EdgeInsets.only(top:margin) ,
    height:bheight,
    width: bwidth,
    child:TextField(
       controller: txtedit,
      decoration: InputDecoration(
          prefixIcon:icon ,
          hintText: hint,
          hintStyle:TextStyle(
            color: white,
          ) ,
          focusedBorder: OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(25.0)),
  borderSide: BorderSide(
  color:white,
  width: 3,
  ),),
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