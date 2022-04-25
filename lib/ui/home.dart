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
          }, icon: const Icon(Icons.menu))
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/umbrella.png',
              height: 900.0,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsets.fromLTRB(0.0 ,10.9, 20.9,0.0),
            child: Text(
              'Spokane',
              style: cityStyle(),
            ),
          )
        ],
      )
    );
  }
}

TextStyle cityStyle() {
  return const TextStyle(
    color: Colors.white,
    fontSize: 22.9,
    fontStyle: FontStyle.italic
  );
}