import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../util/utils.dart' as util;
import 'dart:async';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void getStuff() async {
    Map data = await getWeather(util.defaultCity);
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(onPressed: getStuff,
           icon: const Icon(Icons.menu))
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
          ),
          Container(
            alignment: Alignment.center,
            child: Image.asset('assets/light_rain.png'),
          ),
          Container(
            // alignment: Alignment.center,
            margin: const EdgeInsets.fromLTRB(80.0, 480.0, 0.0, 0.0),
            child: Text(
              '64.9F',
              style: weatherStyle(),
            ),
          )
        ],
      )
    );
  }

  Future<Map> getWeather( String city) async {
    String apiUrl = "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=${util.appId}";

    Response response = await get(Uri.parse(apiUrl));

    // print(response.body);
    return jsonDecode(response.body);
    
  }


}

TextStyle cityStyle() {
  return const TextStyle(
    color: Colors.white,
    fontSize: 22.9,
    fontStyle: FontStyle.italic
  );
}
TextStyle weatherStyle() {
  return const TextStyle(
    color: Colors.white,
    fontSize: 49.9,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500
  );
}