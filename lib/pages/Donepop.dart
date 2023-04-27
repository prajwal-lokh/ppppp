import 'package:anna/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'hoteldetail.dart';
import 'homepage.dart';

class Thirdpop extends StatefulWidget {
  @override
  State<Thirdpop> createState() => _ThirdpopState();
}

class _ThirdpopState extends State<Thirdpop> {
  showDialogfunc(
      BuildContext context, String name, String imagesUrl, String desc) {
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: Material(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              //alignment: Alignment.topLeft,
              height: 600,
              width: 400,
              color: Color.fromARGB(255, 255, 255, 255),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),

                          child: Container(
                            height: 170,
                            color: Color.fromARGB(240, 187, 98, 1),
                            width: 365,
                          ),
                          // Image.network(
                          //   imagesUrl,
                          //   fit: BoxFit.cover,
                          //   height: 200,
                          // ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 2, right: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, right: 0),
                                            child: Text(
                                              'Hotel name',
                                              style: GoogleFonts.montserrat(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromRGBO(
                                                    100, 100, 100, 1),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, right: 55),
                                            child: Text(
                                              ' Lorem ipsum dolor sit amet,consectetur \n adipiscing elit. Odio et convallis euismod ',
                                              style: GoogleFonts.montserrat(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    100, 100, 100, 1),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 80),
                                  Center(
                                    child: Container(
                                      // width: 270,
                                      // height: 100,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 40),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text('Your Request Accepted !',
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Color.fromRGBO(
                                                          81, 146, 89, 1),
                                                    )),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 70),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 50),
                                                child: Text(
                                                    'Please do collect the parcel from \n                          counter',
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color.fromRGBO(
                                                          81, 146, 89, 1),
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 100),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 65),
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Homepage()),
                                                  (route) => false);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          backgroundColor:
                                              Color.fromRGBO(240, 187, 98, 1),
                                          shape: StadiumBorder(),
                                        ),
                                        child: Text(' Done ')),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
