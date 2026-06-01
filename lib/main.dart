import 'package:flutter/material.dart';

void main() {
  runApp(const Timer());
}

class Timer extends StatefulWidget {
  const Timer({super.key});

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  //The Day of the week
  String Today = "";
  //The Hour and Minute
  String hour = "";
  String minute = "";
  //The Year, Month and Day
  String year = "";
  String month = "";
  String day = "";

  void _dateFunctions() {
    setState(() {
      final months = [
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December',
      ];
      DateTime now = DateTime.now();
      year = now.year.toString();
      month = months[now.month - 1];
      day = now.day.toString();
      hour = now.hour.toString();
      minute = now.minute.toString();
      switch (now.weekday) {
        case 1:
          Today = "Monday";
          break;
        case 2:
          Today = "Tuesday";
          break;
        case 3:
          Today = "Wednesday";
          break;
        case 4:
          Today = "Thursday";
          break;
        case 5:
          Today = "Friday";
          break;
        case 6:
          Today = "Saturday";
          break;
        case 7:
          Today = "Sunday";
          break;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _dateFunctions();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Time & Date",
            style: TextStyle(color: Colors.white, fontFamily: "Bassem"),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Today is $Today", style: TextStyle(fontSize: 30)),
              SizedBox(height: 20),
              Text(
                "Current time: ${hour.padLeft(2, '0')}:${minute.padLeft(2, '0')}",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Text(
                "Current date: $year-$month-$day",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
