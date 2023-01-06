import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'loading_screen.dart';
// https://api.openweathermap.org/data/2.5/weather?q=kolkata&appid=6db1b8ce9a06ef0014eada1b604ae42a
const url1 = 'https://images.pexels.com/photos/1118873/pexels-photo-1118873.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';

class WeatherData extends StatelessWidget {
   WeatherData({required this.data}) ;
  var data;
   int? temperature;
   String? weatherIcon;
   String? cityName;
   String? weatherMessage;
   String getWeatherIcon(int condition) {
     if (condition < 300) {
       return '🌩';
     } else if (condition < 400) {
       return '🌧';
     } else if (condition < 600) {
       return '☔️';
     } else if (condition < 700) {
       return '☃️';
     } else if (condition < 800) {
       return '🌫';
     } else if (condition == 800) {
       return '☀️';
     } else if (condition <= 804) {
       return '☁️';
     } else {
       return '🤷‍';
     }
   }

   String getMessage(int temp) {
     if (temp > 25) {
       return 'It\'s 🍦 time';
     } else if (temp > 20) {
       return 'Time for shorts and 👕';
     } else if (temp < 10) {
       return 'You\'ll need 🧣 and 🧤';
     } else {
       return 'Bring a 🧥 just in case';
     }
   }


   @override
  Widget build(BuildContext context) {
    print('sssssssssssss');
    print(data);
    if(data==null){
      temperature = 0;
     // weatherIcon = 'Error';
      weatherMessage = 'Unable to get weather data';
      cityName = '';
    }
    else{
     double  temp = data['main']['temp'];
     temperature  = temp.toInt();
     print(temperature);
     // int  condition = data['weather'][0]['icon'];
     // print(condition);
     //  weatherIcon = getWeatherIcon(condition);
      weatherMessage = getMessage(temperature!);
      cityName = data['name'];
    }

    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(url1),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 45.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '${temperature.toString()}°',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                      ),
                    ),

                    // Text(
                    //   'icon',
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.w500,
                    //     fontSize: 22,
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.only(right: 45.0),
                child: Text(
                  '$weatherMessage in $cityName',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 28,
                  ),
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}
