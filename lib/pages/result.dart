import 'dart:io';

import 'package:flutter/material.dart';
import '../model/user_info.dart';
import '../utils/misc_widgets.dart';

class Result extends StatefulWidget {
  double value;
  UserInfo userInfo;
  Result(this.value, this.userInfo, {super.key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {

  List<Widget> articles = [
    Text(
        'Suggested articles for you: ',
      style: TextStyle(
        color: Colors.red,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      )
    ),
    SizedBox(height: 10),
    MiscWidgets.createLink('https://www.mayoclinic.org/diseases-conditions/heart-disease/in-depth/heart-disease-prevention/art-20046502', 'Learn more about heart disease prevention'),
    SizedBox(height: 10)
  ];

  @override
  Widget build(BuildContext context) {
    if(widget.userInfo.hypertension == 1) {
        articles.add(MiscWidgets.createLink('https://www.mayoclinic.org/diseases-conditions/high-blood-pressure/symptoms-causes/syc-20373410', 'Learn more about hypertension'));
        articles.add(SizedBox(height: 10));
    }
    if(widget.userInfo.bmi > 30) {
      articles.add(MiscWidgets.createLink('https://www.nhlbi.nih.gov/health/educational/lose_wt/risk.htm#:~:text=BMI%20is%20an%20estimate%20of,breathing%20problems%2C%20and%20certain%20cancers.', 'Learn more about BMI (Body Mass Index)'));
      articles.add(SizedBox(height: 10));
    }
    if(widget.userInfo.totalCholesterol >= 200) {
      articles.add(MiscWidgets.createLink('https://www.webmd.com/heart-disease/heart-disease-lower-cholesterol-risk', 'Learn more about cholesterol'));
      articles.add(SizedBox(height: 10));
    }
    if(widget.userInfo.currentSmoker == 1) {
      articles.add(MiscWidgets.createLink('https://www.cdc.gov/tobacco/sgr/50th-anniversary/pdfs/fs_smoking_cvd_508.pdf', "Learn more about smoking and its effects"));
      articles.add(SizedBox(height: 10));
    }
    if(widget.userInfo.diabetes == 1) {
      articles.add(MiscWidgets.createLink('https://www.cdc.gov/diabetes/library/features/diabetes-and-heart.html#:~:text=If%20you%20have%20diabetes%2C%20you,are%20to%20have%20heart%20disease', 'Learn more about diabetes'));
      articles.add(SizedBox(height: 10));
    }
    if(widget.userInfo.age > 40) {
      articles.add(MiscWidgets.createLink('https://www.nia.nih.gov/health/heart-health/heart-health-and-aging#:~:text=and%20bottom%20chambers.-,How%20Your%20Heart%20Changes%20with%20Age,heart%20disease', 'Learn more about heart health and aging'));
      articles.add(SizedBox(height: 10));
    }

    return Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
              Text(
                "You have a ${widget.value}% chance of developing coronary heart disease",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40),

              Container(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: articles,
                )
              ),
            ],
          )
        ),
      ),
    );
  }
}
