import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'file:///F:/EXAMENS/EXAMEN%20sp2-api/sp2_Project/7CHECK/lib/fragments/loginScreen.dart';
import 'file:///G:/EXAMENS/EXAMEN%20sp2-api/sp2_Project/7CHECK/lib/fragments/profile/profileScreen.dart';
import 'file:///G:/EXAMENS/EXAMEN%20sp2-api/sp2_Project/7CHECK/lib/models/employee.dart';
import 'file:///G:/EXAMENS/EXAMEN%20sp2-api/sp2_Project/7CHECK/lib/widgets/globals.dart';
import 'file:///G:/EXAMENS/EXAMEN%20sp2-api/sp2_Project/7CHECK/lib/routes/screenRoute.dart';


//Drawer import
import 'file:///G:/EXAMENS/EXAMEN%20sp2-api/sp2_Project/7CHECK/lib/navigationDrawer/navigationDrawer.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  static const String routeName = '/dashboardScreen';

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Future<List<Employee>> futureEmployee;
  SharedPreferences sharedPreferences;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();

  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginScreen()), (Route<dynamic> route) => false);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accueil", style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              sharedPreferences.clear();
              sharedPreferences.commit();
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => LoginScreen()), (Route<dynamic> route) => false);
            },
            child: Text("Déconnexion", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      drawer: navigationDrawer(),
    );
  }


  authMe() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var jsonResponse;

    final token = sharedPreferences.getString('token');

    var utilisateur =
    await http.post(API_URL + "/auth/me", headers: { 'Authorization': 'Bearer ' + token});
    if (utilisateur.statusCode == 200) {
      jsonResponse = json.decode(utilisateur.body);
      //print('Response status: ${utilisateur.statusCode}');
      print('Response body: ${utilisateur.body}');
    }
    if (jsonResponse != null) {
      setState(() {
        _isLoading = false;
      });
      sharedPreferences.setString("token", jsonResponse['access_token']);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => ProfileScreen()),
              (Route<dynamic> route) => false);
    }
  }
}




