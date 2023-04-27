import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Pickup extends StatefulWidget {
  const Pickup({super.key});

  @override
  State<Pickup> createState() => _PickupState();
}

class _PickupState extends State<Pickup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(81, 146, 89, 1),
        elevation: 10,
        title: Text(
          'Pick ups',
          style: GoogleFonts.montserrat(
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      //color: Color.fromARGB(221, 239, 118, 118),
                      height: 156,
                      width: 397,
                      // decoration: BoxDecoration(
                      //   boxShadow: [
                      //     BoxShadow(
                      //       color: Color.fromARGB(255, 247, 245, 245),
                      //       blurRadius: 6.0,
                      //       spreadRadius: 2.0,
                      //       offset: Offset(0.0, 0.0),
                      //     )
                      //   ],
                      // ),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 25, left: 125),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Text('Paneer Masala',
                                              style: GoogleFonts.montserrat(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    81, 146, 89, 1),
                                              )),
                                          SizedBox(width: 80),
                                          Text('2',
                                              style: GoogleFonts.montserrat(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                                color: Color.fromRGBO(
                                                    100, 100, 100, 1),
                                              )),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      Row(
                                        children: [
                                          Text('Chiken Kebab',
                                              style: GoogleFonts.montserrat(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    200, 92, 92, 0.6),
                                              )),
                                          SizedBox(width: 80),
                                          Text('10',
                                              style: GoogleFonts.montserrat(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                                color: Color.fromRGBO(
                                                    100, 100, 100, 1),
                                              )),
                                        ],
                                      ),
                                      SizedBox(width: 80, height: 30),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: 150),
                                            child: ElevatedButton(
                                                onPressed: () {},
                                                style: ElevatedButton.styleFrom(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 10),
                                                  backgroundColor:
                                                      Color.fromRGBO(
                                                          240, 187, 98, 1),
                                                  shape: StadiumBorder(),
                                                ),
                                                child: Text('cancel')),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 156,
                                width: 113,
                                color: Color.fromRGBO(200, 92, 92, 0.6),
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Quantity ',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              Color.fromRGBO(100, 100, 100, 1),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        '2',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 36,
                                          fontWeight: FontWeight.w800,
                                          color:
                                              Color.fromRGBO(100, 100, 100, 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
