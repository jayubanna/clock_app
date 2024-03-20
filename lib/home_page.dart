import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff3F6BFD),
        onPressed: BorderRadius.only,
        child: Icon(
          Icons.add,
          color: Color(0xffE0E0E0),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 360, top: 60),
            child: Icon(
              Icons.more_vert,
              color: Color(0xffE0E0E0),
              size: 30,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 130, top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Alaram",
                  style: TextStyle(
                    color: Color(0xffE0E0E0),
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Ring in 7 42 minutes",
                  style: TextStyle(
                    color: Color(0xff919191),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Column(children: timelist.map((e) {
            return Time(
              name: e["name"],
              day: e["day"],
              min: e["min"],
            );
          }).toList(),)
        ],
      ),
    );
  }
}

class Time extends StatelessWidget {
  String? name;
  String? day;
  String? min;
   Time({super.key,this.name,this.day,this.min});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,top: 20),
      child: Container(
        height: 130,
        width: 390,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xff1F1F1F),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text(name??"",style: TextStyle(color: Colors.white,fontSize: 60),),
                  Padding(
                    padding: const EdgeInsets.only(top: 20,left: 5),
                    child: Text(min??"",style: TextStyle(color: Colors.white,fontSize: 20),),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(day??"",style: TextStyle(color: Color(0xff4F4F4F),fontSize: 20),),
            )
          ],
        ),
      ),
    );
  }
}


List<Map> timelist=[
  {"name":"6.00",
    "day":"Every day",
    "min":"Am",
  },
  {"name":"7.00",
    "day":"Every day final",
    "min":"Am",
  }
];
