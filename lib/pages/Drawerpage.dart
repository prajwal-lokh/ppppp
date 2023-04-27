// import 'dart:html';
// import 'dart:js_util';

import 'package:anna/pages/Drawer/pickuporder.dart';
import 'package:anna/pages/Drawer/viewDonation.dart';
import 'package:anna/pages/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:project_1/pages/drawer/Pickup.dart';
// import 'package:project_1/pages/drawer/donations.dart';
// import 'package:project_1/pages/welcome.dart';

class Opendrawer extends StatefulWidget {
  const Opendrawer({super.key});

  @override
  State<Opendrawer> createState() => _OpendrawerState();
}

class _OpendrawerState extends State<Opendrawer> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          padding: EdgeInsets.only(top: 150, left: 10, right: 10, bottom: 0),
          child: Text(
            'Prajwal Lokhande',
            style: GoogleFonts.montserrat(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          color: Color.fromRGBO(240, 187, 98, 1),
        ),
        ListTile(
          title: Text('View Donation',
              style: GoogleFonts.montserrat(fontSize: 16)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Vieedonations()),
            );
          },
        ),
        ListTile(
          title: Text('Pick up Order',
              style: GoogleFonts.montserrat(fontSize: 16)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Pickup()),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.rotate_left),
          title: Text('Log Out', style: GoogleFonts.montserrat(fontSize: 16)),
          onTap: () {
            _auth.signOut();
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => Loginpage()),
                (route) => false);
          },
        ),
      ],
    );
  }
}
