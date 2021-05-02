import 'package:flutter/material.dart';
import'../Resources/resource.dart';
class btn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return btnstate();
  }
}

class btnstate extends State<btn> {
  double bheight;
  double bwidth;

  TextEditingController rm = TextEditingController();
  login(context) {
    showBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return bottomsheet(emailcontroller: rm);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bheight = MediaQuery.of(context).size.height * .066;
    bwidth = MediaQuery.of(context).size.width * .85;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Builder(builder: (context) {
      return Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                //color: Colors.red,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * .45),
                child: Image.asset('assets/images/logo.png', scale: 8),
              ),
              Container(
                  margin: EdgeInsets.only(top: 60),
                  height: bheight,
                  width: bwidth,
                  child: RaisedButton(
                    elevation: 0.0,
                    color: Color(0xFF80E1D1),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30)),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color:white,
                      ),
                    ),
                    onPressed: () {
                      //bottomsheet();
                      login(context);
                    },
                  )),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  height: bheight,
                  width: bwidth,
                  child: RaisedButton(
                    elevation: 0.0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30),
                        side: BorderSide(color: Color(0xFF80E1D1), width: 3)),
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: gren,
                      ),
                    ),
                    onPressed: () {},
                  ))
            ],
          ),
        ),
      );
    }));
  }
}

class bottomsheet extends StatefulWidget {
  TextEditingController emailcontroller = TextEditingController();
  bottomsheet({Key key, this.emailcontroller}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return bottomsheetstate();
  }
}

class bottomsheetstate extends State<bottomsheet> {


  double bheight;
  double bwidth;
  @override
  Widget build(BuildContext context) {
    bheight = MediaQuery.of(context).size.height * .069;
    bwidth = MediaQuery.of(context).size.width * .85;
    return  Scaffold(body:
      DecoratedBox(
      decoration: BoxDecoration(color: gren),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60.0), topRight: Radius.circular(40.0)),
        child:ListView(
          children: [
            Container(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 10,
                    top: 20,
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                       // _emailController.clear();
                      //  _passwordController.clear();
                       // _nameController?.clear();
                      },
                      icon: Icon(
                        Icons.close,
                        size: 30.0,
                        color: white,
                      ),
                    ),
                  )
                ],
              ),
              height: 50,
              width: 50,
            ),
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Container(
                      child: CircleAvatar(
                        backgroundColor: white,
                        radius: 80,
                        child:Align(
                          alignment: Alignment.center,
                          child:Image.asset('assets/images/acc.png',scale: 4,),
                          ),
                        )
                      ),
                    Container(
                      margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*.10),
                      height: bheight,
                      width:bwidth,
                      child:TextField(
                        
                        decoration: InputDecoration(
                          prefixIcon:Icon(Icons.person,color: white) ,
                            hintText: 'Name',
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
                    ),
                    Container(
                      margin: EdgeInsets.only(top:20),
                      height: bheight,
                      width:bwidth,
                      child:TextField(

                        decoration: InputDecoration(
                            prefixIcon:Icon(Icons.email_rounded,color: white) ,
                            hintText: 'Email',
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
                    ),
                    Container(
                      margin: EdgeInsets.only(top:20),
                      height: bheight,
                      width:bwidth,
                      child:TextField(

                        decoration: InputDecoration(
                            prefixIcon:Icon(Icons.lock_outline,color: white) ,
                            hintText: 'Password',
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
                    ),
                    Container(
                      margin: EdgeInsets.only(top:25),
                      width: bwidth,
                      height:bheight,
                      child:RaisedButton(
                        elevation: 0.0,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30),
                            side: BorderSide(color: white, width: 3)),
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF80E1D1),
                          ),
                        ),
                        onPressed: (){},
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        )
         // margin: EdgeInsets.only(top: 200),






      )));
  }
}
