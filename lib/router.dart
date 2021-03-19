import 'package:flutter/material.dart';
import 'package:travel_in_laos/screens/about_project.dart';
import 'package:travel_in_laos/screens/about_us.dart';
import 'package:travel_in_laos/screens/authenticate.dart';
import 'package:travel_in_laos/screens/register.dart';
import 'package:travel_in_laos/screens/show_travel_list_central.dart';
import 'package:travel_in_laos/screens/show_travel_list_north.dart';
import 'package:travel_in_laos/screens/show_travel_list_south.dart';
import 'package:travel_in_laos/utility/my_service.dart';

final Map<String, WidgetBuilder> routes = {
  '/authenticate': (BuildContext context) => Authenticate(),
  '/register': (BuildContext context) => Register(),
  '/my_service': (BuildContext context) => MyService(),
  '/show_travel_list_central': (BuildContext context) => ShowTravelListCentral(),
  '/show_travel_list_north': (BuildContext context) => ShowTravelListNorth(),
  '/show_travel_list_south': (BuildContext context) => ShowTravelListSouth(),
  '/about_us': (BuildContext context) => AboutUs(),
  '/about_project': (BuildContext context) => AboutProject(),
};
