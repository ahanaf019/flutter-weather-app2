import 'package:flutter/material.dart';
import 'data.dart';
import 'weather.dart';

class WeatherTile extends StatelessWidget {

  late WeatherByTime data;

  WeatherTile(WeatherByTime data, {super.key})
  {
    this.data = data;
  }

  @override
  Widget build(BuildContext context) {

    if(data ==  null)
      print("NULLLLLLLLLLLLLL");

    if(data != null) {
      return ListTile(
        leading: Icon(Icons.sunny),
        title: Text('${data.dateTime}'),
        trailing: Text('${data.temp}°C'),
        subtitle: Text('Feels Like: ${data.feelsLike}°C'),
        // isThreeLine: true,
      );
    } else {
      return const ListTile(
        leading: Icon(Icons.sunny),
        title: Text('Loading'),
        trailing: Text('Loading'),
        subtitle: Text('Loading'),
        // isThreeLine: true,
      );
    }
  }
}