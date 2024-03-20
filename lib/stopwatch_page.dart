import 'dart:async';
import 'dart:math';

import 'package:clock_app/home_page.dart';
import 'package:flutter/material.dart';

class Watch extends StatefulWidget {
  const Watch({super.key});

  @override
  State<Watch> createState() => _WatchState();
}

class _WatchState extends State<Watch> {
  String hourstring = "00", minstring = "00", secstring = "00";
  int hours = 0, mins = 0, secs = 0;
  bool isTimer = false,isReset=false;
  late Timer times;

  @override
  void startTimer() {
    setState(() {
      isTimer = true;
    });
    times = Timer.periodic(Duration(seconds: 1), (timer) {
      startSecond();
    });
  }

  void startSecond() {
    setState(() {
      if (secs < 60) {
        secs++;
        secstring = secs.toString();
      } else {
        startSecondmin();
      }
    });
  }

  void startSecondmin() {
    setState(() {
      if (secs < 60) {
        secs = 0;
        secstring = "00";
        mins++;
        minstring = mins.toString();
      } else {
        startSecondhour();
      }
    });
  }

  void startSecondhour() {
    setState(() {
      secs = 0;
      mins = 0;
      secstring = "00";
      minstring = "00";
      hours++;
      hourstring = hours.toString();
    });
  }

  void PauseTimer() {
    times.cancel();
    setState(() {
      isTimer = false;
    });
    isReset=chekValues();
  }

  void Refresh() {
    times.cancel();
    setState(() {
      secs = 0;
      mins = 0;
      hours = 0;
      secstring = "0";
      minstring = "0";
      hourstring = "0";
      isReset=false;
    });
  }
  bool chekValues()
  {
    if(secs!=0||mins!=0||hours!=0)
    {
      return true;
    }
    else{
      return false;
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff3F6BFD),
        onPressed: () {
          if (isTimer) {
            PauseTimer();
          } else {
            startTimer();
          }
        },
        child: Icon(isTimer ? Icons.stop : Icons.play_arrow,
            color: Color(0xffE0E0E0)),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60, left: 20),
                child: isReset?InkWell(
                  onTap: () {
                      Refresh();
                  },
                  child: Icon(
                    Icons.refresh,
                    color: Color(0xffE0E0E0),
                    size: 30,
                  ),
                ):SizedBox(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60, right: 20),
                child: Icon(
                  Icons.more_vert,
                  color: Color(0xffE0E0E0),
                  size: 30,
                ),
              ),
            ],
          ),
          Center(
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Color(0xff23387B),
                      blurRadius: 10,
                      offset: Offset(-10, 8))
                ],
                color: Color(0xff0A0A0A),
              ),
              child: Center(
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "${hourstring}".padLeft(2, "0"),
                        style:
                            TextStyle(color: Color(0xffD8D8D8), fontSize: 50)),
                    TextSpan(
                        text: ":",
                        style:
                            TextStyle(color: Color(0xffD8D8D8), fontSize: 50)),
                    TextSpan(
                        text: "${minstring}".padLeft(2, "0"),
                        style:
                            TextStyle(color: Color(0xff4E70E8), fontSize: 50)),
                    TextSpan(
                        text: ":",
                        style:
                            TextStyle(color: Color(0xff4E70E8), fontSize: 50)),
                    TextSpan(
                        text: "${secstring}".padLeft(2, "0"),
                        style:
                            TextStyle(color: Color(0xff4E70E8), fontSize: 50)),
                  ]),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
