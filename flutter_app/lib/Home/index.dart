import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swipedetector/swipedetector.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final nameCont = TextEditingController();
  final ageCont = TextEditingController();
  final passCont = TextEditingController();
  bool checkStat0 = false;
  bool checkStat1 = false;
  bool checkStat2 = false;
  int selectedRadio = 0;
  String dropdownValue = 'Choose';
  String selectedRadioStr = "Nothing";

  bool validateStructure(String value){
    String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return (regExp.hasMatch(value) && value.length>5);
  }
  bool isNumeric(String s) {
    if(s == null) {
      return false;
    }
    return double.parse(s, (e) => null) != null;
  }
  //ST
  void _showMyDialogSaved(String name, String age, String r,String Ch) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Saved!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Image.network("https://cdn0.iconfinder.com/data/icons/free-daily-icon-set/512/Tick-256.png"),
                Text('Your data has been verified and saved.'),
                Text("Name: "+name),
                Text("Age: "+age),
                Text("Password: !can'tSh0w1t"),
                Text("Radio: "+r),
                Text("Checkboxes: "+Ch),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('K -_-'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  void _showMyDialogError(String Error) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Something went wrong!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Image.network("https://cdn4.iconfinder.com/data/icons/feather/24/x-circle-256.png"),
                Text(Error),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('SORRY!'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  //EN
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameCont.dispose();
    ageCont.dispose();
    passCont.dispose();
    super.dispose();
  }
  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo App'),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
                children:[
                  Container(
                      margin: EdgeInsets.only(
                        top:20,
                      ),
                      child: Image.asset("lib/assets/logo.png")),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child:  Container(
                            margin: EdgeInsets.only(bottom: 25),
                            child: Column(
                              children: [
                                //Name
                                TextFormField(
                                  onChanged: (text){
                                    print("Name: "+text);
                                  },
                                  controller: nameCont,
                                  decoration: InputDecoration(
                                    labelText: 'Name',
                                  ),
                                ),
                                //Age
                                TextFormField(
                                  keyboardType: TextInputType.phone,
                                  onChanged: (text){
                                    print("Age: "+text);
                                  },
                                  controller: ageCont,
                                  decoration: InputDecoration(
                                    labelText: 'Age',
                                  ),
                                ),
                                //Password
                                TextFormField(
                                  onChanged: (text){
                                    print("Password: "+text);
                                  },
                                  obscureText: true,
                                  controller: passCont,
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                  ),
                                ),
                            ],
                            ),
                          ),
                        ),
                        //Checkboxes
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //op1
                            Checkbox(value: checkStat0, onChanged: (val){
                              setState(() {
                                checkStat0 = !checkStat0;
                              });
                            },
                              activeColor: Colors.green,
                            ),
                            Text("Op1"),
                            //op2
                            Checkbox(value: checkStat1, onChanged: (j){
                              setState(() {
                                checkStat1 = !checkStat1;
                              });
                            },
                              activeColor: Colors.green,),
                            Text("Op2"),
                            //op3
                            Checkbox(value: checkStat2, onChanged: (q){
                              setState(() {
                                checkStat2 = !checkStat2;
                              });
                            },
                              activeColor: Colors.green,),
                            Text("Op3")
                          ],
                        ),
                        //Radio Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //op1
                            Radio(value: 1,
                                groupValue: selectedRadio,
                              onChanged: (val) {
                                print("Radio $val");
                                setSelectedRadio(val);
                              },
                              activeColor: Colors.green,
                            ),
                            Text("R1"),
                            //op2
                            Radio(value: 2,
                              groupValue: selectedRadio,
                              onChanged: (val) {
                                print("Radio $val");
                                setSelectedRadio(val);
                              },
                              activeColor: Colors.green,
                            ),
                            Text("R2"),
                            //op3
                            Radio(value: 3,
                              groupValue: selectedRadio,
                              onChanged: (val) {
                                print("Radio $val");
                                setSelectedRadio(val);
                              },
                              activeColor: Colors.green,
                            ),
                            Text("R3")
                          ],
                        ),
                        //DropDown
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.green,
                                width: 3,
                              ),
                            borderRadius: BorderRadius.circular(9.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              icon: Icon(Icons.arrow_downward),
                              iconSize: 15,
                              elevation: 16,
                              style: TextStyle(color: Colors.green),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownValue = newValue;
                                });
                              },
                              items: <String>['Choose','Op1', 'Op2', 'Op3', 'Op4']
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Text(value,
                                    style: TextStyle(
                                      fontSize: 19,

                                    ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top:15,bottom: 15),
                          child: RaisedButton(
                              elevation: 5.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13.0),
                              ),
                              highlightElevation: 8.0,
                              padding: EdgeInsets.symmetric(horizontal: 80.0,vertical: 20.0),
                              textColor: Colors.white,
                              color: Colors.green,
                              child: Text("Save",
                                style: TextStyle(
                                  fontSize:20.0,
                                ),
                              ),
                              onPressed: (){
                                String Check = "";
                                String Error = "";
                                switch(selectedRadio){
                                  case 1:
                                    selectedRadioStr = "R1";
                                    break;
                                  case 2:
                                    selectedRadioStr = "R2";
                                    break;
                                  case 3:
                                    selectedRadioStr = "R3";
                                    break;
                                }
                                if(checkStat0){
                                  Check+="Op1 ";
                                }
                                if(checkStat1){
                                  Check+="Op2 ";
                                }
                                if(checkStat2){
                                  Check+="Op3 ";
                                }
                                if(nameCont.text != "" && validateStructure(passCont.text) && selectedRadio != 0 && isNumeric(ageCont.text)) {
                                  _showMyDialogSaved(
                                      nameCont.text, ageCont.text,
                                      selectedRadioStr, Check);
                                }
                                else {
                                  if(nameCont.text == "") Error += "You should type a name.\n";
                                  if(!validateStructure(passCont.text)) Error += "Check your password.\n";
                                  if(selectedRadio == 0) Error += "You should select a radio option.\n";
                                  if(!isNumeric(ageCont.text)) Error += "type your age correctly.\n";
                                  _showMyDialogError(Error);
                                }
                              }
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top:5,bottom: 15),
                          child: SwipeDetector(
                            // When the child is tapped, show a snackbar.
                            onSwipeRight: () {
                              setState(() {
                                nameCont.text = "";
                                ageCont.text = "";
                                passCont.text = "";
                                checkStat0 = false;
                                checkStat1 = false;
                                checkStat2 = false;
                                selectedRadio = 0;
                                dropdownValue = "Choose";
                              });
                            },
                            // The custom button
                            child: Container(
                              width: 205,
                              height: 61,
                              //alignment: Alignment.center,
                              padding: EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    blurRadius: 20.0, // soften the shadow
                                    spreadRadius: 1.0, //extend the shadow
                                    offset: Offset(
                                      5.0, // Move to right 10  horizontally
                                      5.0, // Move to bottom 10 Vertically
                                    ),
                                  )
                                ],
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Dismiss",
                                      style: TextStyle(
                                        fontSize:20.0,
                                        color:Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                            ),
                                Icon(Icons.arrow_right_alt_rounded,size: 40,color: Colors.white,)
                                ],
                              ),
                          )),
                        ),
                        Stack(
                          children: [
                            Container(
                            margin: EdgeInsets.only(bottom: 25),
                            height: 300,
                            width: 400,
                            child:
                                  Image.network("https://www.psut.edu.jo/sites/default/files/styles/main_slider/public/home%20page%20%281%29_0.JPG?itok=Fat8KAYf"),
                          ),
                            Container(
                              margin: EdgeInsets.only(top:72),
                              height: 155,
                              width: 400,
                              color: Colors.lightBlue.withOpacity(0.5),
                            ),
                          ]
                        )
                      ],
                    ),
                  )
                ]
            ),
          ),
        ),
      ),
    );

  }
}
