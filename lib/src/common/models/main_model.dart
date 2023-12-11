class BaseModel {
  String cod;
  int message;
  int cnt;
  List<CitiesModel> list;
  City city;

  BaseModel({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  @override
  String toString() {
    return 'BaseModel{cod: $cod, message: $message, cnt: $cnt, list: $list, city: $city}';
  }

  factory BaseModel.fromJson(Map<String, Object?> json) => BaseModel(
        cod: json["cod"] as String,
        message: json["message"] as int,
        cnt: json["cnt"] as int,
        list:
            (json["list"] as List).map((e) => CitiesModel.fromJson(e)).toList(),
        city: City.fromJson(
          json["city"] as Map<String, Object?>,
        ),
      );

  Map<String, Object?> toJson() => {
        "cod": cod,
        "message": message,
        "cnt": cnt,
        "list": list.map((e) => e.toJson()),
        "city": city.toJson(),
      };

  List<WeatherMini> getDay() {
    var currentTime = DateTime.now();
    List<WeatherMini> result = [];
    for (int i = 0; i < 5; i++) {
      List<CitiesModel> miniList = list
          .where((element) => element.dtTxt!.day == currentTime.day)
          .toList();
      num sumTemp = miniList.fold<num>(
          0, (previousValue, element) => previousValue + element.main.temp);
      WeatherMini weatherMini = WeatherMini(
        mini: miniList[miniList.length ~/ 2].weather.first.main,
        temp: sumTemp / miniList.length,
        dateTime: currentTime,
      );
      result.add(weatherMini);
      currentTime = currentTime.add(const Duration(days: 1));
    }
    return result;
  }
}

class WeatherMini {
  final String mini;
  final num temp;
  final DateTime dateTime;

  WeatherMini({
    required this.mini,
    required this.temp,
    required this.dateTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'mini': mini,
      'temp': temp,
      'dateTime': dateTime,
    };
  }

  factory WeatherMini.fromMap(Map<String, dynamic> map) {
    return WeatherMini(
      mini: map['mini'] as String,
      temp: map['temp'] as num,
      dateTime: map['dateTime'] as DateTime,
    );
  }
}

class CitiesModel {
  int dt;
  Main main;
  List<Weather> weather;
  Clouds clouds;
  Wind wind;
  int visibility;
  num pop;
  Snow? snow;
  Sys? sys;
  DateTime? dtTxt;

  CitiesModel({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.snow,
    required this.sys,
    required this.dtTxt,
  });

  factory CitiesModel.fromJson(Map<String, Object?> json) => CitiesModel(
        dt: json["dt"] as int,
        main: Main.fromJson(json["main"] as Map<Object, Object?>),
        weather:
            (json["weather"] as List).map((e) => Weather.fromJson(e)).toList(),
        clouds: Clouds.fromJson(json["clouds"] as Map<String, Object?>),
        wind: Wind.fromJson(json["wind"] as Map<String, Object?>),
        visibility: json["visibility"] as int,
        pop: json["pop"] as num,
        snow: json["snow"] != null
            ? Snow.fromJson(json["snow"] as Map<String, Object?>)
            : null,
        sys: json["sys"] != null
            ? Sys.fromJson(json["sys"] as Map<String, Object?>)
            : null,
        dtTxt: json["dt_txt"] != null
            ? DateTime.parse(json["dt_txt"] as String)
            : null,
      );

  Map<String, Object?> toJson() => {
        "dt": dt,
        "main": main.toJson(),
        "weather": weather.map((e) => e.toJson()),
        "clouds": clouds.toJson(),
        "wind": wind.toJson(),
        "visibility": visibility,
        "pop": pop,
        "snow": snow?.toJson() ?? {},
        "sys": sys?.toJson(),
        "dt_txt": dtTxt?.toUtc(),
      };
}

class Sys {
  String pod;

  Sys({required this.pod});

  factory Sys.fromJson(Map<String, Object?> json) =>
      Sys(pod: json["pod"] as String);

  Map<String, Object?> toJson() => {
        "pod": pod,
      };
}

class Snow {
  double? message;

  Snow({required this.message});

  factory Snow.fromJson(Map<String, Object?> json) =>
      Snow(message: json["message"] as double?);

  Map<String, Object?> toJson() => {
        "message": message,
      };
}

class Wind {
  num speed;
  num deg;
  num gust;

  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  factory Wind.fromJson(Map<String, Object?> json) => Wind(
        speed: json["speed"] as num,
        deg: json["deg"] as num,
        gust: json["gust"] as num,
      );

  Map<String, Object?> toJson() => {
        "speed": speed,
        "deg": deg,
        "gust": gust,
      };
}

class Clouds {
  int all;

  Clouds({required this.all});

  factory Clouds.fromJson(Map<String, Object?> json) => Clouds(
        all: json["all"] as int,
      );

  Map<String, Object?> toJson() => {
        "all": all,
      };
}

class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, Object?> json) => Weather(
        id: json["id"] as int,
        main: json["main"] as String,
        description: json["description"] as String,
        icon: json["icon"] as String,
      );

  Map<String, Object?> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };
}

class Main {
  num temp;
  num feelsLike;
  num tempMin;
  num tempMax;
  num pressure;
  num seaLevel;
  num grndLevel;
  num humidity;
  num tempKf;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
  });

  factory Main.fromJson(Map<Object, Object?> json) => Main(
        temp: json["temp"] as num,
        feelsLike: json["feels_like"] as num,
        tempMin: json["temp_min"] as num,
        tempMax: json["temp_max"] as num,
        pressure: json["pressure"] as num,
        seaLevel: json["sea_level"] as num,
        grndLevel: json["grnd_level"] as num,
        humidity: json["humidity"] as num,
        tempKf: json["temp_kf"] as num,
      );

  Map<String, Object?> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "sea_level": seaLevel,
        "grnd_level": grndLevel,
        "humidity": humidity,
        "temp_kf": tempKf,
      };
}

class City {
  int id;
  String name;
  Coord coord;
  String country;
  int population;
  int timezone;
  int sunrise;
  int sunset;

  City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  factory City.fromJson(Map<String, Object?> json) => City(
        id: json["id"] as int,
        name: json["name"] as String,
        coord: Coord.fromJson(json["coord"] as Map<String, Object?>),
        country: json["country"] as String,
        population: json["population"] as int,
        timezone: json["timezone"] as int,
        sunrise: json["sunrise"] as int,
        sunset: json["sunset"] as int,
      );

  Map<String, Object?> toJson() => {
        "id": id,
        "name": name,
        "coord": coord.toJson(),
        "country": country,
        "population": population,
        "timezone": timezone,
        "sunrise": sunrise,
        "sunset": sunset,
      };
}

class Coord {
  num? lat;
  num? lon;

  Coord({required this.lat, required this.lon});

  factory Coord.fromJson(Map<String, Object?> json) => Coord(
        lat: json["lat"] as num?,
        lon: json["lon"] as num?,
      );

  Map<String, Object?> toJson() => {
        "lat": lat,
        "lon": lon,
      };
}
