import 'package:flutter/material.dart';
import 'model/product.dart';
import 'controller/databaseHelper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:excel/excel.dart';
import 'dart:io';
import 'dart:convert';
import 'package:permission_handler/permission_handler.dart';
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
  Directory directory;
  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }

    notifyListeners();

  }
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
    List<String> dataList = ["Google", "loves", "Flutter", "and", "Flutter", "loves", "Google"];

    sheetObject.insertRowIterables(dataList, 2);
    sheetObject.insertColumn(3);
    for (int x = 2; x < l.length; x++){
      sheetObject.insertRowIterables(l[x].tolist(), x);

    }


      var fb=excel.save();

      print(await _requestPermission(Permission.storage));
    if (await _requestPermission(Permission.storage)) {
      directory = await getExternalStorageDirectory();
      String newPath = "";
      print(' p $directory');
      List<String> paths = directory.path.split("/");
      for (int x = 1; x < paths.length; x++) {
        String folder = paths[x];
        if (folder != "Android") {
          newPath += "/" + folder;
        } else {
          break;
        }
      }
      newPath = newPath + "/Exlist";
      print(newPath);
      directory = Directory(newPath);
    print ('gh $directory');
    File(("${directory.path}/output_file_name.xlsx"))
      ..createSync(recursive: true)
      ..writeAsBytesSync(fb);
      notifyListeners();
  }else{
    print('denied');}
  }}



/* dependency: "direct main"
    description:
      name: path
      url: "https://pub.dartlang.org"
    source: hosted
    version: "1.8.0"*/