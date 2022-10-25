import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  int countdownFrom = 60;

  void _startCountDown() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (countdownFrom > 0) {
          countdownFrom--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  void _resetButton() {
    setState(() {
      countdownFrom = 60;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellowAccent,
          title:
              Text('60 Seconds Timer', style: TextStyle(color: Colors.black)),
          centerTitle: true,
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              Text(countdownFrom.toString(), style: TextStyle(fontSize: 100)),
              MaterialButton(
                onPressed: _startCountDown,
                child: Text('START',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                color: Colors.yellowAccent[700],
              ),
              MaterialButton(
                onPressed: _resetButton,
                child: Text('RESET',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                color: Colors.yellowAccent[700],
              )
            ])));
  }
}
