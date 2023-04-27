import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';

class Donate extends StatefulWidget {
  const Donate({super.key});

  @override
  State<Donate> createState() => _DonateState();
}

class _DonateState extends State<Donate> {
  bool? _isCheck = false;

  final dishnameController = TextEditingController();
  final quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: Material(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
              //alignment: Alignment.topLeft,
              height: 610,
              width: 400,
              color: Color.fromARGB(255, 255, 255, 255),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          child: Container(
                            height: 180,
                            color: Color.fromARGB(240, 187, 98, 1),
                            width: 365,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, right: 150),
                                          child: Text(
                                            'Prajwal lokhande',
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
                                              top: 5, right: 50),
                                          child: Text(
                                              ' Lorem ipsum dolor sit amet,consectetur \n adipiscing elit. Odio et convallis euismod ',
                                              style: GoogleFonts.montserrat(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(
                                                    100, 100, 100, 1),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Material(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Container(
                                          height: 130,
                                          width: 280,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Column(
                                              children: [
                                                TextField(
                                                  controller:
                                                      dishnameController,
                                                  decoration: InputDecoration(
                                                      hintText:
                                                          'Enter dish name'),
                                                ),
                                                SizedBox(height: 10),
                                                TextField(
                                                  controller:
                                                      quantityController,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  decoration: InputDecoration(
                                                      hintText: 'Quantity'),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 40,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 40),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            CollectionReference collRef =
                                                FirebaseFirestore.instance
                                                    .collection('items');
                                            collRef.add({
                                              'dish_name':
                                                  dishnameController.text,
                                              'quantity':
                                                  quantityController.text,
                                            });
                                            dishnameController.clear();
                                            quantityController.clear();
                                          },
                                          style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 10),
                                            backgroundColor: Color.fromRGBO(
                                                248, 248, 247, 1),
                                            shape: StadiumBorder(),
                                          ),
                                          child: Text(
                                            '  Add ',
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    81, 146, 89, 1)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.only(left: 110),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text('Food details',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromRGBO(
                                                100, 100, 100, 1),
                                          )),
                                      SizedBox(width: 20),
                                      Text('   Quantity',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Color.fromRGBO(
                                                100, 100, 100, 1),
                                          )),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 10),
                                // Material(
                                //   color: Color.fromARGB(255, 255, 255, 255),
                                // child:
                                Container(
                                  height: 200,
                                  width: 250,
                                  child: StreamBuilder<QuerySnapshot>(
                                    stream: FirebaseFirestore.instance
                                        .collection('items')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      List<Row> itemWidgets = [];
                                      if (snapshot.hasData) {
                                        final items = snapshot
                                            .data?.docs.reversed
                                            .toList();
                                        for (var item in items!) {
                                          final itemWidget = Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  var collection =
                                                      FirebaseFirestore.instance
                                                          .collection('items');
                                                  collection
                                                      .doc(item.id)
                                                      .delete();
                                                },
                                                icon: Icon(
                                                  Icons.delete_outline,
                                                  color: Color.fromRGBO(
                                                      200, 92, 92, 1),
                                                ),
                                              ),
                                              Text(item['dish_name']),
                                              Text(item['quantity']),
                                            ],
                                          );
                                          itemWidgets.add(itemWidget);
                                        }
                                      }
                                      // else
                                      //   (Text('add list item above'));
                                      return Expanded(
                                        child: ListView(
                                          children: itemWidgets,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                // ),
                                SizedBox(height: 15),
                                Padding(
                                  padding: const EdgeInsets.only(right: 120),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 20,
                                        child: Material(
                                          child: Checkbox(
                                            //activeColor: Colors.greenAccent,
                                            value: _isCheck,
                                            onChanged: (val) {
                                              print(val);
                                              setState(() {
                                                _isCheck = val;
                                              });
                                            },
                                            // value: isCheck,
                                            // onChanged: (value) {
                                            //   setState(() {
                                            //     isCheck = value!;
                                            //     // (isCheck = value!)
                                            //     //     ? Color.fromRGBO(
                                            //     //         200, 92, 92, 0.6)
                                            //     //     : Color.fromRGBO(
                                            //     //         81, 146, 89, 1);
                                            //   });
                                            // },
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text('Non veg',
                                          style: GoogleFonts.montserrat(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            color:
                                                Color.fromRGBO(187, 72, 72, 1),
                                          ))
                                    ],
                                  ),
                                ),
                                SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.only(left: 40),
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        //
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        backgroundColor:
                                            Color.fromRGBO(240, 187, 98, 1),
                                        shape: StadiumBorder(),
                                      ),
                                      child: Text('Donate')),
                                )
                              ],
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
