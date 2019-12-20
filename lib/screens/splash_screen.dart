import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  static bool show = false;

  @override
  void initState() {
    // TODO: implement initState
    new Future.delayed(const Duration(milliseconds: 200), () {
      show = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
//              Image.asset(
//                'android/assets/images/splash_logo.png',
//                fit: BoxFit.contain,
//              ),
              AnimatedOpacity(
                opacity: show ? 1.0 : 0.0,
                duration: Duration(milliseconds: 700),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "InstaCaptions!",
                    style: TextStyle(
                        fontSize: 72,
                        color: Colors.white,
                        fontFamily: 'LemonJelly'),
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