/*

    "cod": "200",
    "message": 0,
    "cnt": 40,
    "list": [
     {
            "dt": 1701097200,
            "main": {
                "temp": 248.44,
                "feels_like": 243.4,
                "temp_min": 248.44,
                "temp_max": 248.44,
                "pressure": 1043,
                "sea_level": 1043,
                "grnd_level": 1000,
                "humidity": 98,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 801,
                    "main": "Clouds",
                    "description": "few clouds",
                    "icon": "02n"
                }
            ],
            "clouds": {
                "all": 13
            },
            "wind": {
                "speed": 1.44,
                "deg": 343,
                "gust": 1.3
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-11-27 15:00:00"
        },
        }
        ]
*/


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
}

class CitiesModel {
  int dt;
  Main main;
  List<Weather> weather;
  Clouds clouds;
  Wind wind;
  int visibility;
  double pop;
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
        pop: json["pop"] as double,
        snow: json["snow"] != null
            ? Snow.fromJson(json["snow"] as Map<String, Object?>)
            : null,
        sys: json["sys"] != null
            ? Sys.fromJson(json["sys"] as Map<String, Object?>)
            : null,
        dtTxt: json["dtTxt"] != null
            ? DateTime.parse(json["dtTxt"] as String)
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
        "dtTxt": dtTxt?.toUtc(),
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
  double speed;
  double deg;
  double gust;

  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  factory Wind.fromJson(Map<String, Object?> json) => Wind(
        speed: json["speed"] as double,
        deg: json["deg"] as double,
        gust: json["gust"] as double,
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
  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  double pressure;
  double seaLevel;
  double grndLevel;
  double humidity;
  double tempKf;

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
        temp: json["temp"] as double,
        feelsLike: json["feels_like"] as double,
        tempMin: json["temp_min"] as double,
        tempMax: json["temp_max"] as double,
        pressure: json["pressure"] as double,
        seaLevel: json["sea_level"] as double,
        grndLevel: json["grnd_level"] as double,
        humidity: json["humidity"] as double,
        tempKf: json["temp_kf"] as double,
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
  int? lat;

  int? lon;

  Coord({required this.lat, required this.lon});

  factory Coord.fromJson(Map<String, Object?> json) => Coord(
        lat: json["lat"] as int?,
        lon: json["lon"] as int?,
      );

  Map<String, Object?> toJson() => {
        "lat": lat,
        "lon": lon,
      };
}

/*
              {
            "dt": 1701432000,
            "main": {
                "temp": 265.32,
                "feels_like": 261.45,
                "temp_min": 265.32,
                "temp_max": 265.32,
                "pressure": 1015,
                "sea_level": 1015,
                "grnd_level": 976,
                "humidity": 96,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 600,
                    "main": "Snow",
                    "description": "light snow",
                    "icon": "13n"
                }
            ],
            "clouds": {
                "all": 100
            },
            "wind": {
                "speed": 2.08,
                "deg": 187,
                "gust": 6.31
            },
            "visibility": 140,
            "pop": 0.56,
            "snow": {
                "3h": 0.69
            },
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2023-12-01 12:00:00"
        },

 */
