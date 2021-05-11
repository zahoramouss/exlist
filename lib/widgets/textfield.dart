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
            color: tHint1,
          ) ,
          focusedBorder: OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(25.0)),
  borderSide: BorderSide(
  color:tBorder1,
  width: 3,
  ),),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            borderSide: BorderSide(
              color:tBorder1,
              width: 3,
            ),
          )
      ),

    ),
  );
}
Widget tfield2(context,TextEditingController cont,String hint,double margin){
  double radius=MediaQuery.of(context).size.width*.35;
  double corner=32;
  double thick=4;
  double h=MediaQuery.of(context).size.height*.07;
  double w=MediaQuery.of(context).size.width*.7136;
     return Container(
    margin: EdgeInsets.only(top: margin),
    width: w,
    height: h,
    child:TextField(
      textAlign: TextAlign.center,
      controller: cont,
      decoration: InputDecoration(
      hintText:hint,
      hintStyle: TextStyle(
        color: gren,
      ),
      focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(corner)),
      borderSide: BorderSide(
      color:tBorder2,
     width: thick,
     ),),
     enabledBorder: OutlineInputBorder(
     borderRadius: BorderRadius.all(Radius.circular(corner)),
      borderSide: BorderSide(
     color:tBorder2,
      width: thick,
         ),



      )
    )
    ));
}