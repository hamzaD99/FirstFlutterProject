import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Device.dart';

import '../readFromAPI.dart';

class third_page extends StatefulWidget {
  List<readFromAPI> data = new List<readFromAPI>();
  third_page({
    @required this.data,
  });
  @override
  _third_pageState createState() => _third_pageState();
}

class _third_pageState extends State<third_page> {
  List<readFromAPI> items = new List<readFromAPI>();
  ScrollController SC = new ScrollController();
  int CM = 10;
  @override
  void initState(){
    items = widget.data.getRange(0, 10).toList();
    super.initState();
    SC.addListener(() {
      if(SC.position.pixels == SC.position.maxScrollExtent){
        getMoreData();
      }
    });
  }
  getMoreData(){
    for(int i = CM; i<CM+10;i++){
      items.add(widget.data[i]);
    }
    print("Done");
    setState(() {

    });
    CM = CM + 10;
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Third Page"),
          backgroundColor: Colors.green,
        ),
        body: ListView.builder(
          controller: SC,
            scrollDirection: Axis.vertical,
        itemCount: items.length+1,
          itemBuilder: (context, index) {
            if(index == items.length){
              return CupertinoActivityIndicator();
            }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: Device.Width,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Column(
                    children: [
                      Text(items[index].id.toString(),
                      style: TextStyle(fontSize: Device.Height*0.04),
                      ),
                      Text(items[index].title,
                        style: TextStyle(fontSize: Device.Height*0.035),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        width: Device.Width*0.92,
                        height: Device.Height*0.265,
                        child: Image.network(items[index].imgURL,
                        fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;

                            return Center(child: Text('Loading...'));
                            // You can use LinearProgressIndicator or CircularProgressIndicator instead
                          },
                          errorBuilder: (context, error, stackTrace) =>
                              Text('Some errors occurred!'),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
            ),
      ),
    );
  }
}
