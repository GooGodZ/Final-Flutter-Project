import 'package:flutter/material.dart';
import 'package:travel_in_laos/models/central_laos_model.dart';
import 'package:travel_in_laos/utility/my_style.dart';

class CentralDetail extends StatefulWidget {
  final CentralModel centralModel;

  CentralDetail({Key key, this.centralModel}) : super(key: key);

  @override
  _CentralDetailState createState() => _CentralDetailState();
}

class _CentralDetailState extends State<CentralDetail> {
  CentralModel model;
  double widths, heights;

  @override
  void initState() {
    super.initState();
    model = widget.centralModel;
  }

  Expanded buildCoverAndImage() {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                margin: EdgeInsets.all(15.0),
                width: widths * 0.9,
                height: heights * 0.5,
                child: Image.network(model.cover),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                margin: EdgeInsets.all(15.0),
                width: widths * 0.9,
                height: heights * 0.5,
                child: Image.network(model.image1),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                margin: EdgeInsets.all(15.0),
                width: widths * 0.9,
                height: heights * 0.5,
                child: Image.network(model.image2),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                margin: EdgeInsets.all(15.0),
                width: widths * 0.9,
                height: heights * 0.5,
                child: Image.network(model.image3),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile buildProvince() {
    return ListTile(
      leading: MyStyle().textDark('????????????:'),
      title: MyStyle().textBlack(model.province),
    );
  }

  ListTile buildDistrict() {
    return ListTile(
      leading: MyStyle().textDark('???????????????:'),
      title: MyStyle().textBlack(model.district),
    );
  }

  Expanded buildDetail() {
    return Expanded(
      child: Container(
        child: Column(
          children: [
            MyStyle().textDark('????????????????????????:'),
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    child: MyStyle().textBlack(model.detail),
                  ),
                ),
              ),
            ),
          ],
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
        backgroundColor: MyStyle().darkColor,
        title: MyStyle().textWhite(model.name == null ? 'Detail' : model.name),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            buildCoverAndImage(),
            buildProvince(),
            buildDistrict(),
            buildDetail(),
          ],
        ),
      ),
    );
  }
}