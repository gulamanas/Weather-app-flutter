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
  Future _goToNextScreen(BuildContext context) async {
    Map results = await Navigator.of(context).push(
      MaterialPageRoute<dynamic>(builder: (BuildContext context) {
        return ChangeCity();
      })
    );
  }

  // void getStuff() async {
  //   Map data = await getWeather(util.defaultCity);
  //   // print(data);
  // }

  dynamic temp;

  Future<Map> getWeather(String city) async {
    String apiUrl =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=${util.appId}&units=metric";

    Response response = await get(Uri.parse(apiUrl));
    var result = jsonDecode(response.body);
    setState(() {
      temp = result['main']['temp'];
    });
    return result;
  }

  @override
  void initState() {
    super.initState();
    getWeather("Bangalore");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        actions: [IconButton(onPressed: () {
          _goToNextScreen(context);
        }, icon: const Icon(Icons.menu))],
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
            margin: const EdgeInsets.fromLTRB(60.0, 460.0, 0.0, 0.0),
            // child: updateTempWidget("Bengaluru"),
            child: Text(
              '${temp.toString()} °C',
              style: weatherStyle(),
            ),
          ),
        ],
      ),
    );
  }
  

//   Widget updateTempWidget(String city) {
//     return FutureBuilder(
//       future: getWeather(city),
//       builder: ((BuildContext context, AsyncSnapshot<Map> snapshot) {
//         if (snapshot.hasData) {
//           Map? content = snapshot.data;
//           return Column(
//             children: [
//               ListTile(
//                 title: Text(content!['main']['temp'].toString()),
//               )
//             ],
//           );
//         } else {
//           return Container();
//         }
//       }),
//     );
//   }
// }
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



class ChangeCity extends StatelessWidget {
  const ChangeCity({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change City'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Center(
          child: Image.asset('assets/white_snow.png'
          , height: 1200.0,
          width: 580.0,
          fit: BoxFit.fill,),
        ),
        ] 
      ),
    );
  }
}
