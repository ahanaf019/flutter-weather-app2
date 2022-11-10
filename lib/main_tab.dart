import 'package:flutter/material.dart';
import 'data.dart';
import 'weather_icons.dart';

class MainTab extends StatelessWidget {
  
  late Data data;

  MainTab(Data data, {super.key}) {
    this.data = data;
  }

  @override
  Widget build(BuildContext context) {

    if(data == null) {
      return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background-0.png'),
          fit: BoxFit.cover
        )
      ),
    );
    } else {
      return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background-0.png'),
          fit: BoxFit.cover
        )
      ),

      child: Column(
        children: [

          Center(
            // widthFactor: 10,
            heightFactor: 1.2,
            child: StreamBuilder(
              stream: data.weather,
              builder: ((context, snapshot) {

                var data = snapshot.data?.getWeatherByTime()[0].icon;

                if(data != null) {
                  return Container(child: WeatherIcons.iconByIdLarge[data]);
                }
                return Container(child: WeatherIcons.iconByIdLarge['loading']);
            })),
          ),



          Center(
            // widthFactor: 10,
            // heightFactor: 6,
            child: StreamBuilder(
              stream: data.weather,
              builder: ((context, snapshot) {

                var data = snapshot.data?.getWeatherByTime()[0].temp;

                if(data != null) {
                  return Text('${(data).round()}°C', style: TextStyle(color: Colors.orange, fontSize: 70, fontWeight: FontWeight.bold),);
                }

                return Text('Loading...', style: TextStyle(color: Colors.orange, fontSize: 70, fontWeight: FontWeight.bold),);
            })),
          ),


          Center(
            child: StreamBuilder(
              stream: data.position,
              builder: (context, snapshot) {
                var data = snapshot.data;

                if(data != null) {
                  return Row(
                    children: [
                      Spacer(),
                      Icon(Icons.location_on),
                      Text('${data.latitude.toStringAsFixed(2)}°N, ${data.longitude.toStringAsFixed(2)}°E', style: TextStyle(fontSize: 15),),
                      Spacer(),
                    ],
                  );
                }

                else {
                  return Text('', style: TextStyle(fontSize: 15),);
                }
              },
            ),
          ),


          SizedBox(height: 10,),
          
          StreamBuilder(
            stream: data.weather,
            builder: (context, snapshot) {
              var data = snapshot.data?.getWeatherByTime()[0].feelsLike;

              if(data != null) {
                return Text('Feels Like: ${(data).round()}°C', style: TextStyle(fontSize: 22, color: Colors.amber[200]),);
              }

              else {
                return Text('', style: TextStyle(fontSize: 22, color: Colors.amber[200]),);
              }
              
            },
          ),
          SizedBox(height: 10,), 


          StreamBuilder(
            stream: data.weather,
            builder: (context, snapshot) {
              var data = snapshot.data?.getWeatherByTime()[0];

              if(data != null) {
                return Row(
                  children: [
                    Spacer(),
                    Text('Min: ${(data.tempMin).round()}°C', textAlign: TextAlign.left, style: TextStyle(fontSize: 18, color: Colors.amberAccent[400])),
                    Spacer(),
                    Text('Max: ${(data.tempMax).round()}°C', textAlign: TextAlign.right, style: TextStyle(fontSize: 18, color: Colors.amberAccent[400]),),
                    Spacer(),
                  ],
                );
              }

              else {
                return Row(
                  children: [
                    Spacer(),
                    Text('', textAlign: TextAlign.left, style: TextStyle(fontSize: 18, color: Colors.amberAccent[400])),
                    Spacer(),
                    Text('', textAlign: TextAlign.right, style: TextStyle(fontSize: 18, color: Colors.amberAccent[400]),),
                    Spacer(),
                  ],
                );
              }
              
            },
          ),
        ],
      ),
    );
    }
  }
}