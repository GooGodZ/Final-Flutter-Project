import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:travel_in_laos/screens/resetpassword.dart';
import 'package:travel_in_laos/utility/dialog.dart';
import 'package:travel_in_laos/utility/my_style.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  double widths, heights;
  bool statusRedEye = true;
  String email, password;

  Container buildLogo() {
    return Container(
      width: widths * 0.70,
      child: Column(
        children: [
          MyStyle().showLogo(),
          SizedBox(height: 5.0),
          MyStyle().titleH1('Travel with Me'),
          SizedBox(height: 5.0),
        ],
      ),
    );
  }

  Container buildEmail() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 0),
      width: widths * 0.75,
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) => email = value.trim(),
        style: TextStyle(color: MyStyle().darkColor),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().darkColor),
          hintText: 'ອີເມວ:',
          prefixIcon: Icon(
            Icons.perm_identity,
            color: MyStyle().darkColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: MyStyle().darkColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: MyStyle().primaryColor),
          ),
        ),
      ),
    );
  }

  Container buildPassword() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 15.0),
      width: widths * 0.75,
      child: TextField(
        onChanged: (value) => password = value.trim(),
        obscureText: statusRedEye,
        style: TextStyle(color: MyStyle().darkColor),
        decoration: InputDecoration(
          suffixIcon: IconButton(
            color: MyStyle().darkColor,
            icon: statusRedEye
                ? Icon(Icons.remove_red_eye)
                : Icon(Icons.remove_red_eye_outlined),
            onPressed: () {
              setState(() {
                statusRedEye = !statusRedEye;
              });
              print('Status Red Eye = $statusRedEye');
            },
          ),
          hintStyle: TextStyle(color: MyStyle().darkColor),
          hintText: 'ລະຫັດ:',
          prefixIcon: Icon(
            Icons.lock_outline,
            color: MyStyle().darkColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: MyStyle().darkColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: MyStyle().primaryColor),
          ),
        ),
      ),
    );
  }

  Container buildRegister() {
    return Container(
      width: widths * 0.35,
      height: heights * 0.065,
      margin: EdgeInsets.fromLTRB(0.5, 0, 5.0, 0),
      child: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, '/register'),
        child: Text('ສະໝັກສະມາຊິກ'),
        style: ElevatedButton.styleFrom(
          primary: MyStyle().darkColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }

  Container buildLogin() {
    return Container(
      width: widths * 0.35,
      height: heights * 0.065,
      margin: EdgeInsets.fromLTRB(0.5, 0, 5.0, 0),
      child: ElevatedButton(
        onPressed: () {
          if ((email?.isEmpty ?? true) || (password?.isEmpty ?? true)) {
            normalDialog(
                context, 'ກະລຸນາໃຫ້ທ່ານຕື່ມຂໍ້ມູນໃຫ້ຄົບຖ້ວນ', 'ຂໍຂອບໃຈ');
          } else {
            loginAuthenticate();
          }
        },
        child: Text('ເຂົ້າສູ່ລະບົບ'),
        style: ElevatedButton.styleFrom(
          primary: MyStyle().darkColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }

  Container buildRowRegisterLogin() {
    return Container(
      width: widths * 0.8,
      margin: EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildRegister(),
          buildLogin(),
        ],
      ),
    );
  }

  Container buildResetPassword() {
    return Container(
      margin: EdgeInsets.fromLTRB(5.0, 20.0, 5.0, 15.0),
      child: TextButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ResetPassword()),
          );
        },
        child: MyStyle().textDark('ລືມລະຫັດຜ່ານ?'),
      ),
    );
  }

  Future<Null> loginAuthenticate() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => Navigator.pushNamedAndRemoveUntil(
              context, '/my_service', (route) => false))
          .catchError(
              (value) => normalDialog(context, value.message, value.message));
    });
  }

  @override
  Widget build(BuildContext context) {
    widths = MediaQuery.of(context).size.width;
    heights = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyStyle().lightColor,
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildLogo(),
                buildEmail(),
                buildPassword(),
                buildRowRegisterLogin(),
                buildResetPassword(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
