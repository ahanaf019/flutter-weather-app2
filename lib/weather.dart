import 'dart:convert';
import 'package:http/http.dart' as http;


Future<Weather> getWeather(double lat, double lon, int length) async{
  Map<String, dynamic> params = {
    'lat': lat.toString(), 
    'lon': lon.toString(),
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
  late String icon;

  late var cloudPercentage; 

  late var windSpeed;

  late var sunrise;
  late var sunset;
  late var timezone;


  WeatherByTime(var timeWeather, var data) {
    this.dateTime = timeWeather['dt_txt'];
    this.temp = timeWeather['main']['temp'];
    this.feelsLike = timeWeather['main']['feels_like'];
    this.tempMin = timeWeather['main']['temp_min'];
    this.tempMax = timeWeather['main']['temp_max'];
    this.pressure = timeWeather['main']['pressure'];
    this.humidity = timeWeather['main']['humidity'];

    this.weatherType = timeWeather['weather'][0]['main'];
    this.weatherDescription = timeWeather['weather'][0]['description'];
    this.icon = timeWeather['weather'][0]['icon'];

    this.cloudPercentage = timeWeather['clouds']['all'];

    this.windSpeed = timeWeather['wind']['speed'];


    this.timezone = data['city']['timezone'];

    this.sunrise = data['city']['sunrise'];
    var date = DateTime.fromMillisecondsSinceEpoch((sunrise + timezone - 21600)* 1000).toString();
    var x = date.split(' ')[1].split('.')[0].replaceFirst('0', '').split(':')[0];
    var y = date.split(' ')[1].split('.')[0].split(':')[1];
    sunrise = '$x:$y am';

    this.sunset = data['city']['sunset'];
    date = DateTime.fromMillisecondsSinceEpoch((sunset + timezone - 21600) * 1000).toString();
    var x1 = int.parse(date.split(' ')[1].split('.')[0].split(':')[0]) - 12;;
    y = date.split(' ')[1].split('.')[0].split(':')[1];
    sunset = '$x1:$y pm';
  }

}



class Weather {
  late int _count;
  List<WeatherByTime> _weatherByTime = new List.empty(growable: true);

  
  Weather(var data) {
    _count = data['cnt'];

    int i = 0;
    for(var dt in data['list']) {
      WeatherByTime x = WeatherByTime(dt, data);
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