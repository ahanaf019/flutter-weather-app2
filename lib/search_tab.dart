import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:geocoding/geocoding.dart';
import 'weather.dart';
import 'weather_icons.dart';



class SeatchTab extends StatefulWidget {
  const SeatchTab({super.key});

  @override
  State<SeatchTab> createState() => _SeatchTabState();
}

class _SeatchTabState extends State<SeatchTab> {
  String _lon = '';
  String _lat = '';
  late var _cities;
  late var _selectedCity;
  late String _temp = '';
  late String _tempMin = '';
  late String _tempMax = '';
  late String _feelsLike = '';
  late String _icon = '';
  late String _weatherDescription = '';
  late double _windSpeed = 0;
  late String _pressure = '';
  late String _cloudPercentage = '';
  late String _sunrise = '';
  late String _sunset = '';
  late var _timezone;


  @override
  void initState() {
    readJson();
    super.initState();
  }


  void onPressed() {
    var addr = _typeAheadController.text;
    locationFromAddress(addr).then((value) {
      var lat = value[0].latitude;
      var lon = value[0].longitude;


      getWeather(lat, lon, 1).then((value2) {
        var x = value2.getWeatherByTime();

        setState(() {
          _lat = '${value[0].latitude.toStringAsFixed(2)}';
          _lon = '${value[0].longitude.toStringAsFixed(2)}';
          _temp = x[0].temp.round().toString();
          _tempMin = x[0].tempMin.round().toString();
          _tempMax = x[0].tempMax.round().toString();
          _feelsLike = x[0].feelsLike.round().toString();
          _icon = x[0].icon;
          _weatherDescription =  x[0].weatherDescription;
          _windSpeed = x[0].windSpeed;
          _pressure = x[0].pressure.toString();
          _cloudPercentage = x[0].cloudPercentage.toString();
          _sunrise = x[0].sunrise;
          _sunset = x[0].sunset;
          _timezone = x[0].timezone;
          print(_timezone);
          
        });

      },);


      

    });

  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/world-cities.json');
    final data = await jsonDecode(response);

    List<String> cities = List.empty(growable: true);

    for (var element in data) {
      cities.add('${element['name']}, ${element['country']}');
    }

    setState(() {
      _cities = cities;
    });
  }

  TextEditingController _typeAheadController = TextEditingController();


  List<String> getSuggestions(String query) {
    List<String> matches = List.empty(growable: true);
    matches.addAll(_cities);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
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

      child: Column(
      children: [

        TypeAheadFormField(
          textFieldConfiguration: TextFieldConfiguration(
            controller: _typeAheadController,
            decoration: const InputDecoration(
              labelText: 'Please Select a City to View Weather',
              suffixIcon: Icon(Icons.search)
            )
          ),
          suggestionsCallback: (pattern) {
            return getSuggestions(pattern);
          },
          itemBuilder: (context, suggestion) {
            String city = suggestion.split(', ')[0];
            String country = suggestion.split(', ')[1];


            return ListTile(
              title: Text(city),
              subtitle: Text(country),
            );
          },
          transitionBuilder: (context, suggestionsBox, controller) {
            return suggestionsBox;
          },
          onSuggestionSelected: (suggestion) {
            _typeAheadController.text = suggestion;
            onPressed();
          },

          onSaved: (value) => _selectedCity = value,
        ),
      
        SizedBox(height: 15,),


        if(_temp != '')   
          Column(
            children: [
              Container(child: WeatherIcons.iconByIdLarge[_icon]),
              
              // SizedBox(height: 15,),
              Text('${_weatherDescription.toUpperCase()}', style: TextStyle(color: Colors.white70, fontSize: 30, fontWeight: FontWeight.bold),),
              
              Text('${_temp}°C', style: TextStyle(color: Colors.orange, fontSize: 70, fontWeight: FontWeight.bold),),
              
              Row(
                children: [
                  Spacer(),
                  Icon(Icons.location_on),
                  Text('${_lat}°N, ${_lon}°E', style: TextStyle(fontSize: 15),),
                  Spacer(),
                ],
              ),

              Text('Feels Like: ${_feelsLike}°C', style: TextStyle(fontSize: 22, color: Colors.amber[200]),),

              Row(
                children: [
                  Spacer(),
                  Text('Min: ${_tempMin}°C', textAlign: TextAlign.left, style: TextStyle(fontSize: 18, color: Colors.amberAccent[400])),
                  Spacer(),
                  Text('Max: ${_tempMax}°C', textAlign: TextAlign.right, style: TextStyle(fontSize: 18, color: Colors.amberAccent[400]),),
                  Spacer(),
                ],
              ),


              Column(
                children: [
                  ListTile(
                    title: Text('${_sunrise}', style: TextStyle(fontSize: 20),),
                    subtitle: Text('Sunrise'),
                    leading: WeatherIcons.iconById['sunrise'],
                  ),

                  ListTile(
                    title: Text('${_sunset}', style: TextStyle(fontSize: 20),),
                    subtitle: Text('Sunset'),
                    leading: WeatherIcons.iconById['sunset'],
                  ),

                  ListTile(
                    title: Text('${(_windSpeed*1000/3600).toStringAsFixed(2)} kmph', style: TextStyle(fontSize: 20),),
                    subtitle: Text('Wind Speed'),
                    leading: WeatherIcons.iconById['wind'],
                  )
                ],
              ),
            ],
          )   
      ],
    ),
  );}
}


