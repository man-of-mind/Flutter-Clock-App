import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  Clock({Key key}) : super(key: key);

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  double minutes = 0;
  double seconds = 0;
  double hours = 0;
  Timer timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      final now = DateTime.now();
//      print("${now.hour} : ${now.minute} : ${now.second}");
      setState(() {
        seconds = (pi / 30) * now.second;
        minutes = (pi / 30) * now.minute;
        hours = (pi / 6 * now.hour) + (pi / 45 * minutes);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = new DateTime.now();
    var day = dateTime.day < 10 ? "0" + dateTime.day.toString() : dateTime.day;
    var month =
        dateTime.month < 10 ? "0" + dateTime.month.toString() : dateTime.month;
    String weekDay;
    int today = dateTime.weekday;
    switch (today) {
      case 1:
        weekDay = "MONDAY";
        break;
      case 2:
        weekDay = "TUESDAY";
        break;
      case 3:
        weekDay = "WEDNESDAY";
        break;
      case 4:
        weekDay = "THURSDAY";
        break;
      case 5:
        weekDay = "FRIDAY";
        break;
      case 6:
        weekDay = "SATURDAY";
        break;
      case 7:
        weekDay = "SUNDAY";
        break;
      default:
        break;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('ANALOG CLOCK'),
        centerTitle: true,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Row(
            children: [
              Icon(Icons.arrow_back),
              SizedBox(
                width: 5,
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Spacer(),
          Container(
            child: Container(
              child: Stack(
                children: <Widget>[
                  Image.asset('assets/clock1.jpg'),
                  Transform.rotate(
                    child: Container(
                      child: Container(
                        height: 115,
                        width: 2,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      alignment: Alignment(0, -0.35),
                    ),
                    angle: seconds,
                  ),
                  Transform.rotate(
                    child: Container(
                      child: Container(
                        height: 95,
                        width: 5,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      alignment: Alignment(0, -0.35),
                    ),
                    angle: minutes,
                  ),
                  Transform.rotate(
                    child: Container(
                      child: Container(
                        height: 70,
                        width: 7,
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      alignment: Alignment(0, -0.2),
                    ),
                    angle: hours,
                  ),
                  Container(
                    child: Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    alignment: Alignment(0, 0),
                  ),
                ],
              ),
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black45, width: 8),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            //        color: Color.fromRGBO(8, 25, 35, 1),
            color: Colors.white,
            alignment: Alignment(0, 0),
          ),
          Spacer(),
          Card(
            color: Colors.white,
            child: Text('$day-$month-${dateTime.year}',
                style: TextStyle(color: Colors.black, fontSize: 50)),
          ),
          Card(child: Text('$weekDay', style: TextStyle(fontSize: 25))),
          Spacer(),
        ],
      ),
    );
  }
}
