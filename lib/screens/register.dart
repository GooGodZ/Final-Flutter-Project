import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:travel_in_laos/utility/dialog.dart';
import 'package:travel_in_laos/utility/my_style.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  double widths, heights;
  bool statusRedEye = true;
  String name, email, password;

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

  Container buildUsername() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 10.0),
      width: widths * 0.75,
      child: TextField(
        onChanged: (value) => name = value.trim(),
        style: TextStyle(color: MyStyle().darkColor),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().darkColor),
          hintText: 'ຊື່:',
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

  Container buildEmail() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.fromLTRB(5.0, 0, 5.0, 10.0),
      width: widths * 0.75,
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) => email = value.trim(),
        style: TextStyle(color: MyStyle().darkColor),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().darkColor),
          hintText: 'ອີເມວ:',
          prefixIcon: Icon(
            Icons.email_outlined,
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
      margin: EdgeInsets.fromLTRB(5.0, 0, 5.0, 10.0),
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
      margin: EdgeInsets.fromLTRB(0.5, 15.0, 5.0, 15.0),
      child: ElevatedButton(
        onPressed: () {
          if ((name?.isEmpty ?? true) ||
              (email?.isEmpty ?? true) ||
              (password.isEmpty ?? true)) {
            normalDialog(
                context, 'ກະລຸນາໃຫ້ທ່ານຕື່ມຂໍ້ມູນໃຫ້ຄົບຖ້ວນ', 'ຂໍຂອບໃຈ');
          } else {
            registerFirebase();
          }
        },
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

  Future<Null> registerFirebase() async {
    await Firebase.initializeApp().then((value) async {
      print('Firebase Initialize Success');
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        print('Register Success');
        await value.user.updateProfile(displayName: name).then((value) =>
            Navigator.pushNamedAndRemoveUntil(
                context, '/my_service', (route) => false));
      }).catchError((value) {
        normalDialog(context, value.message, value.message);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    widths = MediaQuery.of(context).size.width;
    heights = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ສະໝັກສະມາຊິກ',
          style: TextStyle(
            fontWeight: FontWeight.w300,
          ),
        ),
        centerTitle: true,
        backgroundColor: MyStyle().darkColor,
      ),
      backgroundColor: MyStyle().lightColor,
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildLogo(),
                buildUsername(),
                buildEmail(),
                buildPassword(),
                buildRegister(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
