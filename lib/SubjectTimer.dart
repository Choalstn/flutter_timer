import 'package:flutter/material.dart';
import 'timerPage.dart';

class SubjectTimer extends StatelessWidget {

  List<Subject> subjects;
  SubjectTimer(this.subjects, {Key? key}) : super(key: key) {}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            children: [
              const Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: Text('전체 공부 시간')
              ),
              Container(height: 10),

              Container(
                child: Row (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('00 : 00 : 00', textScaleFactor: 3),
                    Container(width: 10),
                    IconButton(
                      icon: const Icon(Icons.pause_circle),
                      iconSize: 55,
                      onPressed: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('누름'),));
                      },
                    ),
                  ],
                ),
              ),
              Container(height: 30),

              Row(
                children: [
                  Expanded(
                    child: Column(
                        children: const [
                          Text('ui'),
                          Text('00:00:00', textScaleFactor: 1.2),
                        ])
                  ),

                  Expanded(
                      child: Column(
                          children: const [
                            Text('현재 집중 시간'),
                            Text('00 : 00 : 00', textScaleFactor: 1.2),
                      ]
                  ))
                ],
              )
            ],
          ),
      ),
    );
  }


}
