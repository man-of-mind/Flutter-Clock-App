import 'dart:async';

import 'package:flutter/material.dart';

class DigitalClock extends StatefulWidget {
  @override
  _DigitalClock createState() => _DigitalClock();
}

class _DigitalClock extends State<DigitalClock> {
  TimeOfDay _timeOfDay = TimeOfDay.now();
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timeOfDay.minute != TimeOfDay.now().minute) {
        setState(() {
          _timeOfDay = TimeOfDay.now();
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var minuteTime = _timeOfDay.minute < 10
        ? "0" + _timeOfDay.minute.toString()
        : _timeOfDay.minute;
    String _period = _timeOfDay.period == DayPeriod.am ? "AM" : "PM";
    var hour;
    if (_timeOfDay.hourOfPeriod > 0 && _timeOfDay.hourOfPeriod < 10) {
      hour = "0" + _timeOfDay.hourOfPeriod.toString();
    } else if (_timeOfDay.hourOfPeriod == 0) {
      hour = "12";
    } else {
      hour = _timeOfDay.hourOfPeriod;
    }

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
      backgroundColor: Color.fromRGBO(8, 25, 35, 1),
      appBar: AppBar(
        title: Text('DIGITAL CLOCK'),
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
      body: Center(
        child: Column(
          children: [
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    // if you use _timeOfDay.hour then it will show 20:10 like that
                    // But we want 8:10
                    "$hour:$minuteTime",
                    style: (TextStyle(color: Colors.white, fontSize: 100))),
                SizedBox(width: 5),
                RotatedBox(
                  quarterTurns: 4,
                  child: Text(
                    _period,
                    style: (TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ),
              ],
            ),
            Text(
              '$day-$month-${dateTime.year} ',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              '$weekDay',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
