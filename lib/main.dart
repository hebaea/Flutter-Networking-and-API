import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:networking/data.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<Data> futureData;

  @override
  void initState() {
    super.initState();
    futureData = getUserById();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Netowrking'),
      ),
      body: Center(
        child: FutureBuilder<Data>(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.email ?? 'default value');
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  Future<Data> getUserById() async {
    http.Response postResponse =
        await http.get('https://reqres.in/api/users/2');
    if (postResponse.statusCode == 200) {
      //success you can get the value
      print(postResponse.body);
      return Data.fromJson(json.decode(postResponse.body));
    } else {
      throw Exception('Cant not load ');
    }
  }
}
