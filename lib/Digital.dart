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
    var minuteTime = _timeOfDay.minute < 10 ? "0" + _timeOfDay.minute.toString(): _timeOfDay.minute;
    String _period = _timeOfDay.period == DayPeriod.am ? "AM" : "PM";
    return Scaffold(
      backgroundColor: Color.fromRGBO(8, 25, 35, 1),
      appBar: AppBar(
        title: Text('Digital Clock'),
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
      body:Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              // if you use _timeOfDay.hour then it will show 20:10 like that
              // But we want 8:10
              "${_timeOfDay.hourOfPeriod}:$minuteTime",
 //             style: Theme.of(context).textTheme.headline1,
                style: (TextStyle(color: Colors.white, fontSize: 100))
            ),
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
      ),
    );
  }
}