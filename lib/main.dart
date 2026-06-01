import 'dart:async' as async;
import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const TimerApp());
}

class TimerApp extends StatefulWidget {
  const TimerApp({super.key});

  @override
  State<TimerApp> createState() => _TimerAppState();
}

class _TimerAppState extends State<TimerApp> {
  Timer? repeatedfunc;
  bool isRunning = false;
  Duration duration = Duration(seconds: 0);

  startTimer() {
    repeatedfunc = async.Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        int newSeconds = duration.inSeconds + 1;
        duration = Duration(seconds: newSeconds);
      });
    });
  }

  stopTimer() {
    repeatedfunc?.cancel();
  }

  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 70,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    duration.inHours.toString().padLeft(2, '0'),
                    style: const TextStyle(fontSize: 50),
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  ':',
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
                const SizedBox(width: 10),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 70,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    duration.inMinutes.remainder(60).toString().padLeft(2, '0'),
                    style: const TextStyle(fontSize: 50),
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  ':',
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
                const SizedBox(width: 10),
                Container(
                  margin: const EdgeInsets.all(10),
                  height: 70,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    duration.inSeconds.remainder(60).toString().padLeft(2, '0'),
                    style: const TextStyle(fontSize: 50),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            isRunning
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          stopTimer();
                        },
                        child: const Text(
                          'Stop Timer',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          stopTimer();
                          setState(() {
                            duration = Duration(seconds: 0);
                            isRunning = false;
                          });
                        },

                        child: const Text(
                          'Cancel Timer',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  )
                : ElevatedButton(
                    onPressed: () {
                      startTimer();
                      setState(() {
                        isRunning = true;
                      });
                    },
                    child: const Text(
                      'Start Timer',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
