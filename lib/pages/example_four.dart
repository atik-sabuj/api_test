import 'package:api_test/pages/last_example_screen.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ExampleFour extends StatefulWidget {
  static const String routeName = '/example_four';
  const ExampleFour({Key? key}) : super(key: key);

  @override
  State<ExampleFour> createState() => _ExampleFourState();
}

class _ExampleFourState extends State<ExampleFour> {
  var data;
  Future<void> getUserApi ()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if(response.statusCode == 200){
        data = jsonDecode(response.body.toString());
    }else {
      
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api 4th Page/Users 2.0'),
        actions: [
          IconButton(
            onPressed: () async {
              Navigator.pushReplacementNamed(context, LastExampleScreen.routeName);
            },
            icon: const Icon(Icons.photo_album),
            // icon: const Text('Home')
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                future: getUserApi(),
                builder: (context, snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Text('Loading...');
                  }else{
                    return ListView.builder(
                      itemCount: data.length,
                        itemBuilder: (context, index){
                          return Card(
                            child: Column(
                              children: [
                                ReusableRow(title: 'name',value:data[index]['name'].toString(),),
                                ReusableRow(title: 'username',value:data[index]['username'].toString(),),
                                ReusableRow(title: 'address',value:data[index]['address']['street'].toString(),),
                                ReusableRow(title: 'Lat',value:data[index]['address']['geo']['lat'].toString(),),
                                ReusableRow(title: 'Lat',value:data[index]['address']['geo']['lng'].toString(),),
                              ],
                            )
                          );
                    });
                  }
                },
              ),
          )
        ],
      )
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
