import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Next_Page extends StatefulWidget {
  @override
  _Next_PageState createState() => _Next_PageState();
}

class _Next_PageState extends State<Next_Page> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Second Page"),
          backgroundColor: Colors.green,
        ),
        body: Container(
          child: Column(
            children: [
              Image.network("https://image.jimcdn.com/app/cms/image/transf/none/path/sa6549607c78f5c11/image/i86150a51964976d0/version/1577359562/azores-most-beautiful-landscape-in-europe.jpg"),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Go back!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
