import 'package:flutter/material.dart';
class Product{
  String name;
  double price;
  double quantity;
  int id;
  String mesure;
  Product(this.name,this.id,this.price,this.quantity,this.mesure);
  set(_id)=>this.id=_id;
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