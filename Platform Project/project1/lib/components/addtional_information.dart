// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:project1/components/information_other.dart';
import 'package:project1/constants/enum.dart';

Widget addtionalInformation(
    String wind, String pressure, String humidity, String feelLike) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding:
            const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 12),
        color: Colors.grey.withAlpha(100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            otherInformation(WeatherIcon.windy, "Wind", wind),
            otherInformation(WeatherIcon.humidity, "Humidty", "${humidity}%"),
             otherInformation(WeatherIcon.humidity, "Humidty", "${pressure}%"),
            otherInformation(WeatherIcon.rainy, "Rain", "100%"),
          ],
        ),
      ),
    ),
  );
}
