import 'dart:convert';
import 'dart:core';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/readFromAPI.dart';

class Next_Page extends StatefulWidget {
List data = new List();
  Next_Page({
    @required this.data,
  });
  @override
  _Next_PageState createState() => _Next_PageState();
}

class _Next_PageState extends State<Next_Page> {
  List<readFromAPI> items = new List<readFromAPI>();
  bool isLoading=false;
  @override
  Widget build(BuildContext context) {

    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Second Page"),
          backgroundColor: Colors.green,
        ),
        body: isLoading?Center(child:CircularProgressIndicator()):Container(
          child: Column(
            children: [
              Image.network("https://image.jimcdn.com/app/cms/image/transf/none/path/sa6549607c78f5c11/image/i86150a51964976d0/version/1577359562/azores-most-beautiful-landscape-in-europe.jpg"),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Go back!'),
              ),
              Text(
                widget.data[0].toString(),
              ),
              Image.network(widget.data[1].toString()),
              ElevatedButton(
                onPressed: () async {
                  items = await readAPI();
                  Navigator.pushNamed(context,"/3rd",
                    arguments: [items],
                  );
                },
                child: Text('3rd Page'),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Future<List<readFromAPI>> readAPI() async {
    setState(() {
      isLoading=true;
    });
  var response = await http.get("https://jsonplaceholder.typicode.com/photos");
  List<readFromAPI> resbody = (json.decode(utf8.decode(response.bodyBytes)) as List)
      .map((data) => new readFromAPI.fromJson(data))
      .toList();
 //resbody = resbody.getRange(0, 10).toList();
    setState(() {
      isLoading=false;
    });
  return resbody;
}
}