import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_captions/screens/about_us.dart';
import 'package:insta_captions/screens/captions_screen.dart';
import 'package:insta_captions/screens/splash_screen.dart';
import 'package:insta_captions/widgets/app_drawer.dart';
import 'package:insta_captions/widgets/home_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeData myTheme = ThemeData(
    primaryColor: Color.fromRGBO(23, 32, 42, 1),
    accentColor: Color.fromRGBO(205, 97, 85, 1),
    fontFamily: 'Raleway',
  );


  static bool show = false;


  @override
  void initState() {
    // TODO: implement initState
    new Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() {
        show = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InstaCaptions',
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      home: !show ? SplashScreen() : Home(),
      routes: {
        CaptionsScreen.routeName: (ctx) => CaptionsScreen(),
        AboutUs.routeName: (ctx) => AboutUs(),
      },
    );
  }
}

class Home extends StatelessWidget {
  File imageFile;

  Future<void> captureImage(
      ImageSource imageSource, BuildContext context) async {
    try {
      imageFile = await ImagePicker.pickImage(source: imageSource);
    } catch (e) {
      print(e);
    }
    if (imageFile != null) {
      Navigator.of(context)
          .pushNamed(CaptionsScreen.routeName, arguments: {"image": imageFile});
    }
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(
        "InstaCaptions",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
    // TODO: implement build
    return Scaffold(
      appBar: appBar,
      drawer: AppDrawer(appBar),
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: (MediaQuery.of(context).size.height -
              appBar.preferredSize.height -
              MediaQuery.of(context).padding.top),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              HomeCard(
                cardText: "Open Camera",
                imagePath: "android/assets/images/camera.png",
                onTap: () => captureImage(ImageSource.camera, context),
                appBar: appBar,
              ),
              HomeCard(
                cardText: "Select a Photo",
                imagePath: "android/assets/images/files.png",
                onTap: () => captureImage(ImageSource.gallery, context),
                appBar: appBar,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
