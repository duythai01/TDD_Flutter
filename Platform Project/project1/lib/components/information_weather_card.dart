// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project1/constants/enum.dart';

Widget informationCard(String time, WeatherIcon weather, String temperature) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        color: Colors.grey.withAlpha(80),
        width: 120,
        child: Column (
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              time,
              style: TextStyle(
                color: Colors.white.withAlpha(150),
                fontSize: 18,
              ),
            ),
            SizedBox(
              width: 60,
              height: 60,
              child: FittedBox(
                fit: BoxFit.fill,
                child: SvgPicture.asset(weather.getLocation()))),
             Text(
              "${temperature}°",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
