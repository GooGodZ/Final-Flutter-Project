import 'package:flutter/material.dart';
import 'package:travel_in_laos/utility/my_style.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  double widths;

  Container buildGoo() {
    return Container(
      margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              CircleAvatar(
                radius: 100.0,
                backgroundImage: AssetImage('images/goo.jpg'),
              ),
              ListTile(
                leading: Icon(
                  Icons.perm_identity,
                  color: MyStyle().darkColor,
                  size: 35.0,
                ),
                title: MyStyle().textBlack('ທ້າວ ທິນນະກອນ ລໍວັນໄຊ'),
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 15.0,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('images/facebook.png'),
                ),
                title: MyStyle().textBlack('Goo'),
              ),
              ListTile(
                leading: Icon(
                  Icons.work_outlined,
                  color: MyStyle().darkColor,
                  size: 35.0,
                ),
                title: MyStyle().textBlack('Developer'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildPoukky() {
    return Container(
      margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              CircleAvatar(
                radius: 100.0,
                backgroundImage: AssetImage('images/pookky.jpg'),
              ),
              ListTile(
                leading: Icon(
                  Icons.perm_identity,
                  color: MyStyle().darkColor,
                  size: 35.0,
                ),
                title: MyStyle().textBlack('ນາງ ທິບພະພອນ ສູນທະລາ'),
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 15.0,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('images/facebook.png'),
                ),
                title: MyStyle().textBlack('Thippaphone Sounthala'),
              ),
              ListTile(
                leading: Icon(
                  Icons.work_outlined,
                  color: MyStyle().darkColor,
                  size: 35.0,
                ),
                title: MyStyle().textBlack('Information'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildFar() {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              CircleAvatar(
                radius: 100.0,
                backgroundImage: AssetImage('images/far.jpg'),
              ),
              ListTile(
                leading: Icon(
                  Icons.perm_identity,
                  color: MyStyle().darkColor,
                  size: 35.0,
                ),
                title: MyStyle().textBlack('ນາງ ຟ້າໃສ ໂຄດໂຍທາ'),
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 15.0,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('images/facebook.png'),
                ),
                title: MyStyle().textBlack('Farsai Khodyotha'),
              ),
              ListTile(
                leading: Icon(
                  Icons.work_outlined,
                  color: MyStyle().darkColor,
                  size: 35.0,
                ),
                title: MyStyle().textBlack('UX/UI Design'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    widths = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyStyle().lightColor,
      appBar: AppBar(
        backgroundColor: MyStyle().darkColor,
        title: MyStyle().textWhite('ກ່ຽວກັບທີມ'),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: [
            buildGoo(),
            buildPoukky(),
            buildFar(),
          ],
        ),
      ),
    );
  }
}
