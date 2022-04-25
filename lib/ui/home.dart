import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(onPressed: () {
            print('Hey');
          }, icon: Icon(Icons.menu))
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/umbrella.png',
              fit: BoxFit.fill,
            ),
          )
        ],
      )
    );
  }
}