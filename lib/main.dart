import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'location_widget.dart';
import 'data.dart';

void main(List<String> args) {

  runApp(Main());



}

BehaviorSubject<int> counter = BehaviorSubject<int>.seeded(0);

class Main extends StatelessWidget {

  Main({super.key});

  Data data = new Data();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      home: Scaffold(
        appBar: AppBar(
          title: StreamBuilder(
            stream: data.address,
            builder: (context, snapshot) {
              if(snapshot.data == '') 
                return Text('Weather');
              return Text('${snapshot.data}');
            } ),
        ),
        body: LocationWidget(data)


        ),
    );
  }
}



// class Main extends StatefulWidget {
//   const Main({super.key});

//   @override
//   State<Main> createState() => _MainState();
// }

// class _MainState extends State<Main> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Weather App",
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Weather'),
//         ),
//         body: StreamBuilder<int>(
//           stream: counter,
//           builder: (BuildContext context, AsyncSnapshot snap) {
//             return Text('${snap.data}');
//           },
//           )
//       ),
//     );
//   }
// }