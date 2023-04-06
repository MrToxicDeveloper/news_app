import 'dart:async';

import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamed(context, '/');
    });
  }

  // @override
  // void initState() {
  //   super.initState();
  //   Timer(Duration(seconds: 3),
  //           () => Navigator.pushNamed(context, '/');
  //   ););
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "News ",
                style: TextStyle(fontSize: 30),
              ),
              Text(
                "App ",
                style: TextStyle(fontSize: 30, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }

// Future<void> Naviga() async {
//   await Timer(Duration(seconds: 2), () {
//
//     Navigator.pushNamed(context, '/');
//   });
// }
}
