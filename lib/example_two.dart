import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:api_test/models/PhotosModel.dart';
import 'package:http/http.dart' as http;

class ExampleTwo extends StatefulWidget {
  const ExampleTwo({Key? key}) : super(key: key);

  @override
  State<ExampleTwo> createState() => _ExampleTwoState();
}

class _ExampleTwoState extends State<ExampleTwo> {

  List<Photos> photoList = [];

  Future<List<Photos>> getPhotos ()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
       for(Map i in data){
         Photos photos = Photos(title: i['title'], url: i['url']);
         photoList.add(photos);
         }
          return photoList;
    }
    else {
    return photoList;
     }
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Api Photos Test'),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}

class Photos{
  String title, url;
  Photos({required this.title, required this.url});
}
