import 'package:flutter/material.dart';
import 'package:timer/calendarPage.dart';
import 'package:timer/timerPage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> with SingleTickerProviderStateMixin {
  TabController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: [ TimerPage(), CalendarPage()],
        controller: controller,
      ),
      bottomNavigationBar: TabBar(
        tabs: [
          Tab(icon: Icon(Icons.home, color: Colors.blue)),
          Tab(icon: Icon(Icons.add, color: Colors.blue))
        ], controller: controller,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  } // 메모리 낭비 줄이기 위함
}
