import 'package:flutter/material.dart';
import 'model/product.dart';
import 'controller/databaseHelper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:excel/excel.dart';
import 'dart:io';
import 'dart:convert';
class Myprovider with ChangeNotifier {
  TextEditingController c_id=TextEditingController();
  TextEditingController c_product=TextEditingController();
  TextEditingController c_content=TextEditingController();
  TextEditingController c_price=TextEditingController();
  TextEditingController c_quantity=TextEditingController();
  TextEditingController c_mesure=TextEditingController();
  Product p;
  List<Product> l=[];
  databaseHelper d=databaseHelper();
   void add(){
     //print(c_id.text);
     d.addProduct(   Product((c_product.text.trim().toString()),(int.parse(c_id.text.trim())),(double.parse(c_price.text.trim())),((double.parse(c_quantity.text.trim()))),'_chosenValue'));
     l.add(Product((c_product.text.trim().toString()),(int.parse(c_id.text.trim())),(double.parse(c_price.text.trim())),((double.parse(c_quantity.text.trim()))),'_chosenValue'));
     print( l.length);
     notifyListeners();


  }
  void save()async{

    var excel = Excel.createExcel();
    Sheet sheetObject = excel['SheetName'];
    sheetObject.cell(CellIndex.indexByString("A1")).value='Name';
    sheetObject.cell(CellIndex.indexByString("B1")).value='ID';
    sheetObject.cell(CellIndex.indexByString("C1")).value='Price';
    sheetObject.cell(CellIndex.indexByString("D1")).value='Quantity';
    sheetObject.insertColumn(8);
    print("ggggg");
    var fb=excel.save();
    Directory directory = await getExternalStorageDirectory();
    print ('gh $directory');
    File(("${directory.path}/output_file_name.xlsx"))
      ..createSync(recursive: true)
      ..writeAsBytesSync(fb);
  }


}