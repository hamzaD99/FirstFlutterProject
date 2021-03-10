import 'package:flutter/material.dart';

class readFromAPI{
  int id;
  String title;
  String imgURL;

  readFromAPI(this.id,this.title,this.imgURL);
  factory readFromAPI.fromJson(Map<String, dynamic> json) {
    return new readFromAPI(json['id'],json['title'],json['url']);
  }
}