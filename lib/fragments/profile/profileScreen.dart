import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:math';
import 'package:seven_check/models/employee.dart';
import 'file:///G:/EXAMENS/EXAMEN%20sp2-api/sp2_Project/7CHECK/lib/navigationDrawer/navigationDrawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:seven_check/widgets/globals.dart';
import 'package:http/http.dart' as http;
import '../loginScreen.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = '/profilScreen';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();
  Future<Employee> _employee;

  SharedPreferences sharedPreferences;

  var firstname = "";

  get key => null;

  @override
  void initState() {
    super.initState();
    _employee = authMe();
    checkLoginStatus();
    print(_employee);
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
          (Route<dynamic> route) => false);
    }
  }

  Future<Employee> authMe() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var jsonResponse;

    final token = sharedPreferences.getString('token');

    final utilisateurConnecte = await http.post(API_URL + "/auth/me",
        headers: {'Authorization': 'Bearer ' + token});

    if (utilisateurConnecte.statusCode == 200) {
      jsonResponse = json.decode(utilisateurConnecte.body);
      //print('Response status: ${utilisateurConnecte.statusCode}');
      //print('Response body: ${utilisateurConnecte.body}');

      //print(jsonResponse['id']);
      return Employee.fromJson(jsonResponse);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Mon Profil"),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                sharedPreferences.clear();
                sharedPreferences.commit();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (BuildContext context) => LoginScreen()),
                    (Route<dynamic> route) => false);
              },
              child: Text("Déconnexion", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
        drawer: navigationDrawer(),
        body: SingleChildScrollView(
          child: FutureBuilder<Employee>(
            future: _employee,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(children: [
                  Column(
                    children: <Widget>[
                      new Container(
                        height: 180.0,
                        color: Colors.white,
                        child: new Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: new Stack(
                                  fit: StackFit.loose,
                                  children: <Widget>[
                                    new Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        new Container(
                                            width: 140.0,
                                            height: 140.0,
                                            decoration: new BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: new DecorationImage(
                                                image: new ExactAssetImage(
                                                    'assets/default-avatar.png'),
                                                fit: BoxFit.cover,
                                              ),
                                            )),
                                      ],
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            top: 90.0, right: 100.0),
                                        child: new Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            new CircleAvatar(
                                              backgroundColor: Colors.red,
                                              radius: 25.0,
                                              child: new Icon(
                                                Icons.camera_alt,
                                                color: Colors.white,
                                              ),
                                            )
                                          ],
                                        )),
                                  ]),
                            )
                          ],
                        ),
                      ),
                      new Container(
                          color: Color(0xffFFFFFF),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 25.0),
                            child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25.0, right: 25.0, top: 25.0),
                                      child: new Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          new Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              new Text(
                                                'Parsonal Information',
                                                style: TextStyle(
                                                    fontSize: 18.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          new Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              _status
                                                  ? _getEditIcon()
                                                  : new Container(),
                                            ],
                                          )
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25.0, right: 25.0, top: 25.0),
                                      child: new Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          new Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              new Text(
                                                'Prénom',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25.0, right: 25.0, top: 2.0),
                                      child: new Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          new Flexible(
                                            key: key,
                                            child: new TextFormField(
                                              onSaved: ((value) =>
                                                  print(value)),
                                              validator: (value) {
                                                if (value.isEmpty)
                                                  return "Name its required";
                                              },
                                              initialValue:
                                                  snapshot.data.firstname,
                                              decoration:
                                                  const InputDecoration(),
                                              enabled: !_status,
                                              autofocus: !_status,
                                            ),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25.0, right: 25.0, top: 25.0),
                                      child: new Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          new Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              new Text(
                                                'Nom de famille',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25.0, right: 25.0, top: 2.0),
                                      child: new Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          new Flexible(
                                            key: key,
                                            child: new TextFormField(
                                              onSaved: ((value) =>
                                                  print(value)),
                                              validator: (value) {
                                                if (value.isEmpty)
                                                  return "LastName its required";
                                              },
                                              initialValue:
                                                  snapshot.data.lastname,
                                              decoration:
                                                  const InputDecoration(),
                                              enabled: !_status,
                                              autofocus: !_status,
                                            ),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25.0, right: 25.0, top: 25.0),
                                      child: new Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          new Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              new Text(
                                                'Mot de passe',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25.0, right: 25.0, top: 2.0),
                                      child: new Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          new Flexible(
                                            key: key,
                                            child: new TextFormField(
                                              onSaved: ((value) =>
                                                  print(value)),
                                              validator: (value) {
                                                if (value.isEmpty)
                                                  return "MDP est requis";
                                              },
                                              decoration: const InputDecoration(
                                                  hintText:
                                                      'Saisissez votre nouveau mot de passe'),
                                              enabled: !_status,
                                              autofocus: !_status,
                                            ),
                                          ),
                                        ],
                                      )),

                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25.0, right: 25.0, top: 25.0),
                                      child: new Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          new Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              new Text(
                                                'Rue de l\'agence',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25.0, right: 25.0, top: 2.0),
                                      child: new Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          new Flexible(
                                            key: key,
                                            child: new TextFormField(
                                              onSaved: ((value) =>
                                                  print(value)),
                                              validator: (value) {
                                                if (value.isEmpty)
                                                  return "LastName its required";
                                              },
                                              initialValue:
                                              snapshot.data.address,
                                              decoration:
                                              const InputDecoration(),
                                              enabled: !_status,
                                              autofocus: !_status,
                                            ),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25.0, right: 25.0, top: 25.0),
                                      child: new Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          new Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              new Text(
                                                'Ville de l\'agence',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25.0, right: 25.0, top: 2.0),
                                      child: new Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          new Flexible(
                                            key: key,
                                            child: new TextFormField(
                                              onSaved: ((value) =>
                                                  print(value)),
                                              validator: (value) {
                                                if (value.isEmpty)
                                                  return "LastName its required";
                                              },
                                              initialValue:
                                              snapshot.data.ville,
                                              decoration:
                                              const InputDecoration(),
                                              enabled: !_status,
                                              autofocus: !_status,
                                            ),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25.0, right: 25.0, top: 25.0),
                                      child: new Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          new Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              new Text(
                                                'Code postal de l\'agence',
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                    FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25.0, right: 25.0, top: 2.0),
                                      child: new Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          new Flexible(
                                            key: key,
                                            child: new TextFormField(
                                              onSaved: ((value) =>
                                                  print(value)),
                                              validator: (value) {
                                                if (value.isEmpty)
                                                  return "LastName its required";
                                              },
                                              initialValue:
                                              snapshot.data.postcode,
                                              decoration:
                                              const InputDecoration(),
                                              enabled: !_status,
                                              autofocus: !_status,
                                            ),
                                          ),
                                        ],
                                      )),

                                  !_status
                                      ? _getActionButtons()
                                      : new Container(),
                                ]),
                          )),
                    ],
                  ),
                ]);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Save"),
                textColor: Colors.white,
                color: Colors.green,
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Cancel"),
                textColor: Colors.white,
                color: Colors.red,
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}
