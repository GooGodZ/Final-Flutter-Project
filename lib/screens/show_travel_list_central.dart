import 'package:flutter/material.dart';
import 'package:travel_in_laos/utility/central.dart';
import 'package:travel_in_laos/utility/my_style.dart';

class ShowTravelListCentral extends StatefulWidget {
  @override
  _ShowTravelListCentralState createState() => _ShowTravelListCentralState();
}

class _ShowTravelListCentralState extends State<ShowTravelListCentral> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyStyle().lightColor,
      appBar: AppBar(
        title: MyStyle().textWhite('ພາກກາງ'),
        centerTitle: true,
        backgroundColor: MyStyle().darkColor,
      ),
      body: Central(),
    );
  }
}
