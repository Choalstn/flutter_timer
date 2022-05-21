import 'package:flutter/material.dart';
import 'dart:async';
import 'SubjectTimer.dart';

class Subject {
  String name;
  Color color;
  late int elaspeMiliSeconds;

  Subject(this.name, this.color);
}


class TimerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TimerPage();
}



class _TimerPage extends State<TimerPage> {
  late Timer _timer;
  final Stopwatch _stopwatch = Stopwatch();

  List<Subject> subjects = [
    Subject('UI/UX 프로그래밍', Colors.red),
    Subject('데이터베이스', Colors.purple),
    Subject('가상현실과 비즈니스 모델', Colors.cyan)
  ];

  int hourTime = 0;
  int minTime = 0;
  int secTime = 0;

  void _startCountUp() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        var elapsedSeconds = _stopwatch.elapsedMilliseconds ~/ 1000;
        secTime = elapsedSeconds % 60;
        minTime = elapsedSeconds ~/ 60 % 60;
        hourTime = elapsedSeconds ~/ 60 ~/ 60;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    var sec = '$secTime'.padLeft(2, '0');
    var min = '$minTime'.padLeft(2, '0');
    var hour = '$hourTime'.padLeft(2, '0');

    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.amber,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 80, bottom: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(' 2020.05.13', style: TextStyle(fontSize: 13),),
                      Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text('$hour : $min : $sec',textScaleFactor: 4,))
                    ]),
                ),
              ]),
          ),

          Expanded(
            child : ListView.builder(
                  itemCount: subjects.length ,
                  itemBuilder:(context, i) =>
                      ListTile(
                      onTap: () {
                        _startCountUp();
                        if(!_stopwatch.isRunning) {
                          _stopwatch.start();
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SubjectTimer(subject: subjects[i] )));
                      },
                      leading: Icon(Icons.add, color: subjects[i].color),
                      title: Text(subjects[i].name),
                    ),

                )
            )
        ],
      ),


    );
  }
}



