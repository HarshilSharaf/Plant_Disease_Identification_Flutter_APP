
import 'dart:io';
import 'package:flutterapp/Camscreen.dart';
import 'package:flutterapp/results.dart';
import 'package:flutter/material.dart';
import 'detailsPage.dart';
import'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:async/async.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _image;
  Future getImageFromGallery() async {
final navigator=Navigator.of(context);
await navigator.push(
        MaterialPageRoute(
          builder: (context) =>
              Res(),
        ),
      );



  }
  getImageFromCamera(BuildContext context) async {

final navigator=Navigator.of(context);
//File pickedImage = await ImagePicker.pickImage(source: ImageSource.camera);
//if (pickedImage != null) {
 // print(pickedImage.path);
  await navigator.push(
    MaterialPageRoute(
      builder: (context) =>
         Cam(),
    ),
  );

//}

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFF21BFBD)),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[

            DrawerHeader(

              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                    image:AssetImage('assets/images/Drawer.jpg')),
                color: Colors.blue,
              ),
            ),
            ListTile(
              trailing: Icon(Icons.star),
              title: Text('Rate Us!',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold
              ),),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            Divider(),
            ListTile(

              trailing: Icon(Icons.share),
              title: Text('Share This app',

                style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold
              ),),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            Divider(),
            Container(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
              ),
              color: Colors.white,
              width: double.infinity,
              height: 0.8,
            ),
            Container(

                padding: EdgeInsets.all(10),
                height: 100,
                child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Text("V 1.0.0",style: TextStyle(
                      color: Colors.red,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold),))),
          ],


        ),

      )
      ,

      backgroundColor: Color(0xFF21BFBD),
      body: ListView(
        children: <Widget>[

          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Text('Plant Disease Identifier',

                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),

              ],
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 20.0),
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 45.0),
                    child: Container(
                        height: MediaQuery.of(context).size.height - 400.0,
                        child: ListView(children: [
                          _buildPlantItem('assets/images/apple.jpg', 'Apple'),
                          _buildPlantItem('assets/images/blueberry.jpg', 'Blueberry'),
                          _buildPlantItem('assets/images/cherry.jpg', 'Cherry'),
                          _buildPlantItem('assets/images/Corn.jpg', 'Corn'),
                          _buildPlantItem('assets/images/grape.jpg', 'Grapes'),
                          _buildPlantItem('assets/images/orange.jpg', 'Orange'),
                          _buildPlantItem('assets/images/peach.jpg', 'Peach'),
                          _buildPlantItem('assets/images/Potato.jpg', 'Potato'),
                          _buildPlantItem('assets/images/Raspberry.jpg', 'Raspberry'),
                          _buildPlantItem('assets/images/Red Pepper.jpg', 'Red Pepper'),
                          _buildPlantItem('assets/images/soyabean.jpg', 'Soyabeans'),
                          _buildPlantItem('assets/images/squash.jpg', 'Squash'),
                          _buildPlantItem('assets/images/strawberry.jpg', 'Strawberry'),
                          _buildPlantItem('assets/images/Tomato.jpg', 'Tomato')
                        ]))),
                    Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new  Container (
                      margin: EdgeInsets.fromLTRB(0,60,0,0),
                      height: 65.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.green,
                            style: BorderStyle.solid,
                            width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(

                        child:ButtonTheme(
                          height: 200,
                          child:new RaisedButton(
                            color: Colors.white,
                          highlightColor: Colors.cyan,
                          shape: new RoundedRectangleBorder(

                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          onPressed: (){

                            getImageFromCamera(context);
                                  setState(() {
                                    color: Colors.red;
                                  });
                            print('Camera button pressed');},
                            child:new Icon(

                                Icons.camera),
                            ),
                        ),
                      ),
                    ),//Camera Button
                    Container(
                      margin: EdgeInsets.fromLTRB(0,60,0,0),
                      height: 65.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.green,
                            style: BorderStyle.solid,
                            width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child:ButtonTheme(
                          height: 200,
                          child:new RaisedButton(
                            color: Colors.white,
                            highlightColor: Colors.cyan,
                            splashColor: Colors.yellow,
                            shape: new RoundedRectangleBorder(

                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            onPressed: (){

                              getImageFromGallery();
                              print('Gallery button pressed');},
                            child:new Icon(
                                Icons.filter),
                          ),
                        ),
                      ),
                    ), //Gallery Button

                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPlantItem(String imgPath, String plantName) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: InkWell(
          highlightColor: Colors.grey.shade600,
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailsPage(heroTag: imgPath, plantName: plantName)
            ));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Row(
                  children: [
                    Hero(
                      tag: imgPath,
                      child: Image(
                        image: AssetImage(imgPath),
                        fit: BoxFit.cover,
                        height: 75.0,
                        width: 75.0
                      )
                    ),
                    SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Text(
                          plantName,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold
                          )
                        ),

                      ]
                    )
                  ]
                )
              ),
              IconButton(
                icon: Icon(Icons.add),
                color: Colors.black,
                onPressed: () {}
              )
            ],
          )
        ));
  }



  }

