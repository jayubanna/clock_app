import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_page.dart';
import 'worldclock_page.dart';
import 'stopwatch_page.dart';

void main() {
  runApp(alarm());
}

class alarm extends StatefulWidget {
  const alarm({super.key});

  @override
  State<alarm> createState() => _alarmState();
}

class _alarmState extends State<alarm> {
  int button = 0;
  List pages = [Homepage(), Clock(), Watch()];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xff141414),
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xff141414),
          onTap: (index) {
            setState(() {
              button = index;
            });
          },
          selectedItemColor: Color(0xffE5E5E5),
          unselectedItemColor: Color(0xff919191),
          currentIndex: button,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.timer_rounded), label: "Alarm"),
            BottomNavigationBarItem(
                icon: Icon(Icons.timer_sharp), label: "World clock"),
            BottomNavigationBarItem(
                icon: Icon(Icons.av_timer_outlined), label: "Stopwatch"),
          ],
        ),
        backgroundColor: Colors.black,
        body: pages[button],
      ),
    );
  }
}
