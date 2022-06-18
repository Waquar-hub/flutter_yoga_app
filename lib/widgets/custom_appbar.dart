import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  AnimationController animationController;
  Animation colorsTween, homeTween, yogaTween, drawerTween, iconTween;
  VoidCallback onPressed;

  CustomAppbar(
      {Key? key,
      required this.onPressed,
      required this.animationController,
      required this.colorsTween,
      required this.drawerTween,
      required this.homeTween,
      required this.iconTween,
      required this.yogaTween})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return AppBar(
            leading: IconButton(
              icon: (const Icon(Icons.dehaze)),
              color: drawerTween.value,
              onPressed: onPressed,
            ),
            backgroundColor: colorsTween.value,
            elevation: 0,
            title: Row(
              children: [
                Text(
                  "home",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: homeTween.value),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "yoga",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: yogaTween.value),
                )
              ],
            ),
            actions: [
              Icon(
                Icons.notifications,
                color: iconTween.value,
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
