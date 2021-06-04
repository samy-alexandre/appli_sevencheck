import 'dart:convert';

import 'package:flutter/material.dart';
import 'file:///G:/EXAMENS/EXAMEN%20sp2-api/sp2_Project/7CHECK/lib/models/employee.dart';
import 'file:///G:/EXAMENS/EXAMEN%20sp2-api/sp2_Project/7CHECK/lib/navigationDrawer/navigationDrawer.dart';
import 'file:///G:/EXAMENS/EXAMEN sp2-api/sp2_Project/7CHECK/lib/widgets/globals.dart';


import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'loginScreen.dart';

class RetraitVehiculeScreen extends StatefulWidget {
  static const String routeName = '/RetraitVehiculeScreen';

  @override
  _RetraitVehiculeScreenState createState() =>
      _RetraitVehiculeScreenState();
}

class _RetraitVehiculeScreenState extends State<RetraitVehiculeScreen > {
  TextStyle style =
  TextStyle(fontFamily: 'Montserrat', fontSize: 20.0, color: Colors.white);
  String dropdownValue = 'One';
  bool _checked1 = false;
  bool _checked2 = false;
  bool _checked3 = false;
  bool _checked4 = false;
  bool _checked5 = false;
  bool _checked6 = false;
  bool _checked7 = false;
  bool _checked8 = false;
  bool _checked9 = false;
  bool _checked10 = false;
  bool _checked11 = false;
  bool _checked12 = false;
  bool _checked13 = false;
  bool _checked14 = false;
  bool _checked15 = false;
  bool _checked16 = false;
  bool _checked17 = false;
  bool _checked18 = false;
  bool _checked19 = false;
  bool _checked20 = false;
  bool _checked21 = false;
  bool _checked22 = false;
  bool _checked23 = false;
  bool _checked24 = false;
  bool _checked25 = false;
  bool _checked26 = false;
  bool _checked27 = false;
  bool _checked28 = false;
  bool _checked29 = false;
  bool _checked30 = false;
  bool _checked31 = false;
  bool _checked32 = false;
  bool _checked33 = false;
  bool _checked34 = false;
  bool _checked35 = false;
  bool _checked36 = false;

  @override
  Widget build(BuildContext context) {
    final drop = DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );

    final table1 = Table(
      border: TableBorder.all(),
      children: [
        TableRow(children: [
          Center(
              child: Text(
                "Kilométrage",
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              )),
          Center(
              child: Text(
                "Date - Heure",
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
              )),
        ]),
        TableRow(children: [
          Center(
              child: Text(
                "12 480",
                style: TextStyle(fontSize: 15.0),
              )),
          Center(
              child: Text(
                "13/04/2018 08:30",
                style: TextStyle(fontSize: 15.0),
              )),
        ])
      ],
    );

    final checkboxLeft = Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 90),
                ),
                Text('RS         RP         EC    ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Aile AV G.',
                  style: TextStyle(fontSize: 17.0),
                ),
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.blue,
                  value: this._checked13,
                  onChanged: (bool value) {
                    setState(() {
                      this._checked13 = value;
                    });
                  },
                ),
                Checkbox(
                  value: this._checked14,
                  onChanged: (bool value) {
                    setState(() {
                      this._checked14 = value;
                    });
                  },
                ),
                Checkbox(
                  value: this._checked15,
                  onChanged: (bool value) {
                    setState(() {
                      this._checked15 = value;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Aile AR G.',
                  style: TextStyle(fontSize: 17.0),
                ),
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.blue,
                  value: this._checked16,
                  onChanged: (bool value) {
                    setState(() {
                      this._checked16 = value;
                    });
                  },
                ),
                Checkbox(
                  value: this._checked17,
                  onChanged: (bool value) {
                    setState(() {
                      this._checked17 = value;
                    });
                  },
                ),
                Checkbox(
                  value: this._checked18,
                  onChanged: (bool value) {
                    setState(() {
                      this._checked18 = value;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Phare AV G.',
                  style: TextStyle(fontSize: 17.0),
                ),
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.blue,
                  value: this._checked19,
                  onChanged: (bool value) {
                    setState(() {
                      this._checked19 = value;
                    });
                  },
                ),
                Checkbox(
                  value: this._checked20,
                  onChanged: (bool value) {
                    setState(() {
                      this._checked20 = value;
                    });
                  },
                ),
                Checkbox(
                  value: this._checked21,
                  onChanged: (bool value) {
                    setState(() {
                      this._checked21 = value;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Porte AV G.',
                  style: TextStyle(fontSize: 17.0),
                ),
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.blue,
                  value: this._checked22,
                  onChanged: (bool value) {
                    setState(() {
                      this._checked22 = value;
                    });
                  },
                ),
                Checkbox(
                  value: this._checked23,
                  onChanged: (bool value) {
                    setState(() {
                      this._checked23 = value;
                    });
                  },
                ),
                Checkbox(
                  value: this._checked24,
                  onChanged: (bool value) {
                    setState(() {
                      this._checked24 = value;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(right: 12),
                ),
              ],
            ),
          ],
        ));

    final checkboxRight = Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 2),
                ),
                Text(
                  'Aile AV D.',
                  style: TextStyle(fontSize: 17.0),
                ),
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.blue,
                  value: this._checked1,
                  onChanged: (bool value) {
                    setState(() {
                      this._checked1 = value;
                    });
                  },
                ),
                Checkbox(
                  value: this._checked2,
                  onChanged: (bool value) {
                    setState(() {
                      this._checked2 = value;
                    });
                  },
                ),
                Checkbox(
                  value: this._checked3,
                  onChanged: (bool value) {
                    setState(() {
                      this._checked3 = value;
                    });
                  },
                ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Aile AR D.',
                  style: TextStyle(fontSize: 17.0),
                ),
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.blue,
                  value: this._checked4,
                  onChanged: (bool value) {
                    setState(() {
                      this._checked4 = value;
                    });
                  },
                ),
                Checkbox(
                  value: this._checked5,
                  onChanged: (bool value) {
                    setState(() {
                      this._checked5 = value;
                    });
                  },
                ),
                Checkbox(
                  value: this._checked6,
                  onChanged: (bool value) {
                    setState(() {
                      this._checked6 = value;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Phare AV D.',
                  style: TextStyle(fontSize: 17.0),
                ),
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.blue,
                  value: this._checked7,
                  onChanged: (bool value) {
                    setState(() {
                      this._checked7 = value;
                    });
                  },
                ),
                Checkbox(
                  value: this._checked8,
                  onChanged: (bool value) {
                    setState(() {
                      this._checked8 = value;
                    });
                  },
                ),
                Checkbox(
                  value: this._checked9,
                  onChanged: (bool value) {
                    setState(() {
                      this._checked9 = value;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Porte AV D.',
                  style: TextStyle(fontSize: 17.0),
                ),
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.blue,
                  value: this._checked10,
                  onChanged: (bool value) {
                    setState(() {
                      this._checked10 = value;
                    });
                  },
                ),
                Checkbox(
                  value: this._checked11,
                  onChanged: (bool value) {
                    setState(() {
                      this._checked11 = value;
                    });
                  },
                ),
                Checkbox(
                  value: this._checked12,
                  onChanged: (bool value) {
                    setState(() {
                      this._checked12 = value;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(right: 10),
                ),
              ],
            ),
          ],
        ));

    final checkbox = Container(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 5),
                ),
                Text(
                  'Calandre.',
                  style: TextStyle(fontSize: 17.0),
                ),
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.blue,
                  value: this._checked25,
                  onChanged: (bool value) {
                    setState(() {
                      this._checked25 = value;
                    });
                  },
                ),
                Checkbox(
                  value: this._checked26,
                  onChanged: (bool value) {
                    setState(() {
                      this._checked26 = value;
                    });
                  },
                ),
                Checkbox(
                  value: this._checked27,
                  onChanged: (bool value) {
                    setState(() {
                      this._checked27 = value;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Siège pass',
                  style: TextStyle(fontSize: 17.0),
                ),
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.blue,
                  value: this._checked28,
                  onChanged: (bool value) {
                    setState(() {
                      this._checked28 = value;
                    });
                  },
                ),
                Checkbox(
                  value: this._checked29,
                  onChanged: (bool value) {
                    setState(() {
                      this._checked29 = value;
                    });
                  },
                ),
                Checkbox(
                  value: this._checked30,
                  onChanged: (bool value) {
                    setState(() {
                      this._checked30 = value;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Siège cond',
                  style: TextStyle(fontSize: 17.0),
                ),
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.blue,
                  value: this._checked31,
                  onChanged: (bool value) {
                    setState(() {
                      this._checked31 = value;
                    });
                  },
                ),
                Checkbox(
                  value: this._checked32,
                  onChanged: (bool value) {
                    setState(() {
                      this._checked32 = value;
                    });
                  },
                ),
                Checkbox(
                  value: this._checked33,
                  onChanged: (bool value) {
                    setState(() {
                      this._checked33 = value;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(right: 5),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Tableau de b.',
                  style: TextStyle(fontSize: 17.0),
                ),
                Checkbox(
                  checkColor: Colors.white,
                  activeColor: Colors.blue,
                  value: this._checked34,
                  onChanged: (bool value) {
                    setState(() {
                      this._checked34 = value;
                    });
                  },
                ),
                Checkbox(
                  value: this._checked35,
                  onChanged: (bool value) {
                    setState(() {
                      this._checked35 = value;
                    });
                  },
                ),
                Checkbox(
                  value: this._checked36,
                  onChanged: (bool value) {
                    setState(() {
                      this._checked36 = value;
                    });
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(right: 22),
                ),
              ],
            ),
          ],
        ));

    final loginButon = new SizedBox(
      width: 250,
      height: 50,
      child: new RaisedButton(
          color: Colors.lightBlue,
          child: new Text('Valider', style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold, color: Colors.white)),
          onPressed: () {}),
    );

    return Scaffold(
      appBar: AppBar(title: Text("Retrait véhicule"), actions: <Widget>[]),
      drawer: navigationDrawer(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: <Widget>[
                Center(child: drop),
                SizedBox(height: 25.0),
                Center(child: Text('Contrôle n°1 réalisé par Marc Botur')),
                SizedBox(height: 25.0),
                table1,
                SizedBox(height: 25.0),
                Center(
                    child: Text('Dommages constatés sur le véhicule',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold))),
                Center(
                    child: Text(
                        'RS : Rayure superficielle ; RP : Rayure profonde ; EC : Enfoncement/Choc',
                        style: TextStyle(
                            fontSize: 11.0, fontWeight: FontWeight.bold))),
                SizedBox(height: 25.0),
                Container(
                    child: Center(
                      child: checkboxLeft,
                    )),
                Container(
                    child: Center(
                      child: checkboxRight,
                    )),
                Container(
                    child: Center(
                      child: checkbox,
                    )),
                SizedBox(height: 25.0),
                Center(
                    child: Text('Observations :',
                        style: TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold))),
                Center(
                    child: Text('L\'intérieur de la voiture est poussiéreux')),
                SizedBox(height: 25.0),
                loginButon,
                SizedBox(height: 25.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
