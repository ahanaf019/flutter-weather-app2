// import 'package:rx/core.dart';
import 'package:rxdart/rxdart.dart';
import 'package:geolocator/geolocator.dart';
import 'weather.dart';

class Data {

  BehaviorSubject<String> address = BehaviorSubject<String>.seeded('');

  BehaviorSubject<Position> position = BehaviorSubject<Position>();

  BehaviorSubject<Weather>? weather = BehaviorSubject<Weather>();

}