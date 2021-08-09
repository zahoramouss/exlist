import 'package:flutter/material.dart';
import'screens/bottomsheet.dart';
import'screens/sendVerificationCode.dart';
import'screens/reset_password.dart';
import 'screens/home.dart'   ;
void main() {
  runApp(MaterialApp(
    home:btn() ,
    routes: {
      '/resetpassword':(BuildContext context)=>resetpassword(),
      '/sendverfication_code':(BuildContext context)=>sendverication(),
      '/home':(BuildContext context)=>btn(),
    },
  ));
}

