import 'dart:convert';
import 'package:api_test/models/PostsModel.dart';
import 'package:api_test/pages/example_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<PostsModel> postList = [];

  Future<List<PostsModel>> getPostApi ()async{
    final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      postList.clear();
      for (Map i in data){
        postList.add(PostsModel.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Api 1st Page/Text'),
        actions: [
          IconButton(
            onPressed: () async {
              Navigator.pushReplacementNamed(context, ExampleTwo.routeName);
            },
            icon: const Icon(Icons.photo),
            // icon: const Text('Home')
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPostApi(),
                builder:(context, snapshot){
                 if(!snapshot.hasData){
                   return Text('Loading...');
                 }else{
                   return ListView.builder(
                       itemCount: postList.length,
                       itemBuilder: (context,index){
                     return Card(
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text('Title:', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                             Text(postList[index].title.toString()),
                             SizedBox(height: 5,),
                             Text('Description:', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                             SizedBox(height: 5,),
                             Text(postList[index].body.toString()),
                           ],
                         ),
                       ),
                     );
                   });
                 }
                },
            ),
          )
          ],
      ),
    );
  }
}
