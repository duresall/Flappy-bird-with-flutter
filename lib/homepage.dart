import 'dart:async';
import 'dart:math';

import 'package:birdgame/flappy.dart';
import 'package:birdgame/obstacle.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double birdYaxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = birdYaxis;
  bool hasStarted = false;
  double gravity = 4.9;
  double initialVelocity = 2.8;
  //creating an initial value to the height of the obstacle

  static double obstacleXoneLower = 1;
  static double obstacleXoneUpper = 1;
  //creating score count
  int score = 0;

  void jump() {
    setState(() {
      time = 0;
      initialHeight = birdYaxis;
    });
  }

  void startGame() {
    hasStarted = true;

    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      time += 0.04;

      // Update height using the standard equation for motion under gravity
      height = initialVelocity * time - gravity * time * time;

      setState(() {
        birdYaxis = initialHeight - height;
        obstacleXoneLower -= 0.03;
        obstacleXoneUpper -= 0.03;
      });

      setState(() {
        if (obstacleXoneLower < -1.2) {
          obstacleXoneLower += 2.3;
          obstacleXoneUpper += 2.3;
          score += 1;
        } else {
          obstacleXoneLower -= 0.03;
          obstacleXoneUpper -= 0.03;
        }
      });

      if (birdYaxis > 1) {
        timer.cancel();
        hasStarted = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (hasStarted) {
          jump();
        } else {
          startGame();
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    //text that says tap to play

                    AnimatedContainer(
                      color: Colors.blue,
                      duration: const Duration(milliseconds: 0),
                      alignment: Alignment(0, birdYaxis),
                      child: const Flappy(),
                    ),

                    Container(
                      alignment: const Alignment(0, 0.5),
                      child: hasStarted
                          ? const Text("")
                          : const Text(
                              "T A P  T O  P L A Y",
                              style: TextStyle(color: Colors.black),
                            ),
                    ),
//creating  the first set of obstacles two obstacles at a time
                    AnimatedContainer(
                        duration: const Duration(milliseconds: 0),
                        alignment: Alignment(obstacleXoneLower, 1),
                        child: const Obstacle(
                          size: 200.0,
                        )),
                    AnimatedContainer(
                        duration: const Duration(milliseconds: 10),
                        alignment: Alignment(obstacleXoneUpper, -1),
                        child: const Obstacle(
                          size: 60.0,
                        )),
                    //creating  the second set of obstacles two obstacles at a time
                    // AnimatedContainer(
                    //     duration: const Duration(milliseconds: 0),
                    //     alignment: Alignment(obstcleXtwoLower, 1),
                    //     child: const Obstacle(
                    //       size: 100.0,
                    //     )),
                    // AnimatedContainer(
                    //     duration: const Duration(milliseconds: 10),
                    //     alignment: Alignment(obstcleXtwoUpper, -1),
                    //     child: const Obstacle(
                    //       size: 160.0,
                    //     )),
                  ],
                )),
            Container(
              height: 10,
              color: Colors.green,
            ),
            Expanded(
                child: Container(
              color: Colors.brown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    const  Text(
                        "Score ",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                       
                        
                        score.toString(),
                          style: const TextStyle(color: Colors.white, fontSize: 20))
                    ],
                  ),
               const    Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Best Score",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      Text("0",
                          style: TextStyle(color: Colors.white, fontSize: 20))
                    ],
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
