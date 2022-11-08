import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({super.key});

  @override
  State<LocationWidget> createState() => _LocationState();
}

class _LocationState extends State<LocationWidget> {

  Position? _currentPosition;
  String? _address;

  void _getLocation()
  {

    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true)
      .then((Position position){

        placemarkFromCoordinates(position.latitude, position.longitude).then((List<Placemark> placemarkes){

          Placemark place = placemarkes[0];

          setState(() {
            _currentPosition = position;
            _address = '${place.locality}, ${place.country}';

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
        
        if(_currentPosition != null) Text('Lat: ${_currentPosition!.latitude} Lon: ${_currentPosition!.longitude}')

        else Text('Press the Button to get location.'),

        if(_address != null) Text(_address!)

        else Text('Press the Button to get address.'),



        IconButton(
          icon: Icon(Icons.ac_unit_sharp),
          onPressed: () => _getLocation(),
        ),
      ],
    );
  }
}