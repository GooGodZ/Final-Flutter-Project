import 'package:flutter/material.dart';

class MyStyle {
  Color darkColor = Color(0xff27B1BE);
  Color primaryColor = Color(0xffB8E5EA);
  Color lightColor = Color(0xffEAF0F4);

  Widget showLogo() => Image.asset('images/travel_logo.png');

  Widget titleH1(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.w600,
          color: darkColor,
        ),
      );

  Widget titleH2(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
          color: darkColor,
        ),
      );

  Widget titleH2White(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
          color: Colors.white,
        ),
      );

  Widget titleH2Black(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w300,
          color: Colors.black,
        ),
      );

  Widget titleH3(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 16.0,
          color: darkColor,
        ),
      );

  Widget titleH3White(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
        ),
      );

  Widget titleH3Black(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.black,
        ),
      );

  Widget textBlack(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.5,
        ),
      );

  Widget textDark(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 20.0,
          color: MyStyle().darkColor,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.5,
        ),
      );

  Widget textWhite(String string) => Text(
        string,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.white,
          fontWeight: FontWeight.w500,
          letterSpacing: 1.5,
        ),
      );

  MyStyle();
}
