import 'dart:convert';
import 'package:http/http.dart' as http;


Future<Weather> getWeather(double lat, double lon, int length) async{
  Map<String, dynamic> params = {
    'lat': 24.37.toString(), 
    'lon': 88.59.toString(),
    'appid': 'da9bd6142b364f2df393f0487cd9193d',
    'units': 'metric',
    'cnt': length.toString(),
  };
  
  Uri url = Uri.https('api.openweathermap.org', '/data/2.5/forecast', params);
  
  var resp = await http.get(url);
  var jsonData = jsonDecode(resp.body); 
  Weather w = Weather(jsonData);

  return w;
}

class WeatherByTime {
  
  late String dateTime;
  late var temp;
  late var feelsLike;
  late var tempMin;
  late var tempMax;
  late var pressure;
  late var humidity;

  late String weatherType; // main
  late String weatherDescription;

  late var cloudPercentage; 

  late var windSpeed;


  WeatherByTime(var timeWeather) {
    this.dateTime = timeWeather['dt_txt'];
    this.temp = timeWeather['main']['temp'];
    this.feelsLike = timeWeather['main']['feels_like'];
    this.tempMin = timeWeather['main']['temp_min'];
    this.tempMax = timeWeather['main']['temp_max'];
    this.pressure = timeWeather['main']['pressure'];
    this.humidity = timeWeather['main']['humidity'];

    this.weatherType = timeWeather['weather'][0]['main'];
    this.weatherDescription = timeWeather['weather'][0]['description'];

    this.cloudPercentage = timeWeather['clouds']['all'];

    this.windSpeed = timeWeather['wind']['speed'];
  }

}



class Weather {
  late int _count;
  List<WeatherByTime> _weatherByTime = new List.empty(growable: true);

  
  Weather(var data) {
    _count = data['cnt'];

    int i = 0;
    for(var dt in data['list']) {
      WeatherByTime x = WeatherByTime(dt);
      this._weatherByTime.add(x);
    }
  }

  List<WeatherByTime> getWeatherByTime() {
    return _weatherByTime;
  }

  int getCount() {
    return _count;
  }
}