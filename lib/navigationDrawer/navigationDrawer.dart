import 'package:flutter/material.dart';
import 'file:///G:/EXAMENS/EXAMEN%20sp2-api/sp2_Project/7CHECK/lib/fragments/loginScreen.dart';
import 'file:///G:/EXAMENS/EXAMEN%20sp2-api/sp2_Project/7CHECK/lib/widgets/createDrawerHeader.dart';
import 'file:///G:/EXAMENS/EXAMEN%20sp2-api/sp2_Project/7CHECK/lib/widgets/createDrawerBodyItem.dart';
import 'file:///G:/EXAMENS/EXAMEN%20sp2-api/sp2_Project/7CHECK/lib/routes/screenRoute.dart';
import 'package:shared_preferences/shared_preferences.dart';

class navigationDrawer extends StatelessWidget {

  SharedPreferences sharedPreferences;


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          createDrawerHeader(),
          createDrawerBodyItem(
              icon: Icons.home,
              text: 'Accueil',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, screenRoutes.dashboard),
          ),
          createDrawerBodyItem(
              icon: Icons.event_note,
              text: 'Retrait du véhicule loué',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, screenRoutes.retraitVehicule)
          ),
          createDrawerBodyItem(
              icon: Icons.history,
              text: 'Restitution du véhicule',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, screenRoutes.restitutionVehicule)
          ),
          Divider(),
          createDrawerBodyItem(
              icon: Icons.account_circle,
              text: 'Profil',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, screenRoutes.profile)

          ),

        ],
      ),
    );
  }
}