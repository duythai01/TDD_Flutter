import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project1/components/information_weather_card.dart';
import 'package:project1/components/selection_text_button.dart';
import 'package:project1/constants/enum.dart';
import 'package:project1/service/weather_api.dart';
import 'package:project1/components/addtional_information.dart';

import 'components/current_weather.dart';
import 'data/models/weather_models.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: getMaterialColor(Colors.transparent),
        ),
        home: const HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  API api = new API();
  WeatherCurrent? data;
  Condition? condition;
  Forecast? forecast;
  Forecastday? forecastday;
  List<Hour>? listHour;
  Day? day;

  ButtonSeclection buttonSeclection = ButtonSeclection.today;

  void _updateWhenSelectionButton(ButtonSeclection seclection) {
    setState(() {
      switch (seclection) {
        case ButtonSeclection.today:
          buttonSeclection = ButtonSeclection.today;
          break;
        case ButtonSeclection.tommorrow:
          buttonSeclection = ButtonSeclection.tommorrow;
          break;
        case ButtonSeclection.next10Days:
          buttonSeclection = ButtonSeclection.next10Days;
          break;
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  Future<void> getData() async {
    data = await api.fetchDataCurrent("Ha noi");
    // forecastday = data?.forecast?.forecastday as Forecastday?;
    // listHour = forecastday?.hour as List<Hour>;
    // day = forecastday?.day;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background_weather/green2.jpg"),
                  fit: BoxFit.cover)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
            child: Container(
              color: Colors.black,
            ),
          ),
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: null,
            body: Stack(
              children: [
                SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FutureBuilder(
                        future: getData(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Sttutgard",
                                            style: TextStyle(
                                                fontSize: 26,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "Orbitron"),
                                          ),
                                          Text(
                                            "12 September, Sunday",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white54,
                                                fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.start,
                                          ),
                                        ],
                                      ),
                                      Ink(
                                        decoration: const BoxDecoration(
                                          color:
                                              Color.fromARGB(65, 158, 158, 158),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12)),
                                        ),
                                        child: IconButton(
                                          splashColor: Colors.transparent,
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.window_rounded,
                                            size: 28,
                                          ),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  currentWeather(
                                      Icons.sunny,
                                      data?.current?.tempC ?? 0,
                                      "${data?.location?.name} - ${data?.location?.country}",
                                      WeatherIcon.sunny),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  addtionalInformation(
                                      "${data?.current?.gustMph}",
                                      "${listHour?.length}",
                                      "${data?.current?.humidity}",
                                      "${data?.current?.feelslikeC}"),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      selectionsTextButon("Today", true, () {
                                        
                                        // _updateWhenSelectionButton(
                                        //     ButtonSeclection.today);
                                      }),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      selectionsTextButon(
                                          "Tomorrow", false, () {}),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      selectionsTextButon(
                                          "Next 10 days", false, () {}),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 180,
                                    child: ListView.builder(
                                        itemCount: 10,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return informationCard(
                                              "12 pm", WeatherIcon.sunny, "12");
                                        }),
                                  ),
                                ],
                              ),
                            );
                          }
                          return Container();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ],
    );
  }
}

MaterialColor getMaterialColor(Color color) {
  final int red = color.red;
  final int green = color.green;
  final int blue = color.blue;

  final Map<int, Color> shades = {
    50: Color.fromRGBO(red, green, blue, .1),
    100: Color.fromRGBO(red, green, blue, .2),
    200: Color.fromRGBO(red, green, blue, .3),
    300: Color.fromRGBO(red, green, blue, .4),
    400: Color.fromRGBO(red, green, blue, .5),
    500: Color.fromRGBO(red, green, blue, .6),
    600: Color.fromRGBO(red, green, blue, .7),
    700: Color.fromRGBO(red, green, blue, .8),
    800: Color.fromRGBO(red, green, blue, .9),
    900: Color.fromRGBO(red, green, blue, 1),
  };

  return MaterialColor(color.value, shades);
}

enum ButtonSeclection {
  today,
  tommorrow,
  next10Days,
}
