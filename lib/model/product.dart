import 'package:flutter/material.dart';
class Product{
  String name;
<<<<<<< HEAD
  int id;
  double price;
  double quantity;
  String mesure;
  
  Product(this.name,this.id,this.price,this.quantity,this.mesure);
  //set(_id)=>this.id=_id;
=======
  double price;
  double quantity;
  int id;
  String mesure;
  Product(this.name,this.id,this.price,this.quantity,this.mesure);
  set(_id)=>this.id=_id;
>>>>>>> 18fcb91969b948ea113cc9c8f7587d73ba6284c1
  Map<String, dynamic> tomap() {
    var map = new Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['name'] = name;
    map['price'] = price;
    map['quantity'] = quantity;
    map['mesure'] = mesure;

    return map;
  }
  Product.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];
    this.price = map['price'];
    this.quantity = map['quantity'];
    this.mesure = map['mesure'];

  }





}