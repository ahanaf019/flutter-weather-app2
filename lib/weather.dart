import 'dart:convert';
import 'package:http/http.dart' as http;


Weather? getWeather(double lat, double lon){
  Map<String, dynamic> params = {
    'lat': 24.37.toString(), 
    'lon': 88.59.toString(),
    'appid': 'da9bd6142b364f2df393f0487cd9193d',
    'units': 'metric',
    'cnt': 2.toString(),
  };
  
  Uri url = Uri.https('api.openweathermap.org', '/data/2.5/forecast', params);
  
  var resp = http.get(url).then((resp) {
    var jsonData = jsonDecode(resp.body); 
    Weather w = Weather(jsonData);


    return w;
  }).catchError((e) {
    print('ERROR');
    print(e);
  });

  return null;
}

class WeatherByTime {
  
  late String _dateTime;
  late var _temp;
  late var _feelsLike;
  late var _tempMin;
  late var _tempMax;
  late var _pressure;
  late var _humidity;

  late String _weatherType; // main
  late String _weatherDescription;

  late var _cloudPercentage; 

  late var _windSpeed;


  WeatherByTime(var timeWeather) {
    this._dateTime = timeWeather['dt_txt'];
    this._temp = timeWeather['main']['temp'];
    this._feelsLike = timeWeather['main']['feels_like'];
    this._tempMin = timeWeather['main']['temp_min'];
    this._tempMax = timeWeather['main']['temp_max'];
    this._pressure = timeWeather['main']['pressure'];
    this._humidity = timeWeather['main']['humidity'];

    this._weatherType = timeWeather['weather'][0]['main'];
    this._weatherDescription = timeWeather['weather'][0]['description'];

    this._cloudPercentage = timeWeather['clouds']['all'];

    this._windSpeed = timeWeather['wind']['speed'];
  }

}



class Weather {
  late int _count;
  List<WeatherByTime> _weatherByTime = new List.empty(growable: true);

  
  Weather(var data) {
    _count = data['cnt'];

    print(data);
    int i = 0;
    for(var dt in data['list']) {
      WeatherByTime x = WeatherByTime(dt);
      this._weatherByTime.add(x);
    }
  }

  int getCount() {
    return _count;
  }
}