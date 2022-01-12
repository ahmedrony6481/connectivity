import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StreamSubscription? subscription;
  Future checkConnection() async{
    var connectivityResult= await(Connectivity().checkConnectivity());
    if(connectivityResult==ConnectivityResult.mobile){
      Fluttertoast.showToast(msg: "Connected With Mobile");

    }
    else if(connectivityResult==ConnectivityResult.wifi){
      Fluttertoast.showToast(msg: "Connected with Wi-Fi");
    }
    else(Fluttertoast.showToast(msg: "Network Error"));
  }
  @override
  void InitState(){
     subscription =Connectivity().onConnectivityChanged.listen((event) {checkConnection();});
     super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Connectivity Check', style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2021/05/02/02/05/elon-musk-6222396__340.jpg'),
          ),
          SizedBox(
            height: 30,
          ),
          Text('Welcome to my Login Page', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          SizedBox(
            height: 50,
            child: Divider(
              thickness: 05,
              color: Colors.blue,
              indent: 20,
              endIndent: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Email or Phone number',
                hintText: 'Type your Email or Phone number',
                border: OutlineInputBorder(),

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Type your Password',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlineButton(onPressed: checkConnection,child: Text('Login'),)
              ],
            ),
          )
        ],
      ),

    );
  }
}

