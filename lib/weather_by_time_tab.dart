import 'package:flutter/material.dart';
import 'data.dart';
import 'weather_tile.dart';

class WeatherByTimeTab extends StatelessWidget {

  late Data data;

  WeatherByTimeTab(Data data, {super.key})
  {
    this.data = data;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [

        for(int i = 0; i < data.length; i++)
          StreamBuilder(
            stream: data.weather,
            builder: ((context, snapshot) {
              var weather = snapshot.data;

              if(weather != null) {
                var weatherList = weather.getWeatherByTime();

                return WeatherTile(weatherList[i]);
              }
              return const Center(
                child: Text('')
              );
          })
        )

      ],
    );
  }
}