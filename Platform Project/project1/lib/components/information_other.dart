import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/enum.dart';

Widget otherInformation(WeatherIcon icon, String name, String value) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
          height: 32, width: 32, child: SvgPicture.asset(icon.getLocation())),
          const SizedBox(height: 10,),
      Text(
        value,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
      ),
      Text(
        name,
        style: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey),
      )
    ],
  );
}
