import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_yoga_app/screens/break.dart';
import 'package:provider/provider.dart';

class WorkOutDetails extends StatelessWidget {
  const WorkOutDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WorkoutTimerModel>(
      create: (context) => WorkoutTimerModel(context),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    height: 350,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          "https://images.pexels.com/photos/2035066/pexels-photo-2035066.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "Anulom Vilom",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 35),
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 80),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.blueAccent,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "00",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          " : ",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Consumer<WorkoutTimerModel>(
                          builder: (context, myModel, child) {
                            return Text(
                              myModel.countDown.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Text("PAUSE"),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "previous",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "skip",
                            style: TextStyle(fontSize: 18),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1.5,
                  ),
                  const Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 20,
                      ),
                      child: Text(
                        "Next: Anulome Vilom",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Consumer<WorkoutTimerModel>(
              builder: (context, myModel, child) {
                return Visibility(
                  visible: myModel.show(),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.blueAccent.withOpacity(0.8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Consumer<WorkoutTimerModel>(
                          builder: (context, myModel, child) {
                            return ElevatedButton(
                              onPressed: () {
                                myModel.show();
                              },
                              child: const Text(
                                "PAUSED",
                                style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.white,
                                ),
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "yoga feels better",
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          height: 80,
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          child: const Text(
                            "Restart",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          child: const Text(
                            "Quit",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            myModel.hide();
                          },
                          child: const Text(
                            "Resume",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class WorkoutTimerModel with ChangeNotifier {
  int countDown = 30;
  bool visible = false;
  WorkoutTimerModel(context) {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        countDown--;
        notifyListeners();
        if (countDown == 0) {
          timer.cancel();
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => BreakTimer()));
        }
      },
    );
  }
  void show() {
    visible = true;
    notifyListeners();
  }

  void hide() {
    visible = false;
    notifyListeners();
  }
}
