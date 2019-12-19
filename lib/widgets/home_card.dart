import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeCard extends StatelessWidget{
  final String cardText;
  final String imagePath;
  final Function onTap;

  HomeCard(
      {@required this.cardText,
        @required this.imagePath,
        @required this.onTap});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    // TODO: implement build
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
        height: 300,
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          child: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                      Radius.circular(15)
                  ),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Positioned(
                bottom: 15,
                top: 190,
                right: 0,
                left: 0,
                child: Container(
                  width: 300,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.center,
                  color: Colors.black54,
                  child: Text(
                    cardText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}