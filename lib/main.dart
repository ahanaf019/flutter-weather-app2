import 'package:flutter/material.dart';
import 'data.dart';
import 'weather_by_time_tab.dart';
import 'main_tab.dart';
import 'weather_icons.dart';

void main(List<String> args) {

  runApp(Main());

}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => MainState();
}

class MainState extends State<Main> {

  var data = Data();

  @override
  void initState() {

    data.getLocationPositionNWeather();
    super.initState();
  }

  void _getLocation() {
    data.getLocationPositionNWeather();
  }

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      themeMode: ThemeMode.system,
      darkTheme: ThemeData(
        brightness: Brightness.dark
      ),
      theme: ThemeData(
        brightness: Brightness.light
      ),
      home: DefaultTabController(
        length: 2, 
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
              Tab(icon: WeatherIcons.tab1Icon,),
              Tab(icon: WeatherIcons.tab2Icon,),
            ]
          ),
        ),

        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('Md. Ahanaf Arif Khan', style: TextStyle(color: Colors.black),), 
                accountEmail: Text('ahanaf019@gmail.com', style: TextStyle(color: Colors.black)),
                currentAccountPicture: CircleAvatar(foregroundImage: Image.asset('assets/profile-0.jpg').image,),
                decoration: BoxDecoration(color: Colors.lightGreen[400]),
              ),
              ListTile(title: Text('Main Page'), onTap: () {
                print('Main');
              },),
              ListTile(title: Text('About App'), onTap: () {
                print('About');
              },),
            ],
          ),
        ),
        
        body: TabBarView(
          children: [
            MainTab(data),
            WeatherByTimeTab(data),

          ],
        )
        
        ),

      ),
    );
  }
}
