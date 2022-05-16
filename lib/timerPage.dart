import 'package:flutter/material.dart';
import 'dart:async';


class TimerPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _TimerPage();
}

class _TimerPage extends State<TimerPage> {
  late Timer _timer;

  int _secTime = 58;
  int _minTime = 59;
  int _hourTime = 0;

  void _startCountUp() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _secTime++;

        if(_secTime>59) {
          _minTime++;
          _secTime = 0;
          _secTime++;
        }

        if(_minTime>59) {
          _hourTime++;
          _minTime = 0;
          Duration.secondsPerDay;
        }
      });
    });
  }

  
  @override
  Widget build(BuildContext context) {

    var sec = '${_secTime}'.padLeft(2, '0');
    var min = '${_minTime}'.padLeft(2, '0');
    var hour = '${_hourTime}'.padLeft(2, '0');

    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(' 2020.05.13', textAlign: TextAlign.center ,style: TextStyle(fontSize: 13),),
                      Text('$hour : $min : $sec', textAlign: TextAlign.center,style: TextStyle(fontSize: 30)),
                    ]),
                ),

                ListTile(
                  onTap: () {
                    _startCountUp();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SecondRoute()));
                  },
                    leading: Icon(Icons.add),
                    title: Text('UI/UX 프로그래밍'),
                  ),

                ListTile(
                  onTap: () {
                    _startCountUp();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SecondRoute()));

                  },
                  leading: Icon(Icons.add),
                  title: Text('가상현실과 비즈니즈 모델'),
                ),

                ListTile(
                    onTap: () {
                      _startCountUp();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SecondRoute()));
                    },
                  leading: Icon(Icons.add),
                  title: Text('안드로이드 프로그래밍')
                ),

                ListTile(
                  onTap: () {
                    _startCountUp();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SecondRoute()));
                  },
                  leading: Icon(Icons.add),
                  title: Text('데이터베이스 기초'),
                ),

              ]),
          ),
        ],



      ),


    );
  }
}

class SecondRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Icon(Icons.pause_circle),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        )
      ),
    );
  }
}
