import 'package:flutter/material.dart';
import 'package:insta_captions/models/captions.dart';
import 'package:insta_captions/widgets/app_drawer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class CaptionsScreen extends StatefulWidget {
  static const String routeName = '/captions-screen';

  @override
  _CaptionsScreenState createState() => _CaptionsScreenState();
}

class _CaptionsScreenState extends State<CaptionsScreen> {

  File image;


  @override
  void didChangeDependencies() {
    final Map<String, dynamic> routeArgs =
        ModalRoute.of(context).settings.arguments;
    image = routeArgs["image"];
  }

  Future<void> generateCaptions() async {
    final url = 'http://saifkazi.pythonanywhere.com/get_select_genres';
    final response = await http.get(url);
    print(response.body);
    setState(() {
      final Map<String, dynamic> data = jsonDecode(response.body);
      Captions.captions = data["Generated_Captions"];
    });
  }



  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(
        "Captions",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
    // TODO: implement build
    return Scaffold(
      drawer: AppDrawer(appBar),
      appBar: appBar,
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            color: Colors.white,
            height: 350,
            margin: EdgeInsets.all(25),
            child: image != null ? Image.file(image) : Text("Please select an image!"),
            alignment: Alignment.center,
          ),
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
            onPressed: generateCaptions,
            child: Text(
              "Generate Captions",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            color: Theme.of(context).accentColor,
          ),
          Container(
            margin: EdgeInsets.all(15),
            width: double.infinity,
            height: 300,
            child: Captions.captions.length == null
                ? Text("Please select image to generate caption")
                : ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: Captions.captions.length,
                    itemBuilder: (ctx, i) => ListTile(
                      title: Text(
                        Captions.captions[i],
                        style: TextStyle(color: Colors.white, fontSize: 22),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
          )
        ],
      ),
    );
  }


}
