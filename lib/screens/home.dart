import '../widgets/textfield.dart';
import '../controller/databaseHelper.dart';
import'../model/product.dart';
import '../myProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../Resources/resource.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
/*TextEditingController c_product=TextEditingController();*/
/*TextEditingController c_content=TextEditingController();
TextEditingController c_price=TextEditingController();
TextEditingController c_quantity=TextEditingController();
TextEditingController c_mesure=TextEditingController();*/
double radius1=31;
double radius2=30;
double cangle=45;
int  _chosenValue=1;

class home extends StatelessWidget{

  @override
 // TextEditingController c_id=TextEditingController();

  ///////////////////////////
  databaseHelper d=databaseHelper();
  Product p1;
  
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
      drawer: Drawer(
        child: Container(
          child:FlatButton(
            onPressed: (){
              Provider.of<Myprovider>(context,listen: false).save();
            },
            child:Row(
            children: [
            Icon(Icons.download_rounded),
              Text('Save',style:TextStyle(
                fontSize: 14,
                color:Colors.black
              )),
            ],
            ),
          )
        ),
      ),
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
            // crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
               Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   tfield3(context,Provider.of<Myprovider>(context).c_id,str_productid,twidth1,margin1),
                   Container(
                     width: 20,
                   ),
                   tfield3(context,Provider.of<Myprovider>(context).c_product,str_name,twidth2,margin1),

                 ],
               ),
             Container(
              // color: Colors.blueGrey,
               child:   Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 tfield3(context,Provider.of<Myprovider>(context).c_price,str_price,twidth3,margin2),
                 /* Container(
                   width:MediaQuery.of(context).size.width*.09,
                    ),*/
                 tfield3(context,Provider.of<Myprovider>(context).c_quantity,str_content,twidth3,margin2),
                 /* Container(
                      width:MediaQuery.of(context).size.width*.042,
                    ),*/
                Container(
                      margin: EdgeInsets.only(top: margin2),
                      padding:EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                      width:95,
                      //margin: EdgeInsets.only(top:20),
                      height: MediaQuery.of(context).size.height*.06,
                      child:DropdownButtonHideUnderline(
                          child:DropdownButton(
                            elevation:0,
                            value:_chosenValue,
                            onChanged: (int value){
                              /* setState(() {
                               _chosenValue=value;
                             });*/
                            },
                            items:[
                              DropdownMenuItem(
                                child:Text('m'),
                                value:1,
                              ),

                              DropdownMenuItem(
                                child:Text('g'),
                                value:2,
                              ),

                              DropdownMenuItem(
                                child:Text('l'),
                                value:3,
                              ),

                              DropdownMenuItem(
                                child:Text('m²'),
                                value:4,
                              ),



                            ],
                            hint: Text('mesure'),
                          )
                      )),


               ],
             ),),
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
                     //Product p1=Product((c_product.text.trim()),(int.parse(c_id.text.trim())),(double.parse(c_price.text.trim())),((double.parse(c_quantity.text.trim()))),'_chosenValue');
                       //p.id=12;
                       //p.name=c_product.text.trim();
                      // p.price=double.parse(c_price.text.trim());
                      // p.quantity=double.parse(c_quantity.text.trim());
                      // p.mesure=_chosenValue;
                       //p1.tomap();
                       Provider.of<Myprovider>(context,listen: false).add();



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
            itemCount: Provider.of<Myprovider>(context,listen: true).l.length,
            itemBuilder: ((BuildContext context,int index){
              return Slidable(
                  actionPane: SlidableDrawerActionPane(),
              actionExtentRatio: 0.25,
              secondaryActions: <Widget>[
              IconSlideAction(
              caption: 'Delete',
              color: ((index%2)==0)?gren:white,
              icon: Icons.delete,foregroundColor:  ((index%2)==0)?white:gren,
              onTap: (){},
              ),

              ],
                child:Container(
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
                          child: Text('${Provider.of<Myprovider>(context).l[index].name}  ',style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18
                          ),),),
                        Container(
                          margin: EdgeInsets.only(left: MediaQuery.of(context).size.height*.032),
                          child: Text('${Provider.of<Myprovider>(context).l[index].price} ',style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18
                          )),),
                        Container(  margin: EdgeInsets.only(left: MediaQuery.of(context).size.height*.032),
                          child:  Text(' ${Provider.of<Myprovider>(context).l[index].quantity}',style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18
                          )),),

                      ],
                    )
                ),));
            }),

          )




          )


       ],
     ),
   );

  }
}