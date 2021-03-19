import 'package:flutter/material.dart';
import 'package:travel_in_laos/utility/my_style.dart';
import 'package:travel_in_laos/utility/south.dart';

class ShowTravelListSouth extends StatefulWidget {
  @override
  _ShowTravelListSouthState createState() => _ShowTravelListSouthState();
}

class _ShowTravelListSouthState extends State<ShowTravelListSouth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyStyle().lightColor,
      appBar: AppBar(
        title: MyStyle().textWhite('ພາກໄຕ້'),
        centerTitle: true,
        backgroundColor: MyStyle().darkColor,
      ),
      body: South(),
    );
  }
}
