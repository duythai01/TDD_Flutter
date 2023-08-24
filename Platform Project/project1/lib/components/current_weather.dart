import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project1/constants/enum.dart';

Widget currentWeather(
    IconData icon, double temp, String statusWeather, WeatherIcon weatherIcon) {
  return Center(
      child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        children: [
          SizedBox(
            height: 100,
            width: 120 ,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Text(
                "${temp.ceil()}°",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Orbitron"
                ),
              ),
            ),
          ),
          Text(
            statusWeather,
            style: const TextStyle(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ],
      ),
      SizedBox(
        height: 128,
        width: 128,
        child: FittedBox(
            child: SvgPicture.asset(weatherIcon.getLocation()),
            fit: BoxFit.fill),
      ),
    ],
  ));
}
