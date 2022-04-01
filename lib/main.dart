import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MyApp());


class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  String nowSecond;
  String nowMinute;
  String nowHour;
  String meridian;
  String trackNowSecond;
  String trackNowMinute;
  String trackNowHour;

  Timer everySecond;
  Timer everyMinute;
  Timer everyHour;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    nowSecond = DateTime.now().second.toString().length == 1 ? "0${DateTime.now().second}" : DateTime.now().second.toString();
    trackNowSecond = nowSecond;
    nowMinute = DateTime.now().minute.toString().length == 1 ? "0${DateTime.now().minute}" : DateTime.now().minute.toString();
    trackNowMinute = nowMinute;
    nowHour = DateTime.now().hour.toString().length == 1 ? "0${DateTime.now().hour}" : DateTime.now().hour < 12 ? DateTime.now().hour.toString() : (DateTime.now().hour - 12).toString().length == 1 ? "0${DateTime.now().hour - 12}" : (DateTime.now().hour - 12).toString();
    trackNowHour = nowHour;
    meridian = DateTime.now().hour > 11 ? "PM" : "AM";
  }


  @override
  Widget build(BuildContext context) {
    everySecond = nowSecond == "59" ? nowMinute == trackNowMinute ? nowMinute == "59" ? Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        nowMinute = DateTime.now().minute.toString().length == 1 ? "0${DateTime.now().minute}" : DateTime.now().minute.toString();
        nowHour = DateTime.now().hour.toString().length == 1 ? "0${DateTime.now().hour}" : DateTime.now().hour < 12 ? DateTime.now().hour.toString() : (DateTime.now().hour - 12).toString().length == 1 ? "0${DateTime.now().hour - 12}" : (DateTime.now().hour - 12).toString();
        nowSecond = DateTime.now().second.toString().length == 1 ? "0${DateTime.now().second}" : DateTime.now().second.toString();
        meridian = DateTime.now().hour > 11 ? "PM" : "AM";
      });
    }) : Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        nowMinute = DateTime.now().minute.toString().length == 1 ? "0${DateTime.now().minute}" : DateTime.now().minute.toString();
        nowSecond = DateTime.now().second.toString().length == 1 ? "0${DateTime.now().second}" : DateTime.now().second.toString(); //
      });
    }) : nowMinute == "59" ? Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        nowMinute = DateTime.now().minute.toString().length == 1 ? "0${DateTime.now().minute}" : DateTime.now().minute.toString();
        nowHour = DateTime.now().hour.toString().length == 1 ? "0${DateTime.now().hour}" : DateTime.now().hour < 12 ? DateTime.now().hour.toString() : (DateTime.now().hour - 12).toString().length == 1 ? "0${DateTime.now().hour - 12}" : (DateTime.now().hour - 12).toString();
        nowSecond = DateTime.now().second.toString().length == 1 ? "0${DateTime.now().second}" : DateTime.now().second.toString();
        meridian = DateTime.now().hour > 11 ? "PM" : "AM";
      });
    }) : Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        nowMinute = DateTime.now().minute.toString().length == 1 ? "0${DateTime.now().minute}" : DateTime.now().minute.toString();
        nowSecond = DateTime.now().second.toString().length == 1 ? "0${DateTime.now().second}" : DateTime.now().second.toString();
      });
    }) : Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        nowSecond = DateTime.now().second.toString().length == 1 ? "0${DateTime.now().second}" : DateTime.now().second.toString();
      });
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Clock',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/time-3.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(.3),
                        Colors.black.withOpacity(.4),
                        Colors.black.withOpacity(.5),
                        Colors.black.withOpacity(.6),
                        Colors.black.withOpacity(.7),
                      ],
                    )
                ),
                child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          "$nowHour:$nowMinute:$nowSecond",
                          style: TextStyle(
                              color: Colors.white.withOpacity(.84),
                              fontWeight: FontWeight.w400,
                              fontSize: 50,
                          fontFamily: 'Inconsolata'),
                        ),
                        Text(' $meridian', style: TextStyle(
                          color: Colors.white.withOpacity(.9),
                          fontWeight: FontWeight.w300,
                          fontSize: 30,
                          fontFamily: 'Inconsolata',
                        ),),
                      ],
                    )))),
        backgroundColor: Colors.black87,
      ),
    );
  }
}

