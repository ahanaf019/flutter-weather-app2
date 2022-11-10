import 'package:flutter/material.dart';
import 'weather.dart';

class WeatherTile extends StatelessWidget {

  late WeatherByTime data;

  WeatherTile(WeatherByTime data, {super.key})
  {
    this.data = data;
  }

  String _formatDateTime(String data) {
    
    var x = data.split(' ');
    Map<String, String> months = Map<String, String>();
    months['1']= 'January';
    months['2']= 'February';
    months['3']= 'March';
    months['4']= 'April';
    months['5']= 'May';
    months['6']= 'June';
    months['7']= 'July';
    months['8']= 'August';
    months['9']= 'September';
    months['10']= 'October';
    months['11']= 'November';
    months['12']= 'December';

    String date = x[0];
    String time = x[1];

    x = date.split('-');

    var y = time.split(':');
    int t = int.parse(y[0]);
    String ts;
    
    if(t == 0) ts = '12am';
    else if(t > 0 && t < 12) ts = '${t}am';
    else if(t == 12) ts = '12pm';
    else ts = '${t - 12}pm';


    return '${months[x[1]]} ${x[2]}, $ts';
  }

  @override
  Widget build(BuildContext context) {

    if(data != null) {
      // _formatDateTime(data.dateTime);
      return ListTile(
        leading: Icon(Icons.sunny),
        title: Text('${_formatDateTime(data.dateTime)}'),
        trailing: Text('${data.temp}°C'),
        subtitle: Text('Feels Like: ${data.feelsLike}°C'),
        // isThreeLine: true,
      );
    } else {
      return const ListTile(
        leading: Icon(Icons.sunny),
        title: Text('Loading'),
        trailing: Text('Loading'),
        subtitle: Text('Loading'),
        // isThreeLine: true,
      );
    }
  }
}