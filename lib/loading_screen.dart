import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weatherpractice/Network_help.dart';
import 'package:weatherpractice/weather_data.dart';

const myApi = '6db1b8ce9a06ef0014eada1b604ae42a';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({this.cityName});
  final cityName;

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


 @override
  void initState() {
    // TODO: implement initState
    super.initState();
     getWeather();
     print('*********');
 }

  void getWeather() async {
    String city = widget.cityName.text;
    String url = 'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$myApi&units=metric';
    print(url);
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    print('&&&&');
    print(weatherData);
    print('&&&&');
    Navigator.push(context, MaterialPageRoute(builder: (context)=> WeatherData(data: weatherData,)));
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitThreeInOut(
              color: Colors.indigo,
              size: 50,
            ),
            Text('Loading', style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 22,
            ),),
            SizedBox(height: 10,),
            Text('Please wait...', style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 18,
            ),),
          ],
        ),
      ),
    );
  }
}

