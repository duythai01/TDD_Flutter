enum WeatherIcon {
  sunny,
  rainy,
  cold,
  night,
  pressure,
  windy,
  humidity,
}

extension WeatherIconExtension on WeatherIcon {
  String getLocation() {
    switch (this) {
      case WeatherIcon.sunny:
        return "assets/weather_icon/sunny.svg";
      case WeatherIcon.cold:
        return "assets/weather_icon/cold.svg";
      case WeatherIcon.night:
        return "assets/weather_icon/night.svg";
      case WeatherIcon.rainy:
        return "assets/weather_icon/rainy.svg";
      case WeatherIcon.windy:
        return "assets/weather_icon/windy.svg";
      case WeatherIcon.pressure:
        return "assets/weather_icon/pressure.svg";
      case WeatherIcon.humidity:
        return "assets/weather_icon/humidity.svg";
    }
  }
}
