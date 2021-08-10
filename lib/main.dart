import 'package:exlist/myProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import'screens/bottomsheet.dart';
import'screens/sendVerificationCode.dart';
import'screens/reset_password.dart';
import 'screens/home.dart'   ;
import 'myProvider.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MaterialApp(
<<<<<<< HEAD
    home:ChangeNotifierProvider<Myprovider>(
      child: home(),
      create: (_)=>Myprovider(),
    ) ,
=======
    home:btn() ,
>>>>>>> 18fcb91969b948ea113cc9c8f7587d73ba6284c1
    routes: {
      '/resetpassword':(BuildContext context)=>resetpassword(),
      '/sendverfication_code':(BuildContext context)=>sendverication(),
      '/home':(BuildContext context)=>btn(),
    },
  ));
}

