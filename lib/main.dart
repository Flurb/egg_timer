import 'package:egg_timer/egg_timer.dart';
import 'package:egg_timer/egg_timer_controls.dart';
import 'package:egg_timer/egg_timer_dial.dart';
import 'package:egg_timer/egg_timer_time_display.dart';
import 'package:flutter/material.dart';

const Color GRADIENT_TOP = const Color(0xFFF5F5F5);
const Color GRADIENT_BOTTOM = const Color(0xFFE8E8E8);

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final EggTimer eggTimer;

  _MyAppState() : eggTimer = EggTimer(maxTime: const Duration(minutes: 35));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Egg Timer',
        theme: ThemeData(fontFamily: 'BebasNeue'),
        home: Scaffold(
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [GRADIENT_TOP, GRADIENT_BOTTOM])),
            child: Center(
              child: Column(
                children: [
                  EggTimerTimeDisplay(),
                  EggTimerDial(
                    currentTime: eggTimer.currentTime,
                    maxTime: eggTimer.maxTime,
                    ticksPerSection: 5,
                  ),
                  Expanded(child: Container()),
                  EggTimerControls()
                ],
              ),
            ),
          ),
        ));
  }
}
