import 'package:flutter/material.dart';
import 'package:insta_captions/screens/captions_screen.dart';
import 'package:insta_captions/widgets/app_drawer.dart';
import 'package:insta_captions/widgets/home_card.dart';
import 'package:insta_captions/screens/about_us.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final ThemeData myTheme = ThemeData(
    primaryColor: Color.fromRGBO(23, 32, 42, 1),
    accentColor: Color.fromRGBO(205, 97, 85, 1),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InstaCaptions',
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      home: Home(),
      routes: {
        CaptionsScreen.routeName: (ctx) => CaptionsScreen(),
        AboutUs.routeName: (ctx) => AboutUs(),
      },
    );
  }
}

class Home extends StatelessWidget {
  File imageFile;
  Future<void> captureImage(ImageSource imageSource,
      BuildContext context) async {
    try {
      imageFile = await ImagePicker.pickImage(source: imageSource);
    } catch (e) {
      print(e);
    }
    if(imageFile != null){
      Navigator.of(context).pushNamed(CaptionsScreen.routeName,
          arguments: {"image": imageFile });
    }

  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(
        "InstaCaptions",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Theme
          .of(context)
          .primaryColor,
    );
    // TODO: implement build
    return Scaffold(
      appBar: appBar,
      drawer: AppDrawer(appBar),
      backgroundColor: Theme
          .of(context)
          .primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          HomeCard(
              cardText: "Open Camera",
              imagePath: "android/assets/images/camera.png",
              onTap: () => captureImage(ImageSource.camera, context)),
          HomeCard(
              cardText: "Select a Photo",
              imagePath: "android/assets/images/files.png",
              onTap: () => captureImage(ImageSource.gallery, context)),
        ],
      ),
    );
  }
}

