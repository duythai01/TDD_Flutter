class Location {
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  int? localtimeEpoch;
  String? localtime;

  Location({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'],
      region: json['region'],
      country: json['country'],
      lat: json['lat']?.toDouble(),
      lon: json['lon']?.toDouble(),
      tzId: json['tz_id'],
      localtimeEpoch: json['localtime_epoch'],
      localtime: json['localtime'],
    );
  }
}

class Condition {
  String? text;
  String? icon;
  int? code;

  Condition({
    this.text,
    this.icon,
    this.code,
  });

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      text: json['text'],
      icon: json['icon'],
      code: json['code'],
    );
  }
}

class Current {
  int? lastUpdatedEpoch;
  String? lastUpdated;
  double? tempC;
  double? tempF;
  int? isDay;
  Condition? condition;
  double? windMph;
  double? windKph;
  int? windDegree;
  String? windDir;
  double? pressureMb;
  double? pressureIn;
  double? precipMm;
  double? precipIn;
  int? humidity;
  int? cloud;
  double? feelslikeC;
  double? feelslikeF;
  double? visKm;
  double? visMiles;
  double? uv;
  double? gustMph;
  double? gustKph;

  Current({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.visKm,
    this.visMiles,
    this.uv,
    this.gustMph,
    this.gustKph,
  });

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      lastUpdatedEpoch: json['last_updated_epoch'],
      lastUpdated: json['last_updated'],
      tempC: json['temp_c']?.toDouble(),
      tempF: json['temp_f']?.toDouble(),
      isDay: json['is_day'],
      condition: Condition.fromJson(json['condition']),
      windMph: json['wind_mph']?.toDouble(),
      windKph: json['wind_kph']?.toDouble(),
      windDegree: json['wind_degree'],
      windDir: json['wind_dir'],
      pressureMb: json['pressure_mb']?.toDouble(),
      pressureIn: json['pressure_in']?.toDouble(),
      precipMm: json['precip_mm']?.toDouble(),
      precipIn: json['precip_in']?.toDouble(),
      humidity: json['humidity'],
      cloud: json['cloud'],
      feelslikeC: json['feelslike_c']?.toDouble(),
      feelslikeF: json['feelslike_f']?.toDouble(),
      visKm: json['vis_km']?.toDouble(),
      visMiles: json['vis_miles']?.toDouble(),
      uv: json['uv']?.toDouble(),
      gustMph: json['gust_mph']?.toDouble(),
      gustKph: json['gust_kph']?.toDouble(),
    );
  }
}

class WeatherCurrent {
  Location? location;
  Current? current;
  // Forecast? forecast;

  WeatherCurrent({this.location, this.current
  // this.forecast
  });

  factory WeatherCurrent.fromJson(Map<String, dynamic> json) {
    return WeatherCurrent(
        location: Location.fromJson(json['location']),
        current: Current.fromJson(json['current']),
        // forecast: Forecast.fromJson(json['forecast'])
        );
  }
}

class Forecast {
  List<Forecastday>? forecastday;

  Forecast({
    this.forecastday,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      forecastday: List<Forecastday>.from(json["forecastday"]),
    );
  }
}

class Forecastday {
  DateTime? date;
  int? dateEpoch;
  Day? day;
  Astro? astro;
  List<Hour>? hour;

  Forecastday({
    this.date,
    this.dateEpoch,
    this.day,
    this.astro,
    this.hour,
  });

  factory Forecastday.fromJson(Map<String, dynamic> json) {
    return Forecastday(
      date: json["date"] == null ? null : DateTime.parse(json["date"]),
      dateEpoch: json["date_epoch"],
      day: json["day"] == null ? null : Day.fromJson(json["day"]),
      astro: json["astro"] == null ? null : Astro.fromJson(json["astro"]),
      hour: List<Hour>.from(json["hour"]),
    );
  }
}

class Astro {
  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonset;
  String? moonPhase;
  String? moonIllumination;
  int? isMoonUp;
  int? isSunUp;

  Astro({
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.moonIllumination,
    this.isMoonUp,
    this.isSunUp,
  });

  factory Astro.fromJson(Map<String, dynamic> json) {
    return Astro(
      sunrise: json["sunrise"],
      sunset: json["sunset"],
      moonrise: json["moonrise"],
      moonset: json["moonset"],
      moonPhase: json["moon_phase"],
      moonIllumination: json["moon_illumination"],
      isMoonUp: json["is_moon_up"],
      isSunUp: json["is_sun_up"],
    );
  }
}

class Day {
  double? maxtempC;
  double? maxtempF;
  double? mintempC;
  double? mintempF;
  double? avgtempC;
  double? avgtempF;
  double? maxwindMph;
  double? maxwindKph;
  double? totalprecipMm;
  double? totalprecipIn;
  int? totalsnowCm;
  double? avgvisKm;
  int? avgvisMiles;
  int? avghumidity;
  int? dailyWillItRain;
  int? dailyChanceOfRain;
  int? dailyWillItSnow;
  int? dailyChanceOfSnow;
  Condition? condition;
  int? uv;

  Day({
    this.maxtempC,
    this.maxtempF,
    this.mintempC,
    this.mintempF,
    this.avgtempC,
    this.avgtempF,
    this.maxwindMph,
    this.maxwindKph,
    this.totalprecipMm,
    this.totalprecipIn,
    this.totalsnowCm,
    this.avgvisKm,
    this.avgvisMiles,
    this.avghumidity,
    this.dailyWillItRain,
    this.dailyChanceOfRain,
    this.dailyWillItSnow,
    this.dailyChanceOfSnow,
    this.condition,
    this.uv,
  });

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      maxtempC: json["maxtemp_c"]?.toDouble(),
      maxtempF: json["maxtemp_f"]?.toDouble(),
      mintempC: json["mintemp_c"]?.toDouble(),
      mintempF: json["mintemp_f"]?.toDouble(),
      avgtempC: json["avgtemp_c"]?.toDouble(),
      avgtempF: json["avgtemp_f"]?.toDouble(),
      maxwindMph: json["maxwind_mph"]?.toDouble(),
      maxwindKph: json["maxwind_kph"]?.toDouble(),
      totalprecipMm: json["totalprecip_mm"]?.toDouble(),
      totalprecipIn: json["totalprecip_in"]?.toDouble(),
      totalsnowCm: json["totalsnow_cm"],
      avgvisKm: json["avgvis_km"]?.toDouble(),
      avgvisMiles: json["avgvis_miles"],
      avghumidity: json["avghumidity"],
      dailyWillItRain: json["daily_will_it_rain"],
      dailyChanceOfRain: json["daily_chance_of_rain"],
      dailyWillItSnow: json["daily_will_it_snow"],
      dailyChanceOfSnow: json["daily_chance_of_snow"],
      condition: Condition.fromJson(json["condition"]),
      uv: json["uv"],
    );
  }
}

class Hour {
  int? timeEpoch;
  String? time;
  double? tempC;
  double? tempF;
  int? isDay;
  Condition? condition;
  double? windMph;
  double? windKph;
  int? windDegree;
  String? windDir;
  int? pressureMb;
  double? pressureIn;
  double? precipMm;
  double? precipIn;
  int? humidity;
  int? cloud;
  double? feelslikeC;
  double? feelslikeF;
  double? windchillC;
  double? windchillF;
  double? heatindexC;
  double? heatindexF;
  double? dewpointC;
  double? dewpointF;
  int? willItRain;
  int? chanceOfRain;
  int? willItSnow;
  int? chanceOfSnow;
  int? visKm;
  int? visMiles;
  double? gustMph;
  double? gustKph;
  int? uv;

  Hour({
    this.timeEpoch,
    this.time,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.windchillC,
    this.windchillF,
    this.heatindexC,
    this.heatindexF,
    this.dewpointC,
    this.dewpointF,
    this.willItRain,
    this.chanceOfRain,
    this.willItSnow,
    this.chanceOfSnow,
    this.visKm,
    this.visMiles,
    this.gustMph,
    this.gustKph,
    this.uv,
  });

  factory Hour.fromJson(Map<String, dynamic> json) {
    return Hour(
      timeEpoch: json["time_epoch"],
      time: json["time"],
      tempC: json["temp_c"]?.toDouble(),
      tempF: json["temp_f"]?.toDouble(),
      isDay: json["is_day"],
      condition: Condition.fromJson(json["condition"]),
      windMph: json["wind_mph"]?.toDouble(),
      windKph: json["wind_kph"]?.toDouble(),
      windDegree: json["wind_degree"],
      windDir: json["wind_dir"],
      pressureMb: json["pressure_mb"],
      pressureIn: json["pressure_in"]?.toDouble(),
      precipMm: json["precip_mm"]?.toDouble(),
      precipIn: json["precip_in"]?.toDouble(),
      humidity: json["humidity"],
      cloud: json["cloud"],
      feelslikeC: json["feelslike_c"]?.toDouble(),
      feelslikeF: json["feelslike_f"]?.toDouble(),
      windchillC: json["windchill_c"]?.toDouble(),
      windchillF: json["windchill_f"]?.toDouble(),
      heatindexC: json["heatindex_c"]?.toDouble(),
      heatindexF: json["heatindex_f"]?.toDouble(),
      dewpointC: json["dewpoint_c"]?.toDouble(),
      dewpointF: json["dewpoint_f"]?.toDouble(),
      willItRain: json["will_it_rain"],
      chanceOfRain: json["chance_of_rain"],
      willItSnow: json["will_it_snow"],
      chanceOfSnow: json["chance_of_snow"],
      visKm: json["vis_km"],
      visMiles: json["vis_miles"],
      gustMph: json["gust_mph"]?.toDouble(),
      gustKph: json["gust_kph"]?.toDouble(),
      uv: json["uv"],
    );
  }
}
