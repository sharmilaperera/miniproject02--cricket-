import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Ground(),
  ));
}

class Ground extends StatefulWidget {
  const Ground({super.key});

  @override
  State<Ground> createState() => _GroundState();
}

class _GroundState extends State<Ground> {
  int runs = 0;
  int balls = 6;
  String run_text = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mini Cricket"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 6, 58, 117),
      ),
      backgroundColor: Colors.blue[700],
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Flexible(
                  child: Column(
                    children: [
                      Image.asset(
                        "asserts/bat.jpg",
                        fit: BoxFit.contain,
                        scale: 1.5,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Runs",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "$runs",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    children: [
                      Image.asset(
                        "asserts/ball.jpeg",
                        fit: BoxFit.contain,
                        scale: 1.5,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Balls",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "$balls",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    balls == 6 ? "" : "$run_text Runs",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                balls > 0
                    ? ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.blue[900]!,
                          ),
                          elevation: MaterialStateProperty.all<double?>(10),
                        ),
                        onPressed: () {
                          setState(() {
                            Random random = Random();
                            int run = (random.nextInt(6) + 1);
                            print(run);
                            if (run != 5) {
                              runs = runs + run;
                              balls = balls - 1;
                              run_text = run.toString();
                            } else {
                              runs = runs + 0;
                              balls = balls - 1;
                              run_text = "No";
                            }
                          });
                        },
                        child: Text(
                          "Bat",
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    : ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.red[900]!,
                          ),
                          elevation: MaterialStateProperty.all<double?>(10),
                        ),
                        onPressed: () {
                          setState(() {
                            balls = 6;
                            runs = 0;
                            run_text = "";
                          });
                        },
                        child: Text(
                          "Restart",
                          style: TextStyle(fontSize: 20),
                        ),
                      )
              ],
            )
          ],
        ),
      )),
    );
  }
}
