import 'package:flutter/material.dart';

import 'AnalogClock.dart';
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
      home: MyProject(),
    );
  }
}

class MyProject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CLOCK'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Spacer(),
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(color: Colors.blue, width: 8),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text("Analog Clock",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline4),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Clock(),
                    ),
                  );
                },
              ),
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.white, width: 4),
                  ),
                  child: Text("")),
              InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(color: Colors.blue, width: 8),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text("Digital Clock",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline4),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DigitalClock(),
                    ),
                  );
                },
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
