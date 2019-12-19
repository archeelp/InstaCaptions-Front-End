import 'package:flutter/material.dart';
import 'package:insta_captions/widgets/app_drawer.dart';

class AboutUs extends StatelessWidget {
  static const String routeName = '/about-us';

  @override
  Widget build(BuildContext context) {
    final AppBar appBar = AppBar(
      title: Text(
        "About Us",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
    // TODO: implement build
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: appBar,
        drawer: AppDrawer(appBar),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Text(
                  "Some text",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "This app is developed by :\n\n1) Kunjal Shah\n2) Archeel Parekh\n3) Yogesh Deshpande\n4) Yash Tailor\n5) Saif Kazi\n",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
