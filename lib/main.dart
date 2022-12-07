import 'package:api_test/pages/example_three.dart';
import 'package:api_test/pages/example_two.dart';
import 'package:api_test/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      //home: HomeScreen(),
      //home: ExampleTwo(),
      //home: ExampleThree(),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName:(context)=>HomeScreen(),
        ExampleTwo.routeName:(context)=>ExampleTwo(),
        ExampleThree.routeName:(context)=>ExampleThree(),
      },
    );
  }
}

