import 'package:flutter/material.dart';
import 'dart:async';


class TimerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TimerPage();
}

class _TimerPage extends State<TimerPage> {

  int seconds = 57;
  int minutes = 09;
  int hours = 00;

  void _startCountUp() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
          seconds++;
          if(seconds>59) {
            minutes += 1;
            seconds = 0;
          }

          if(minutes > 59) {
            hours += 1;
            seconds = 0;
          }
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer'),
      backgroundColor: Colors.orange),
      body: Column(
        children: [
          Container(
            color: Colors.orange,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    child: Text(' 2020.05.13', textAlign: TextAlign.center ,style: TextStyle(fontSize: 13),)
                ),

               Container(
                    child: Text('$hours : $minutes : $seconds', textAlign: TextAlign.center,style: TextStyle(fontSize: 30))
                ),


                ElevatedButton(onPressed: _startCountUp, child: Text('Start')),

              ],),
          ),

        Row(
         children: [
           Flexible(
               fit: FlexFit.tight,
               child: Container(
                 color: Colors.blue,
                 height: 50,
                 child: Row(
                   children: [
                     Icon(Icons.icecream_outlined),
                     Text('UI/UX 프로그래밍'),
                   ],
                 ),
               )
           ),

           Flexible(
               child: Container(
                 color: Colors.amberAccent,
                 height: 50,
                 child: Row(
                   children: [
                     Text('00:00:00', textAlign: TextAlign.center,)
                   ],
                 ),
               ))
         ],
        )


        ],



      ),
    );
  }
}