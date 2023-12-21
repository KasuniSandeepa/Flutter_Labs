import 'package:flutter/material.dart';
import 'package:flutter_lecture4/pages/add_post.dart';
import 'package:flutter_lecture4/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
     initialRoute: Home.routeName,
     routes: {
        Home.routeName: (context) => Home(),
        AddPost.routeName: (context) => AddPost(),
     },
    );
  }
}



