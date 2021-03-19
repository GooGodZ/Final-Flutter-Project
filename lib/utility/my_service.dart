import 'package:flutter/material.dart';

import 'package:travel_in_laos/utility/drawer.dart';
import 'package:travel_in_laos/utility/my_style.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  double widths, heights;

  GestureDetector buildNorth(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/show_travel_list_north');
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
        child: Container(
          padding: EdgeInsets.all(10.5),
          child: Column(
            children: [
              Container(
                width: widths * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Image(
                  image: AssetImage('images/tadkuangsi.jpg'),
                ),
              ),
              MyStyle().textDark('ພາກເໜືອ'),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector buildCentral(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/show_travel_list_central');
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
        child: Container(
          padding: EdgeInsets.all(10.5),
          child: Column(
            children: [
              Container(
                width: widths * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Image(
                  image: AssetImage('images/phanamxai.jpg'),
                ),
              ),
              MyStyle().textDark('ພາກກາງ'),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector buildSouth(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/show_travel_list_south');
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
        child: Container(
          padding: EdgeInsets.all(10.5),
          child: Column(
            children: [
              Container(
                width: widths * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Image(
                  image: AssetImage('images/khonephapheng.jpg'),
                ),
              ),
              MyStyle().textDark('ພາກໄຕ້'),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    widths = MediaQuery.of(context).size.width;
    heights = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyStyle().lightColor,
      appBar: AppBar(
        title: MyStyle().textWhite('ໜ້າຫຼັກ'),
        centerTitle: true,
        backgroundColor: MyStyle().darkColor,
      ),
      drawer: MyDrawer(),
      body: Container(
        child: ListView(
          children: [
            buildNorth(context),
            buildCentral(context),
            buildSouth(context),
          ],
        ),
      ),
    );
  }
}
