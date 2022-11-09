// import 'package:rx/core.dart';
import 'package:rxdart/rxdart.dart';
import 'package:geolocator/geolocator.dart';
import 'weather.dart';
import 'package:geocoding/geocoding.dart';


class Data {

  BehaviorSubject<String> address = BehaviorSubject<String>.seeded('');

  BehaviorSubject<Position> position = BehaviorSubject<Position>();

  late BehaviorSubject<Weather> weather = BehaviorSubject<Weather>();
  int length = 15;


  Data() {

    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true)
      .then((Position pos){

        placemarkFromCoordinates(pos.latitude, pos.longitude).then((List<Placemark> placemarkes){

          Placemark place = placemarkes[0];

          address.add('${place.locality}, ${place.country}');

          position.add(pos);
        });
      });


    // getWeather(11, 22, 15).then((value) {
    //   weather.add(value);
    // });

  }
}