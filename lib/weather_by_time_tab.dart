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
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background-0.png'),
          fit: BoxFit.cover
        )
      ),

      child: ListView(
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
        ),
    );
    
  }
}