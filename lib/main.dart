import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'location_widget.dart';
import 'data.dart';
import 'weather_tile.dart';
import 'weather_by_time_tab.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'weather.dart';

void main(List<String> args) {

  runApp(Main());

}

BehaviorSubject<int> counter = BehaviorSubject<int>.seeded(0);

class Main extends StatelessWidget {

  Main({super.key});

  Data data = new Data();


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
    return MaterialApp(
      title: 'Weather App',
      home: DefaultTabController(
        length: 3, 
        child: Scaffold(
        appBar: AppBar(
          title: StreamBuilder(
            stream: data.address,
            builder: (context, snapshot) {
              if(snapshot.data == '') 
                return Text('Weather');
              return Text('${snapshot.data}');
            }),

          actions: [
            StreamBuilder(
              stream: data.address,
              builder: ((context, snapshot) {
                var _address = snapshot.data;
                var icon;
                if(_address == '') icon = Icons.ac_unit;
                else icon = Icons.location_on;

                return IconButton(icon: Icon(icon), onPressed: _getLocation,);
              })
            ),
          ],
          
          bottom: TabBar(
            controller: null,
            tabs: [
              Tab(icon: Icon(Icons.abc_outlined),),
              Tab(icon: Icon(Icons.stacked_line_chart_rounded),),
              Tab(icon: Icon(Icons.zoom_out_outlined),),
            ]
          ),
        ),

        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('Md. Ahanaf Arif Khan'), 
                accountEmail: Text('ahanaf019@gmail.com'),
                currentAccountPicture: CircleAvatar(backgroundColor: Colors.green),
                decoration: BoxDecoration(color: Colors.purple[400]),
              ),
            ],
          ),
        ),
        
        body: TabBarView(
          children: [
            Center(
              child: Text('Main Tab'),
            ),
            WeatherByTimeTab(data),
            Center(
              child: Text('Tab 3'),
            ),

          ],
        )
        
        ),

      ),
    );
  }
}
