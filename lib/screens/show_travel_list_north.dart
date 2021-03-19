import 'package:flutter/material.dart';
import 'package:travel_in_laos/utility/my_style.dart';
import 'package:travel_in_laos/utility/north.dart';

class ShowTravelListNorth extends StatefulWidget {
  @override
  _ShowTravelListNorthState createState() => _ShowTravelListNorthState();
}

class _ShowTravelListNorthState extends State<ShowTravelListNorth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyStyle().lightColor,
      appBar: AppBar(
        title: MyStyle().textWhite('ພາກເໜືອ'),
        centerTitle: true,
        backgroundColor: MyStyle().darkColor,
      ),
      body: North(),
    );
  }
}
