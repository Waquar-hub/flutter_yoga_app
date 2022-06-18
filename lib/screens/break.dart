import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BreakTimer extends StatelessWidget {
  const BreakTimer({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BreakTimerModel>(
      create: (context) {
        return BreakTimerModel(context);
      },
      child: Scaffold(
          body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                "https://images.pexels.com/photos/916337/pexels-photo-916337.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            const Text(
              "Break Time",
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Consumer<BreakTimerModel>(
              builder: (context, myModel, child) {
                return Text(
                  myModel.countDown.toString(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text("Skip"),
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
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Text(
                  "Next: Anulome Vilom",
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class BreakTimerModel with ChangeNotifier {
  int countDown = 20;
  BreakTimerModel(context) {
    Timer.periodic(
      Duration(seconds: 1),
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
}
