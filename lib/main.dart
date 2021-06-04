import 'package:flutter/material.dart';

//Import for routes
import 'file:///G:/EXAMENS/EXAMEN%20sp2-api/sp2_Project/7CHECK/lib/fragments/loginScreen.dart';
import 'file:///G:/EXAMENS/EXAMEN%20sp2-api/sp2_Project/7CHECK/lib/routes/screenRoute.dart';
import 'file:///G:/EXAMENS/EXAMEN%20sp2-api/sp2_Project/7CHECK/lib/fragments/dashboardScreen.dart';
import 'file:///G:/EXAMENS/EXAMEN%20sp2-api/sp2_Project/7CHECK/lib/fragments/retraitVehiculeScreen.dart';
import 'file:///G:/EXAMENS/EXAMEN%20sp2-api/sp2_Project/7CHECK/lib/fragments/restitutionVehiculeScreen.dart';
import 'package:seven_check/fragments/profile/profileScreen.dart';




void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      routes:  {
        screenRoutes.dashboard: (context) => DashboardScreen(),
        screenRoutes.retraitVehicule: (context) => RetraitVehiculeScreen(),
        screenRoutes.restitutionVehicule: (context) => RestitutionVehiculeScreen(),
        screenRoutes.profile: (context) => ProfileScreen(),
        screenRoutes.logout: (context) => LoginScreen(),
      },
    );
  }
}