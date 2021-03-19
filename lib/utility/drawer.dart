import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:travel_in_laos/utility/my_style.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  double widths, heights;
  String name, email;

  @override
  void initState() {
    super.initState();
    findNameAndEmail();
  }

  Future<Null> findNameAndEmail() async {
    await Firebase.initializeApp().then((value) async {
       FirebaseAuth.instance.authStateChanges().listen((event) {
        setState(() {
          name = event.displayName;
          email = event.email;
        });
      });
    });
  }

  UserAccountsDrawerHeader buildUserAccounts() {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        color: MyStyle().darkColor,
      ),
      accountName: MyStyle().titleH2White(name == null ? 'Name: ' : name),
      accountEmail: MyStyle().titleH2White(email == null ? 'Email:' : email),
    );
  }

  ListTile buildShowHomePage() {
    return ListTile(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(
            context, '/my_service', (route) => false);
      },
      leading: Icon(
        Icons.home,
        size: 30.0,
        color: MyStyle().darkColor,
      ),
      title: MyStyle().titleH3Black('ໜ້າຫຼັກ'),
    );
  }

  ListTile buildShowAboutUs() {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, '/about_us');
      },
      leading: Icon(
        Icons.group_outlined,
        size: 30.0,
        color: MyStyle().darkColor,
      ),
      title: MyStyle().titleH3Black('ກ່ຽວກັບທີມ'),
    );
  }

  ListTile buildShowAboutProject() {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, '/about_project');
      },
      leading: Icon(
        Icons.apps_outlined,
        size: 30.0,
        color: MyStyle().darkColor,
      ),
      title: MyStyle().titleH3Black('ກ່ຽວກັບແອັບພິເຄຊັນ'),
    );
  }

  Column buildSignOut() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ListTile(
          onTap: () async {
            await Firebase.initializeApp().then((value) async {
              await FirebaseAuth.instance.signOut().then((value) =>
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/authenticate', (route) => false));
            });
          },
          leading: Icon(
            Icons.exit_to_app_outlined,
            color: Colors.white,
            size: 36.0,
          ),
          title: MyStyle().textWhite('ອອກຈາກລະບົບ'),
          tileColor: MyStyle().darkColor,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    widths = MediaQuery.of(context).size.width;
    heights = MediaQuery.of(context).size.height;
    return Drawer(
      child: Stack(
        children: [
          Column(
            children: [
              buildUserAccounts(),
              buildShowHomePage(),
              buildShowAboutProject(),
              buildShowAboutUs(),
            ],
          ),
          buildSignOut(),
        ],
      ),
    );
  }
}
