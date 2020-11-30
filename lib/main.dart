import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'Digital.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter DSC',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Clock(),
    );
  }
}

class Clock extends StatefulWidget{
  Clock({Key key}) : super (key: key);

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock>{
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
    return Scaffold(
        appBar: AppBar(
          title: Text('Clock'),
          centerTitle: true,
      ),
      body:
          Column(
          children: [
//            DigitalClock(),
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
                          decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        alignment: Alignment(0, -0.35),
                      ),
                      angle: seconds,
                    ),

                    Transform.rotate(
                      child:Container(
                        child: Container(
                          height: 95,
                          width: 5,
                          decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(10),
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
                          decoration: BoxDecoration(color: Colors.pink, borderRadius: BorderRadius.circular(10),
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
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(50),
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
              alignment: Alignment (0, 0),
            ),
            Spacer(),
            DigitalClock(),
          ],
          ),
    );
  }
}