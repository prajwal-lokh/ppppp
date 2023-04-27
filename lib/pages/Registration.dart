import 'dart:typed_data';

import 'package:anna/pages/homepage.dart';
import 'package:anna/pages/hoteldetail.dart';
import 'package:anna/pages/imagepicPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'dart:io';

class Registrationpage extends StatefulWidget {
  @override
  State<Registrationpage> createState() => _RegistrationpageState();
}

class _RegistrationpageState extends State<Registrationpage> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference RegistrationInfo =
      FirebaseFirestore.instance.collection('RegistrationInfo');

  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  late String username;
  late String address;
  late String email;
  late String password;
  late String verify;
  String? profile;
  String? imageUrl;

  String imageurl = " ";

  void pickuploadImages() async {
    final Image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxHeight: 512,
        maxWidth: 512,
        imageQuality: 75);

    Reference ref = FirebaseStorage.instance.ref().child(" ");

    // await ref.putFile(File(Image!.path));
    // //await ref.putFile(File(Image!.path));
    // ref.getDownloadURL().then((value) {
    //   print(value);
    //   setState(() {
    //     imageurl = value;
    //   });
    //   print(imageUrl);
    // });
    UploadTask uploadTask = ref.putFile(File(Image!.path));

    uploadTask.whenComplete(() async {
      try {
        imageUrl = await ref.getDownloadURL();
        //.then((value) {
        //   // setState(() {
        //   //   imageurl = value;
        //   // });
        // });
      } catch (e) {
        print(e);
      }
      print(imageUrl);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(81, 146, 89, 1),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              height: 150,
              padding: EdgeInsets.only(right: 70, bottom: 10, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    ' Anna Chatra ',
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
                  //controller: ,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        ' Registration ',
                        style: GoogleFonts.montserrat(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(81, 146, 89, 1),
                        ),
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          Card(
                            elevation: 20,
                            child: InkWell(
                              child: Container(
                                height: 136,
                                width: 185,
                                child: imageurl == " "
                                    ? Icon(Icons.image_search_sharp, size: 30)
                                    : Image.network(imageurl),
                              ),
                              onTap: () {
                                pickuploadImages();
                                print('image stored' + imageUrl.toString());
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => Imagespicker()));
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          onChanged: (value) {
                            username = value;
                            //  print(username.toString());
                          },
                          decoration: InputDecoration(
                              labelText: 'Organization / hotel name',
                              labelStyle: GoogleFonts.montserrat(
                                  fontSize: 18, fontWeight: FontWeight.w400)),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          onChanged: (value) {
                            address = value;
                            // print(address.toString());
                          },
                          decoration: InputDecoration(
                              labelText: ' Address ',
                              labelStyle: GoogleFonts.montserrat(
                                  fontSize: 18, fontWeight: FontWeight.w400)),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            email = value;
                          },
                          decoration: InputDecoration(
                              labelText: 'e-mail',
                              labelStyle: GoogleFonts.montserrat(
                                  fontSize: 18, fontWeight: FontWeight.w400)),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          onChanged: (value) {
                            password = value;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: ' Passward ',
                              labelStyle: GoogleFonts.montserrat(
                                  fontSize: 18, fontWeight: FontWeight.w400)),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          onChanged: (value) {
                            verify = value;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: ' Verify Passward ',
                              labelStyle: GoogleFonts.montserrat(
                                  fontSize: 18, fontWeight: FontWeight.w400)),
                        ),
                      ),
                      SizedBox(height: 50),
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              await users.add({
                                'username': username,
                                'profileimg': imageUrl.toString()
                              }).then((value) => print('User added'));
                              await RegistrationInfo.add({
                                'profileimg': imageUrl.toString(),
                                'username': username.toString(),
                                'address': address.toString(),
                                'email': email.toString(),
                                'password': password.toString(),
                              }).then((value) => print('Registred..'));

                              //print(email);
                              //print(password);
                              //Navigator.pop(context);
                              //await Navigator.pushNamed(context, 'Homepage');
                              setState(() {
                                showSpinner = true;
                              });

                              try {
                                final newUser =
                                    await _auth.createUserWithEmailAndPassword(
                                        email: email, password: password);
                                if (newUser != null) {
                                  //Navigator.pushNamed(context, '/ Homepage');
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Homepage()));
                                }
                                setState(() {
                                  showSpinner = false;
                                });
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
                              ' Register  ',
                              style: GoogleFonts.montserrat(
                                color: Color.fromRGBO(100, 100, 100, 1),
                                fontSize: 18,
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
      ),
    );
  }
}
