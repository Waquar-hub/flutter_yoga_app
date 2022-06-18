import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_yoga_app/screens/startup.dart';
import 'package:flutter_yoga_app/widgets/custom_appbar.dart';
import 'package:flutter_yoga_app/widgets/custome_drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _homeTween, _yogaTween, _drawerTween, _iconTween, _colorTween;
  late AnimationController _textAnimationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 0),
    );
    _colorTween = ColorTween(begin: Colors.transparent, end: Colors.white)
        .animate(_animationController);
    _iconTween = ColorTween(begin: Colors.white, end: Colors.lightBlue)
        .animate(_animationController);
    _drawerTween = ColorTween(begin: Colors.white, end: Colors.black)
        .animate(_animationController);
    _homeTween = ColorTween(begin: Colors.white, end: Colors.blue)
        .animate(_animationController);
    _yogaTween = ColorTween(begin: Colors.white, end: Colors.black)
        .animate(_animationController);
    _textAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 0));
  }

  bool scrollListner(ScrollNotification scrollNotification) {
    bool scroll = false;
    if (scrollNotification.metrics.axis == Axis.vertical) {
      _animationController.animateTo(scrollNotification.metrics.pixels / 80);
      _textAnimationController.animateTo(scrollNotification.metrics.pixels);
      return scroll = true;
    }
    return scroll;
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomDrawer(),
      backgroundColor: Colors.white,
      body: NotificationListener(
        onNotification: scrollListner,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(50, 150, 50, 40),
                              decoration: const BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                  )),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: const [
                                      Text("1"),
                                      Text("Steak"),
                                    ],
                                  ),
                                  Column(
                                    children: const [
                                      Text("120"),
                                      Text("KCAL"),
                                    ],
                                  ),
                                  Column(
                                    children: const [
                                      Text("26"),
                                      Text("minutes"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Yoga for all",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CustomSliverAppbar()),
                                      );
                                    },
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 150,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8&w=1000&q=80"),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 150,
                                          decoration: const BoxDecoration(
                                            color: Colors.black26,
                                          ),
                                        ),
                                        const Positioned(
                                          right: 20,
                                          left: 10,
                                          top: 5,
                                          child: Text(
                                            "Yoga For Beginner",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        const Positioned(
                                          right: 20,
                                          left: 13,
                                          top: 30,
                                          child: Text(
                                            "Last time : 2 Feb",
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 150,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8&w=1000&q=80"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 150,
                                        decoration: const BoxDecoration(
                                          color: Colors.black26,
                                        ),
                                      ),
                                      const Positioned(
                                        right: 20,
                                        left: 10,
                                        top: 5,
                                        child: Text(
                                          "Yoga For Beginner",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        right: 20,
                                        left: 13,
                                        top: 30,
                                        child: Text(
                                          "Last time : 2 Feb",
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 150,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8&w=1000&q=80"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 150,
                                        decoration: const BoxDecoration(
                                          color: Colors.black26,
                                        ),
                                      ),
                                      const Positioned(
                                        right: 20,
                                        left: 10,
                                        top: 5,
                                        child: Text(
                                          "Yoga For Beginner",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        right: 20,
                                        left: 13,
                                        top: 30,
                                        child: Text(
                                          "Last time : 2 Feb",
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 150,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8&w=1000&q=80"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 150,
                                        decoration: const BoxDecoration(
                                          color: Colors.black26,
                                        ),
                                      ),
                                      const Positioned(
                                        right: 20,
                                        left: 10,
                                        top: 5,
                                        child: Text(
                                          "Yoga For Beginner",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        right: 20,
                                        left: 13,
                                        top: 30,
                                        child: Text(
                                          "Last time : 2 Feb",
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 150,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8&w=1000&q=80"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 150,
                                        decoration: const BoxDecoration(
                                          color: Colors.black26,
                                        ),
                                      ),
                                      const Positioned(
                                        right: 20,
                                        left: 10,
                                        top: 5,
                                        child: Text(
                                          "Yoga For Beginner",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        right: 20,
                                        left: 13,
                                        top: 30,
                                        child: Text(
                                          "Last time : 2 Feb",
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 150,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8&w=1000&q=80"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 150,
                                        decoration: const BoxDecoration(
                                          color: Colors.black26,
                                        ),
                                      ),
                                      const Positioned(
                                        right: 20,
                                        left: 10,
                                        top: 5,
                                        child: Text(
                                          "Yoga For Beginner",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        right: 20,
                                        left: 13,
                                        top: 30,
                                        child: Text(
                                          "Last time : 2 Feb",
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    "Yoga for Students",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 150,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8&w=1000&q=80"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 150,
                                        decoration: const BoxDecoration(
                                          color: Colors.black26,
                                        ),
                                      ),
                                      const Positioned(
                                        right: 20,
                                        left: 10,
                                        top: 5,
                                        child: Text(
                                          "Yoga For Beginner",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        right: 20,
                                        left: 13,
                                        top: 30,
                                        child: Text(
                                          "Last time : 2 Feb",
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 150,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8&w=1000&q=80"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 150,
                                        decoration: const BoxDecoration(
                                          color: Colors.black26,
                                        ),
                                      ),
                                      const Positioned(
                                        right: 20,
                                        left: 10,
                                        top: 5,
                                        child: Text(
                                          "Yoga For Beginner",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        right: 20,
                                        left: 13,
                                        top: 30,
                                        child: Text(
                                          "Last time : 2 Feb",
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        height: 150,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8&w=1000&q=80"),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 150,
                                        decoration: const BoxDecoration(
                                          color: Colors.black26,
                                        ),
                                      ),
                                      const Positioned(
                                        right: 20,
                                        left: 10,
                                        top: 5,
                                        child: Text(
                                          "Yoga For Beginner",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      const Positioned(
                                        right: 20,
                                        left: 13,
                                        top: 30,
                                        child: Text(
                                          "Last time : 2 Feb",
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // Container(
                            //   height: 1000,
                            //   color: Colors.lightBlueAccent,
                            // )
                          ],
                        ),
                      ],
                    ),
                  ),
                  CustomAppbar(
                    onPressed: () {
                      scaffoldKey.currentState?.openDrawer();
                    },
                    animationController: _animationController,
                    colorsTween: _colorTween,
                    drawerTween: _drawerTween,
                    homeTween: _homeTween,
                    iconTween: _iconTween,
                    yogaTween: _yogaTween,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
