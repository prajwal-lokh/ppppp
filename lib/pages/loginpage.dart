import 'package:anna/pages/Registration.dart';
import 'package:anna/pages/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:project_1/pages/home.dart';
// import 'package:project_1/pages/registration.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String passward;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(81, 146, 89, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300,
            padding: EdgeInsets.only(right: 70, bottom: 5, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  ' Anna Chatra',
                  style: GoogleFonts.montserrat(
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.white),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      ' Log In ',
                      style: GoogleFonts.montserrat(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(81, 146, 89, 1),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        onChanged: (value) {
                          email = value;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            //border: OutlineInputBorder(),
                            labelText: 'e-mail',
                            labelStyle: GoogleFonts.montserrat(
                                fontSize: 18, fontWeight: FontWeight.w400),
                            hintText: 'Enter Your valid mail'),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        onChanged: (value) {
                          passward = value;
                        },
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(
                            //border: OutlineInputBorder(),
                            labelText: 'Passward',
                            labelStyle: GoogleFonts.montserrat(
                                fontSize: 18, fontWeight: FontWeight.w400),
                            hintText: 'Enter Your valid Password'),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Registrationpage()),
                            );
                          },
                          child: Text(
                            'Not Registerd ?',
                            style: GoogleFonts.montserrat(
                              color: Colors.blueAccent,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 70),
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            try {
                              final User =
                                  await _auth.signInWithEmailAndPassword(
                                      email: email, password: passward);

                              if (User != null) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Homepage()));
                              }
                            } catch (e) {
                              print(e);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 20.0),
                            backgroundColor: Color.fromRGBO(240, 187, 98, 1),
                            shape: StadiumBorder(),
                          ),
                          child: Text(
                            '  Log In  ',
                            style: GoogleFonts.montserrat(
                              color: Color.fromRGBO(100, 100, 100, 1),
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
