import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../util/utils.dart' as util;
import 'dart:convert';
import 'dart:async';

class Home extends StatefulWidget {
 Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void getStuff() async {
    Map data = await getWeather(util.defaultCity);
    // print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(onPressed: getStuff, icon: Icon(Icons.menu))
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
            margin: const EdgeInsets.fromLTRB(0.0, 10.9, 20.9, 0.0),
            child: Text(
              'Bangalore',
              style: cityStyle(),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Image.asset('assets/light_rain.png'),
          ),
          Container(
            // alignment: Alignment.center,
            margin: const EdgeInsets.fromLTRB(80.0, 450.0, 0.0, 0.0),
            child: updateTempWidget("Bengaluru"),
          ),
        ],
      ),
    );
  }

  Future<Map> getWeather(String city) async {
    String apiUrl =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=${util.appId}&units=metric";

    Response response = await get(Uri.parse(apiUrl));
    return jsonDecode(response.body);
  }

  Widget updateTempWidget(String city) {
    return FutureBuilder(
      future: getWeather(city),
      builder: ((BuildContext context, AsyncSnapshot<Map> snapshot) {
        if (snapshot.hasData) {
          Map? content = snapshot.data;
          return Column(
            children: [
              ListTile(
                title: Text(content!['main']['temp'].toString()),
              )
            ],
          );
        } else {
          return Container();
        }
      }),
    );
  }
}

TextStyle cityStyle() {
  return TextStyle(
      color: Colors.white,
      fontSize: 22.9,
      fontStyle: FontStyle.italic,
      letterSpacing: 2.0,
      fontWeight: FontWeight.w600);
}

TextStyle weatherStyle() {
  return TextStyle(
      color: Colors.white,
      fontSize: 49.9,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500);
}
