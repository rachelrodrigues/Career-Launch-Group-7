import 'package:flutter/material.dart';
import 'package:heart_insight/pages/result.dart';
import 'package:heart_insight/service/web_service.dart';

import '../enum/sex.dart';
import '../model/user_info.dart';
import '../ui/enum_drop_down.dart';
import '../utils/misc_widgets.dart';

class EnterInfo extends StatefulWidget {
  EnterInfo({super.key});

  UserInfo userInfo = UserInfo();
  @override
  State<EnterInfo> createState() => _EnterInfoState();
}

class _EnterInfoState extends State<EnterInfo> {
  final TextStyle promptTextStyle = TextStyle(
    fontSize: 14.0,
    color: Colors.red,
    fontWeight: FontWeight.bold,
  );
  List<String> itemsSex = ['male', 'female'];
  String? selectedItemSex = 'male';

  List<String> itemsYN = ['Yes', 'No'];
  String? selectedItemCurrentSmoker = 'No';
  String? selectedItemBpMeds = 'No';
  String? selectedItemHyperTension= 'No';
  String? selectedItemDiabetes = 'No';

  //final myController = TextEditingController();

  /*@override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'HeartInsight',
          style: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: Column(
            children: <Widget> [
              SizedBox(height: 40.0),
              Text(
                'Enter the following information, and our algorithm will predict your risk of heart disease',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                )
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 4.0, 8.0, 4.0),
                child: Row(
                  children: <Widget> [
                    Text(
                      'Sex: ',
                      style: promptTextStyle,
                    ),
                    SizedBox(
                      width: 100.0,
                      height: 24.0,
                      child: MiscWidgets.createDropDownButton(selectedItemSex, itemsSex,
                              (item) {
                                  setState(() => selectedItemSex = item);
                                  widget.userInfo.sex = ( item == 'male') ? 1 : 0;
                              }),
                      /*
                      child: DropdownButton<String>(
                        value: selectedItem,
                        items: items
                          .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(item, style: TextStyle(fontSize:16.0)),
                        ))
                          .toList(),
                        onChanged: (item) => setState(() => selectedItem = item),
                      )*/
                    ),
                  ]
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 4.0, 8.0, 4.0),
                child: Row(
                    children: <Widget> [
                      Text(
                          'Age: ',
                          style: promptTextStyle,
                      ),
                      SizedBox(
                        width: 100.0,
                        height: 24.0,
                        child: TextField(
                            style: TextStyle(fontSize: 14.0),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              hintText: 'Type here',
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              border: InputBorder.none,
                            ),
                          onChanged: (value) => widget.userInfo.age = int.tryParse(value) ?? 0,
                          //controller: myController,
                        ),
                      ),
                    ]
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 4.0, 8.0, 4.0),
                child: Row(
                    children: <Widget> [
                      Text(
                          'Do you currently smoke?: ',
                          style: promptTextStyle,
                      ),
                      SizedBox(
                        width: 100.0,
                        height: 24.0,
                        child: MiscWidgets.createDropDownButton(selectedItemCurrentSmoker, itemsYN,
                                (item) {
                              setState(() => selectedItemCurrentSmoker = item);
                              widget.userInfo.currentSmoker = ( item == 'Yes') ? 1 : 0;
                              print('Current smoker is ${widget.userInfo.currentSmoker}');
                            }),
                      ),
                    ]
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 4.0, 8.0, 4.0),
                child: Row(
                    children: <Widget> [
                      Expanded(
                        child: Text(
                            'How many cigarettes do you smoke in a day?: ',
                            style: promptTextStyle,
                            softWrap: true,
                        ),
                      ),
                      SizedBox(
                        width: 100.0,
                        height: 24.0,
                        child: TextField(
                            style: TextStyle(fontSize: 14.0),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              hintText: 'Type here',
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              border: InputBorder.none,
                            ),
                          onChanged: (value) => widget.userInfo.numCigarettes = int.tryParse(value) ?? 0,
                          //controller: myController,
                        ),
                      ),
                    ]
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 4.0, 8.0, 4.0),
                child: Row(
                    children: <Widget> [
                      Expanded(
                        child: Text(
                            'Do you take any blood pressure medication?: ',
                            style: promptTextStyle,
                          softWrap: true,
                        ),
                      ),
                      SizedBox(
                        width: 100.0,
                        height: 24.0,
                        child: MiscWidgets.createDropDownButton(selectedItemBpMeds, itemsYN,
                                (item) {
                              setState(() => selectedItemBpMeds = item);
                              widget.userInfo.currentSmoker = ( item == 'Yes') ? 1 : 0;
                            }),
                      ),
                    ]
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 4.0, 8.0, 4.0),
                child: Row(
                    children: <Widget> [
                      Expanded(
                        child: Text(
                            'Do you have hypertension?: ',
                            style: promptTextStyle,
                          softWrap: true,
                        ),
                      ),
                      SizedBox(
                        width: 100.0,
                        height: 24.0,
                        child: MiscWidgets.createDropDownButton(selectedItemHyperTension, itemsYN,
                                (item) {
                              setState(() => selectedItemHyperTension = item);
                              widget.userInfo.currentSmoker = ( item == 'Yes') ? 1 : 0;
                            }),
                      ),
                    ]
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 4.0, 8.0, 4.0),
                child: Row(
                    children: <Widget> [
                      Text(
                          'Do you have diabetes?: ',
                          style: promptTextStyle,
                      ),
                      SizedBox(
                        width: 100.0,
                        height: 24.0,
                        child: MiscWidgets.createDropDownButton(selectedItemDiabetes, itemsYN,
                                (item) {
                              setState(() => selectedItemDiabetes = item);
                              widget.userInfo.currentSmoker = ( item == 'Yes') ? 1 : 0;
                            }),
                      ),
                    ]
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 4.0, 8.0, 4.0),
                child: Row(
                    children: <Widget> [
                      Text(
                          'Total Cholesterol: ',
                          style: promptTextStyle,
                      ),
                      SizedBox(
                        width: 100.0,
                        height: 24.0,
                        child: TextField(
                            style: TextStyle(fontSize: 14.0),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              hintText: 'Type here',
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              border: InputBorder.none,
                            ),
                          onChanged: (value) {
                            widget.userInfo.totalCholesterol = int.tryParse(value) ?? 0;
                          },
                          //controller: myController,
                        ),
                      ),
                    ]
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 4.0, 8.0, 4.0),
                child: Row(
                    children: <Widget> [
                      Text(
                          'Systolic Blood Pressure: ',
                          style: promptTextStyle,
                      ),
                      SizedBox(
                        width: 100.0,
                        height: 24.0,
                        child: TextField(
                            style: TextStyle(fontSize: 14.0),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              hintText: 'Type here',
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              border: InputBorder.none,
                            ),
                          onChanged: (value) => widget.userInfo.sysBp = double.tryParse(value) ?? 0,
                          //controller: myController,
                        ),
                      ),
                    ]
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 4.0, 8.0, 4.0),
                child: Row(
                    children: <Widget> [
                      Text(
                          'Diabolic Blood Pressure: ',
                          style: promptTextStyle,
                      ),
                      SizedBox(
                        width: 100.0,
                        height: 24.0,
                        child: TextField(
                            style: TextStyle(fontSize: 14.0),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              hintText: 'Type here',
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              border: InputBorder.none,
                            ),
                          onChanged: (value) => widget.userInfo.diaBp = double.tryParse(value) ?? 0,
                          //controller: myController,
                        ),
                      ),
                    ]
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 4.0, 8.0, 4.0),
                child: Row(
                    children: <Widget> [
                      Text(
                          'BMI: ',
                          style: promptTextStyle,
                      ),
                      SizedBox(
                        width: 100.0,
                        height: 24.0,
                        child: TextField(
                            style: TextStyle(fontSize: 14.0),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              hintText: 'Type here',
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              border: InputBorder.none,
                            ),
                          onChanged: (value) => widget.userInfo.bmi = double.tryParse(value) ?? 0,
                          //controller: myController,
                        ),
                      ),
                    ]
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 4.0, 8.0, 4.0),
                child: Row(
                    children: <Widget> [
                      Text(
                          'Resting Heart Rate: ',
                          style: promptTextStyle,
                      ),
                      SizedBox(
                        width: 100.0,
                        height: 24.0,
                        child: TextField(
                            style: TextStyle(fontSize: 14.0),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              hintText: 'Type here',
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              border: InputBorder.none,
                            ),
                          onChanged: (value) => widget.userInfo.heartRate = int.tryParse(value) ?? 0,
                          //controller: myController,
                        ),
                      ),
                    ]
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 4.0, 8.0, 4.0),
                child: Row(
                    children: <Widget> [
                      Text(
                          'Glucose: ',
                          style: promptTextStyle,
                      ),
                      SizedBox(
                        width: 100.0,
                        height: 24.0,
                        child: TextField(
                            style: TextStyle(fontSize: 14.0),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[200],
                              hintText: 'Type here',
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              border: InputBorder.none,
                            ),
                          onChanged: (value) => widget.userInfo.glucose = int.tryParse(value) ?? 0,
                          //controller: myController,
                        ),
                      ),
                    ]
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 60.0),
                child: TextButton(
                  onPressed: () {
                    double result = WebService.predict(widget.userInfo);
                    print('Predicting results using values ${widget.userInfo}');
                    //Navigator.push(context, Result(result));
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => Result(result, widget.userInfo)) );

                    //Navigator.pushNamed(context, '/result', arguments: result);
                  },
                  child:  Text('Predict', style: TextStyle(color: Colors.black),),
                  style: TextButton.styleFrom(backgroundColor: Colors.red),
                ),
              ),
            ]
          ),
        ),
      )
    );
  }

}
