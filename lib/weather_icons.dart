import 'package:flutter/material.dart';



class WeatherIcons {

  static double _tabBarIconDim = 40;
  static double _detailsIconDim = 40;
  static double _homeIconDim = 200;

  static Image tab1Icon = Image.asset('assets/icons/cloudy.png', height: _tabBarIconDim, width: _tabBarIconDim,);
  static Image tab2Icon = Image.asset('assets/icons/default-icon.png', height: _tabBarIconDim, width: _tabBarIconDim,);
  static Image tab3Icon = Image.asset('assets/icons/search.png', height: _tabBarIconDim - 5, width: _tabBarIconDim - 5,);
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
    'sunrise': Image.asset('assets/icons/sunrise.png', height: _detailsIconDim, width: _detailsIconDim,),
    'sunset': Image.asset('assets/icons/sunset.png', height: _detailsIconDim, width: _detailsIconDim,),
    'wind': Image.asset('assets/icons/windy.png', height: _detailsIconDim, width: _detailsIconDim,),
  };

    static Map<String, Image> iconByIdLarge= {
    '01d': Image.asset('assets/icons/1d.png', height: _homeIconDim, width: _homeIconDim,),
    '01n': Image.asset('assets/icons/1n.png', height: _homeIconDim, width: _homeIconDim,),
    '02d': Image.asset('assets/icons/2d.png', height: _homeIconDim, width: _homeIconDim,),
    '02n': Image.asset('assets/icons/2n.png', height: _homeIconDim, width: _homeIconDim,),
    '03d': Image.asset('assets/icons/3d.png', height: _homeIconDim, width: _homeIconDim,),
    '03n': Image.asset('assets/icons/3n.png', height: _homeIconDim, width: _homeIconDim,),
    '04d': Image.asset('assets/icons/4d.png', height: _homeIconDim, width: _homeIconDim,),
    '04n': Image.asset('assets/icons/4n.png', height: _homeIconDim, width: _homeIconDim,),
    '09d': Image.asset('assets/icons/9d.png', height: _homeIconDim, width: _homeIconDim,),
    '09n': Image.asset('assets/icons/9n.png', height: _homeIconDim, width: _homeIconDim,),
    '11d': Image.asset('assets/icons/11d.png', height: _homeIconDim, width: _homeIconDim,),
    '11n': Image.asset('assets/icons/11n.png', height: _homeIconDim, width: _homeIconDim,),
    '50d': Image.asset('assets/icons/50d.png', height: _homeIconDim, width: _homeIconDim,),
    '50n': Image.asset('assets/icons/50n.png', height: _homeIconDim, width: _homeIconDim,),
    'loading': Image.asset('assets/icons/loading.png', height: _homeIconDim, width: _homeIconDim,),
  };


}