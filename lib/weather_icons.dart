import 'package:flutter/material.dart';



class WeatherIcons {

  static double _tabBarIconDim = 40;
  static double _detailsIconDim = 40;

  static Image tab1Icon = Image.asset('assets/icons/cloudy.png', height: _tabBarIconDim, width: _tabBarIconDim,);
  static Image tab2Icon = Image.asset('assets/icons/default-icon.png', height: _tabBarIconDim, width: _tabBarIconDim,);
  static Image sunny = Image.asset('assets/icons/sunny.png', height: _detailsIconDim, width: _detailsIconDim,);

  static Map<String, Image> iconById= {
    '01d': Image.asset('assets/icons/1d.png', height: _detailsIconDim, width: _detailsIconDim,),
    '01n': Image.asset('assets/icons/1n.png', height: _detailsIconDim, width: _detailsIconDim,),
    '02d': Image.asset('assets/icons/2d.png', height: _detailsIconDim, width: _detailsIconDim,),
    '02n': Image.asset('assets/icons/2n.png', height: _detailsIconDim, width: _detailsIconDim,),
    '03d': Image.asset('assets/icons/3d.png', height: _detailsIconDim, width: _detailsIconDim,),
    '03n': Image.asset('assets/icons/3n.png', height: _detailsIconDim, width: _detailsIconDim,),
    '04d': Image.asset('assets/icons/4d.png', height: _detailsIconDim, width: _detailsIconDim,),
    '04n': Image.asset('assets/icons/4n.png', height: _detailsIconDim, width: _detailsIconDim,),
    '09d': Image.asset('assets/icons/9d.png', height: _detailsIconDim, width: _detailsIconDim,),
    '09n': Image.asset('assets/icons/9n.png', height: _detailsIconDim, width: _detailsIconDim,),
    '11d': Image.asset('assets/icons/11d.png', height: _detailsIconDim, width: _detailsIconDim,),
    '11n': Image.asset('assets/icons/11n.png', height: _detailsIconDim, width: _detailsIconDim,),
    '50d': Image.asset('assets/icons/50d.png', height: _detailsIconDim, width: _detailsIconDim,),
    '50n': Image.asset('assets/icons/50n.png', height: _detailsIconDim, width: _detailsIconDim,),
  };


}