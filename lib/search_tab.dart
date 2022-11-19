import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:geocoding/geocoding.dart';
import 'weather.dart';



class SeatchTab extends StatefulWidget {
  const SeatchTab({super.key});

  @override
  State<SeatchTab> createState() => _SeatchTabState();
}

class _SeatchTabState extends State<SeatchTab> {
  String _text = '';
  late var _cities;
  late var _selectedCity;
  late String _temp = '';
  late String _tempMin = '';
  late String _tempMax = '';
  late String _feelsLike = '';


  @override
  void initState() {
    readJson();
    super.initState();
    _text = '';
  }


  void onPressed() {
    var addr = _typeAheadController.text;
    locationFromAddress(addr).then((value) {
      var lat = value[0].latitude;
      var lon = value[0].longitude;


      getWeather(lat, lon, 1).then((value2) {
        var x = value2.getWeatherByTime();

      setState(() {
        _text = 'Lat:${value[0].latitude.toStringAsFixed(2)}, Lon:${value[0].longitude.toStringAsFixed(2)}';
        _temp = x[0].temp.toStringAsFixed(2);
        _tempMin = x[0].tempMin.toStringAsFixed(2);
        _tempMax = x[0].tempMax.toStringAsFixed(2);
        _feelsLike = x[0].feelsLike.toStringAsFixed(2);
        
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


        Text(_text, style: TextStyle(fontSize: 20),),

        Text(_temp, style: TextStyle(fontSize: 20),),
        Text(_feelsLike, style: TextStyle(fontSize: 20),),
        Text(_tempMin, style: TextStyle(fontSize: 20),),
        Text(_tempMax, style: TextStyle(fontSize: 20),),
      ],
    ),
  );}
}


