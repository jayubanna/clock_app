import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  Duration duration = Duration();

  @override
  void initState() {
    super.initState();
    DateTime dateTime = DateTime.now();
    duration = Duration(
        seconds: dateTime.second,
        minutes: dateTime.minute,
        hours: dateTime.hour,
        days: dateTime.year);
    timer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff3F6BFD),
        onPressed: BorderRadius.only,
        child: Icon(
          Icons.add,
          color: Color(0xffE0E0E0),
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 360, top: 60),
            child: Icon(
              Icons.more_vert,
              color: Color(0xffE0E0E0),
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 30),
            child: RichText(
                text: TextSpan(
              children: [
                TextSpan(
                    text: "${duration.inHours % 24}".padLeft(2, "0"),
                    style: TextStyle(color: Color(0xffD8D8D8), fontSize: 50)),
                TextSpan(
                    text: ":",
                    style: TextStyle(color: Color(0xffD8D8D8), fontSize: 50)),
                TextSpan(
                    text: "${duration.inMinutes % 60}".padLeft(2, "0"),
                    style: TextStyle(color: Color(0xff4E70E8), fontSize: 50)),
                TextSpan(
                    text: ":",
                    style: TextStyle(color: Color(0xff4E70E8), fontSize: 50)),
                TextSpan(
                    text: "${duration.inSeconds % 60}".padLeft(2, "0"),
                    style: TextStyle(color: Color(0xff4E70E8), fontSize: 50)),
                TextSpan(
                    text: "${DateFormat(' a').format(DateTime.now())}\n",
                    style: TextStyle(color: Color(0xffD8D8D8), fontSize: 30)),
                TextSpan(
                    text:
                        "India Standard Time | ${DateFormat('yMMMMd').format(DateTime.now())}",
                    style: TextStyle(color: Color(0xff4F4F4F), fontSize: 15)),
              ],
            )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 280),
            child: Container(
              height: 130,
              width: 390,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xff1F1F1F)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Delhi",
                          style: TextStyle(color: Colors.white, fontSize: 35),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 130, top: 10),
                          child: Text(
                            "${DateFormat('jm').format(DateTime.now())}",
                            style: TextStyle(color: Colors.white, fontSize: 32),
                          ),
                        )
                      ],
                    ),
                    Text(
                      "Today",
                      style: TextStyle(color: Color(0xff4F4F4F), fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void timer() async {
    await Future.delayed(Duration(seconds: 1), () {});
    duration = Duration(seconds: duration.inSeconds + 1);
    timer();
    setState(() {});
  }
}
