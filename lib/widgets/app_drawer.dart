import 'package:flutter/material.dart';
import 'package:insta_captions/screens/about_us.dart';

class AppDrawer extends StatelessWidget {
  final AppBar appBar;

  AppDrawer(this.appBar);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? (MediaQuery.of(context).size.height -
                          appBar.preferredSize.height -
                          MediaQuery.of(context).padding.top -
                          MediaQuery.of(context).size.height * 0.01) *
                      0.3
                  : (MediaQuery.of(context).size.height -
                          appBar.preferredSize.height -
                          MediaQuery.of(context).padding.top -
                          MediaQuery.of(context).size.height * 0.07) *
                      0.5,
              alignment: Alignment.center,

              child: Image.asset(
                'android/assets/images/appdrawerimage.png',
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? (MediaQuery.of(context).size.height -
                          appBar.preferredSize.height -
                          MediaQuery.of(context).padding.top -
                          MediaQuery.of(context).size.height * 0.01) *
                      0.82
                  : (MediaQuery.of(context).size.height -
                          appBar.preferredSize.height -
                          MediaQuery.of(context).padding.top -
                          MediaQuery.of(context).size.height * 0.07) *
                      0.9,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  InkWell(
                    onTap: () => Navigator.of(context).pushNamed('/'),
                    child: ListTile(
                      leading: Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Home",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  Divider(),
                  InkWell(
                    onTap: () {},
                    child: ListTile(
                      leading: Icon(
                        Icons.list,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Favourites",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  Divider(),
                  InkWell(
                    onTap: () => Navigator.of(context).pushNamed(AboutUs.routeName),
                    child: ListTile(
                      leading: Icon(
                        Icons.info_outline,
                        color: Colors.white,
                      ),
                      title: Text(
                        "About Us",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
