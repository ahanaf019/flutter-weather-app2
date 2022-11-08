import 'package:flutter/material.dart';
import 'location_widget.dart';

void main(List<String> args) {
  runApp(Main());


}


class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Weather App",
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather'),
        ),
        body: Center(
          child: LocationWidget(),
        )
      ),
    );
  }
}