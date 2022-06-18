import 'dart:async';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yoga_app/screens/workout_details.dart';
import 'package:provider/provider.dart';

class RuReady extends StatelessWidget {
  RuReady({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimerModel>(
      create: (context) {
        return TimerModel(context);
      },
      child: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .4,
              ),
              const Center(
                child: Text(
                  "ARE YOU READY ?",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Consumer<TimerModel>(
                builder: (context, myModel, child) {
                  return Text(
                    myModel.counter.toString(),
                    style: const TextStyle(fontSize: 40),
                  );
                },
              ),
              const Spacer(),
              const Divider(
                thickness: 1.5,
              ),
              const Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Text(
                    "Next: Anulome Vilom",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TimerModel with ChangeNotifier {
  TimerModel(context) {
    myTimer(context);
  }
  int counter = 5;
  myTimer(context) async {
    Timer.periodic(
      (Duration(seconds: 1)),
      (timer) {
        counter--;
        notifyListeners();
        if (counter == 0) {
          timer.cancel();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => WorkOutDetails()));
        }
      },
    );
  }
}
