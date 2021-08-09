
import 'package:flutter/material.dart';
import '../Resources/resource.dart';
import '../widgets/textfield.dart';
import '../controller/databaseHelper.dart';
import'../model/product.dart';
class home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return homestate();
  }
}
class homestate extends State<home>{

  @override
  TextEditingController c_id=TextEditingController();
  TextEditingController c_product=TextEditingController();
  TextEditingController c_content=TextEditingController();
  TextEditingController c_price=TextEditingController();
  TextEditingController c_quantity=TextEditingController();
  TextEditingController c_mesure=TextEditingController();
  double radius1=31;
  double radius2=30;
  double cangle=45;
  String  _chosenValue;
  ///////////////////////////
  databaseHelper d=databaseHelper();

  List<Product> l=List<Product>();
    void initState(){

      super.initState();
     // c_id=new TextEditingController();

    }
  Widget build(BuildContext context) {
  double twidth1=MediaQuery.of(context).size.width*.37;
  double twidth2=MediaQuery.of(context).size.width*.50;
  double twidth3=MediaQuery.of(context).size.width*.2803;
  double boxheight=MediaQuery.of(context).size.height*.35;
  double margin1=MediaQuery.of(context).size.height*.04;
  double margin2=MediaQuery.of(context).size.height*.032;
  double margin3=MediaQuery.of(context).size.height*.032;
  double bwidth=MediaQuery.of(context).size.width*.3901;
  double bheight=MediaQuery.of(context).size.height*.06;
    return Scaffold(
      backgroundColor: white,
     body: Column(
       children: [
         Container(
           height: boxheight,
           decoration: BoxDecoration(
             color: backgroundgren,
             borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(cangle))
           ),
           child: Column(
             children: [
               Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   tfield3(context,c_id,str_productid,twidth1,margin1),
                   Container(
                     width: 20,
                   ),
                   tfield3(context,c_product,str_name,twidth2,margin1),

                 ],
               ),
               Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    tfield3(context,c_price,str_price,twidth3,margin2),
                    Container(
                   width:MediaQuery.of(context).size.width*.09,
                    ),
                    tfield3(context,c_quantity,str_content,twidth3,margin2),
                    Container(
                      width:MediaQuery.of(context).size.width*.042,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                      width: 85,
                      margin: EdgeInsets.only(top:20),
                      height: MediaQuery.of(context).size.height*.06,
                      child:DropdownButton<String>(
                        value: _chosenValue,
                        //elevation: 5,
                        style: TextStyle(color: Colors.black),

                        items: <String>[
                          'Android',
                          ' IOS',
                          ' Flutter',
                          ' Node',
                          ' Java',
                          ' Python',
                          ' PHP',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        hint: Text(
                          "   mesure",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            _chosenValue = value;
                          });
                        },
                      ),
                    ),

                  ],
               ),
               Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Container(
                   width:bwidth,
                   height:bheight,
                   margin: EdgeInsets.only(top: margin3),
                   child: RaisedButton(
                   color: btcolor,
                   shape: RoundedRectangleBorder(
                   borderRadius: new BorderRadius.circular(15),
                 ),
                 onPressed: (){

                 },
                 child:Text(str_scan,style: TextStyle(
                     fontSize: 24,color: bcolor ))
                   ),
                 ),
              Container(
                   width: MediaQuery.of(context).size.width*.15,
                   color: Colors.white10,
                 ),
                 Container(
                  width:bwidth,
                 height:bheight,
                   margin: EdgeInsets.only(top: margin3),
                   child: RaisedButton(
                     color: btcolor,
                     shape: RoundedRectangleBorder(
                         borderRadius: new BorderRadius.circular(15),
                        ),
                     onPressed: (){
                       Product p1=Product((c_product.text.trim()),(int.parse(c_id.text.trim())),(double.parse(c_price.text.trim())),((double.parse(c_price.text.trim()))),'_chosenValue');
                       //p.id=12;
                       //p.name=c_product.text.trim();
                      // p.price=double.parse(c_price.text.trim());
                      // p.quantity=double.parse(c_quantity.text.trim());
                      // p.mesure=_chosenValue;
                       l.add(p1);


                     },
                     child: Text(str_add,style: TextStyle(
                       fontSize: 24,color: bcolor                     ),),
                   ),
                 ),
               ],
               ),
             ],
           ),
         ),
         Expanded(
          child:ListView.builder(
            itemCount: l.length,
            itemBuilder: ((BuildContext context,int index){
              return Container(
                color: ((index%2)==0)?gren:white,
                child: Container(

                    height: MediaQuery.of(context).size.height*.13,
                    decoration: BoxDecoration(
                        color: ((index%2)==0)?white:gren,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(cangle))
                    ),
                    child:Row(
                      children: [
                        Container(

                          margin:EdgeInsets.only(left: margin3),
                          child: CircleAvatar(
                          backgroundColor:backgroundgren,
                          radius: radius1,
                          child: CircleAvatar(
                            backgroundColor:Colors.white,
                            radius: radius2,
                            child: Text('${index+1}',style: TextStyle(color: backgroundgren),),
                          ),),),
                        Container(
                          margin: EdgeInsets.only(left: MediaQuery.of(context).size.height*.032),
                          child: Text('${l[index].name}  ',style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18
                          ),),),
                        Container(
                          margin: EdgeInsets.only(left: MediaQuery.of(context).size.height*.032),
                          child: Text('200e ',style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18
                          )),),
                        Container(  margin: EdgeInsets.only(left: MediaQuery.of(context).size.height*.032),
                          child:  Text(' 10',style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18
                          )),),

                      ],
                    )
                ),);
            }),

          ),
         ),
       ],
     ),
   );

  }
}