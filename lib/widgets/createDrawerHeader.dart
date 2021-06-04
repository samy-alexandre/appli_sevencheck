import 'package:flutter/material.dart';

Widget createDrawerHeader() {
  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.scaleDown,
              image: AssetImage('assets/7Check-Logo.png'))),
      child: Stack(children: <Widget>[
        Positioned(
          bottom: -4.0,
          left: 16.0,
          child: Text("",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
              fontWeight: FontWeight.w500)))
      ]));
 }