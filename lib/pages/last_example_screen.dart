import 'package:flutter/material.dart';

class LastExampleScreen extends StatefulWidget {
  static const String routeName = '/last_example_screen';
  const LastExampleScreen({Key? key}) : super(key: key);

  @override
  State<LastExampleScreen> createState() => _LastExampleScreenState();
}

class _LastExampleScreenState extends State<LastExampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text('Api Last Page'),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
