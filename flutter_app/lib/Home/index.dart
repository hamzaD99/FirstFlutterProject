import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_app/Device.dart';
String pre="";

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
  String dropdownValue = 'Cho'.tr();
  String selectedRadioStr = "Nothing";
  String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
  String dropdownValue2 = 'English - UK';
  String icon = "uk.png";

  bool validateStructure(String value){
    String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return (regExp.hasMatch(value) && value.length>5);
  }
  void reset(){
    nameCont.text = "";
    ageCont.text = "";
    passCont.text = "";
    setState(() {
      checkStat0 = false;
      checkStat1 = false;
      checkStat2 = false;
      dropdownValue = "Cho".tr();
    });
    setSelectedRadio(0);
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
                reset();
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
          title: Text('wrong'.tr()),
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
  void _showMyDialogDismiss() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("reset".tr()),
          content: Text('Rmess'.tr()),
          actions: [
            FlatButton(
              textColor: Colors.green,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('CANCEL'.tr()),
            ),
            FlatButton(
              textColor: Colors.red,
              onPressed: () {
                reset();
                Navigator.of(context).pop();
              },
              child: Text('ACCEPT'.tr()),
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
    Device.Height = MediaQuery.of(context).size.height;
    Device.Width = MediaQuery.of(context).size.width;
    var _height = Device.Height;
    var _width = Device.Width;
    print(_height);
    print(_width);
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text("title").tr(),
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
                                    labelText: 'Name'.tr(),
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
                                    labelText: 'Age'.tr(),
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
                                    labelText: 'pass'.tr(),
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
                            Text("Op".tr()+" 1"),
                            //op2
                            Checkbox(value: checkStat1, onChanged: (j){
                              setState(() {
                                checkStat1 = !checkStat1;
                              });
                            },
                              activeColor: Colors.green,),
                            Text("Op".tr()+" 2"),
                            //op3
                            Checkbox(value: checkStat2, onChanged: (q){
                              setState(() {
                                checkStat2 = !checkStat2;
                              });
                            },
                              activeColor: Colors.green,),
                            Text("Op".tr()+" 3")
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
                            Text("R".tr()+" 1"),
                            //op2
                            Radio(value: 2,
                              groupValue: selectedRadio,
                              onChanged: (val) {
                                print("Radio $val");
                                setSelectedRadio(val);
                              },
                              activeColor: Colors.green,
                            ),
                            Text("R".tr()+" 2"),
                            //op3
                            Radio(value: 3,
                              groupValue: selectedRadio,
                              onChanged: (val) {
                                print("Radio $val");
                                setSelectedRadio(val);
                              },
                              activeColor: Colors.green,
                            ),
                            Text("R".tr()+" 3")
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
                              items: <String>['Cho'.tr(),"Op".tr()+" 1", "Op".tr()+" 2", "Op".tr()+" 3", "Op".tr()+" 4"]
                                  .map<DropdownMenuItem<String>>((String value) {
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
                              child: Text("Save".tr(),
                                style: TextStyle(
                                  fontSize:20.0,
                                ),
                              ),
                              onPressed: (){
                                String Check = "";
                                String Error = "";
                                switch(selectedRadio){
                                  case 1:
                                    selectedRadioStr = "R".tr()+" 1";
                                    break;
                                  case 2:
                                    selectedRadioStr = "R".tr()+" 2";
                                    break;
                                  case 3:
                                    selectedRadioStr = "R".tr()+" 3";
                                    break;
                                }
                                if(checkStat0){
                                  Check+="Op".tr()+"1 ";
                                }
                                if(checkStat1){
                                  Check+="Op".tr()+"2 ";
                                }
                                if(checkStat2){
                                  Check+="Op".tr()+"3 ";
                                }
                                if(nameCont.text != "" && validateStructure(passCont.text) && selectedRadio != 0 && isNumeric(ageCont.text)) {
                                  _showMyDialogSaved(
                                      nameCont.text, ageCont.text,
                                      selectedRadioStr, Check);
                                    pre="";
                                    saveData(nameCont.text,ageCont.text,selectedRadioStr,Check,formattedDate);
                                    print(formattedDate);
                                }
                                else {
                                  if(nameCont.text == "") Error += "ErrName".tr()+"\n";
                                  if(!validateStructure(passCont.text)) Error += "ErrPass".tr()+"\n";
                                  if(selectedRadio == 0) Error += "ErrRa".tr()+"\n";
                                  if(!isNumeric(ageCont.text)) Error += "ErrAge".tr()+"\n";
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
                                _showMyDialogDismiss();
                              });
                            },
                            // The custom button
                            child: Container(
                              width: 205,
                              height: _width * 0.14826,
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
                                  Text("Dismiss".tr(),
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
                          overflow: Overflow.visible,
                          children: [
                            Container(
                              height: 200,
                              width: 400,
                              child:
                              Image.network("https://www.designwall.com/wp-content/uploads/edd/2018/03/notification-704x440.jpg"),
                            ),
                            Positioned(
                              left: 40,
                              child: Container(
                                margin: EdgeInsets.only(bottom: 25),
                                height: _height * 0.272,
                                width: 320,
                              color: Colors.green.withOpacity(0.4),
                              ),
                            ),

                            Positioned(
                              bottom: 160,
                              right: 10,
                              child: Icon(
                                Icons.notification_important,
                                size: 80,
                              ),
                            ),
                          ]
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
                            color: Colors.blue,
                            child: Text("last".tr(),
                              style: TextStyle(
                                fontSize:20.0,
                              ),
                            ),
                          onPressed: (){
                            readData();
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) => FullScreenDialog(),
                                fullscreenDialog: true,
                              ),
                            );
                          },
                          )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            DropdownButton<String>(
                              icon: Container(
                                padding: EdgeInsets.only(
                                  left: 10,
                                ),
                                child: Image(
                                  image: AssetImage("lib/assets/" + icon),
                                ),
                                height: 30,
                                width: 30,
                              ),
                              iconSize: 18,
                              elevation: 16,
                              value: dropdownValue2,
                              style: TextStyle(color: Colors.black),
                              underline: Container(
                                padding: EdgeInsets.only(left: 4, right: 4),
                                color: Colors.transparent,
                              ),
                              onChanged: (String newValue2) {
                                setState(() {
                                  if (newValue2 == 'English - UK') {
                                    this.setState(() {
                                      dropdownValue2 = 'English - UK';
                                      icon = "uk.png";
                                      context.locale = Locale('en', 'UK');
                                    });
                                  } else if (newValue2 == 'Arabic - JO') {
                                    this.setState(() {
                                      dropdownValue2 = 'Arabic - JO';
                                      icon = "ar.png";
                                      context.locale = Locale('ar', 'JO');
                                    });
                                  }
                                });
                              },
                              items: <String>['English - UK', 'Arabic - JO']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    )
                                  ),
                                );
                              }).toList(),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 3),
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                size: 18,
                              ),
                            )
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context,"/2nd",
                            arguments: ["TESTTTTTTT","https://www.jetsetter.com/wp-content/uploads/sites/7/2019/04/GettyImages-920879930-1380x690.jpg"],
                            );
                          },
                          child: Text('2nd Page'),
                        ),
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

class FullScreenDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String Data = pre;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Last Save'.tr()),
      ),
      body: Center(
        child: Text(Data,
        style: TextStyle(
          fontSize: 20,
        ),
        )
      ),
    );
  }
}
saveData(name,age,rad,che,date) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('Name', name);
  await prefs.setString('Age', age);
  await prefs.setString('Radio', rad);
  await prefs.setString('Check', che);
  await prefs.setString('Time', date);
}
readData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  pre += "Name".tr()+": " + prefs.getString('Name') + "\n";
  pre += "Age".tr()+": " + prefs.getString('Age') + "\n";
  pre += "pass".tr() + ":!can'tSh0w1t\n";
  pre += "Radio".tr()+": " + prefs.getString('Radio') + "\n";
  pre += "Check".tr()+": "  + prefs.getString('Check') + "\n";
  pre += "Time".tr()+": " + prefs.getString('Time') + "\n";
}
