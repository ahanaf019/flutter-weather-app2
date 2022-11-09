import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:rxdart/src/subjects/behavior_subject.dart';
import 'data.dart';
import 'weather.dart';


class LocationWidget extends StatelessWidget {

  late Data data;

  LocationWidget(Data data, {super.key}) {
    this.data = data;
  }

  void _getLocation() {

    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true)
      .then((Position position){

        placemarkFromCoordinates(position.latitude, position.longitude).then((List<Placemark> placemarkes){

          Placemark place = placemarkes[0];

          data.address.add('${place.locality}, ${place.country}');

          data.position.add(position);

          getWeather(position.latitude, position.longitude, data.length).then((value) {
            data.weather.add(value);
          });


        });


      }).catchError((e){
        print(e);
      });
    
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        StreamBuilder(
          stream: data.position,
          builder: ((context, snapshot) {
            var _currentPosition = snapshot.data;
            if(_currentPosition != null) 
              return Text('Lat: ${_currentPosition!.latitude} Lon: ${_currentPosition!.longitude}');

            else return Text('Press the Button to get location.');
          }),
          ),
        
        StreamBuilder(
          stream: data.address,
          builder: ((context, snapshot) {
            var _address = snapshot.data;
            if(_address != '') 
              return Text('${_address}');

            else return Text('Press the Button to get address.');
          }),
          ),

        IconButton(
          icon: Icon(Icons.ac_unit_sharp),
          onPressed: () => _getLocation(),
        ),
      ],
    );;
  }
}
