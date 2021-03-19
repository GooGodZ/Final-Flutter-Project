import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:travel_in_laos/models/north_laos_model.dart';
import 'package:travel_in_laos/screens/north_detail.dart';
import 'package:travel_in_laos/utility/my_style.dart';

class North extends StatefulWidget {
  @override
  _NorthState createState() => _NorthState();
}

class _NorthState extends State<North> {
  double widths, heights;
  List<Widget> widgets = [];
  List<NorthModel> northModels = [];

  @override
  void initState() {
    super.initState();
    readData();
  }

  Future<Null> readData() async {
    await Firebase.initializeApp().then((value) async {
       FirebaseFirestore.instance
          .collection('Northern Region')
          .snapshots()
          .listen((event) {
        int index = 0;
        for (var snapshot in event.docs) {
          Map<String, dynamic> map = snapshot.data();
          NorthModel model = NorthModel.fromMap(map);
          northModels.add(model);
          setState(() {
            widgets.add(createWidget(model, index));
          });
          index++;
        }
      });
    });
  }

  Widget createWidget(NorthModel model, int index) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NorthDetail(
                northModel: northModels[index],
              ),
            ),
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
          color: MyStyle().primaryColor,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 5.0),
                  width: widths * 0.8,
                  child: Image.network(model.cover),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: MyStyle().titleH2White(model.name),
                ),
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    widths = MediaQuery.of(context).size.width;
    heights = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyStyle().lightColor,
      body: widgets.length == 0
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: widgets,
            ),
    );
  }
}
