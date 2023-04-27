import 'package:anna/pages/Donatepage.dart';
import 'package:anna/pages/Donepop.dart';
import 'package:anna/pages/Drawerpage.dart';
import 'package:anna/pages/hoteldetail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  static const String id = 'Home_screen';
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;

  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final User = await _auth.currentUser;
      if (User != null) {
        loggedInUser = User;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  static List url = [
    "https://s3-alpha-sig.figma.com/img/f1b9/df80/55c6e031a7f3574eb08ae89781f4429d?Expires=1682899200&Signature=hcCvpiLMgJmkhnApxOPOudFLPYGRRVNzqBvAy04thQ6urPoBOPNeH1kuihIW8yM06Xaq5mt6lAXFi2MUVykbk4TqEw1si7SqqHz6kvdN8Ll0frwF-QCweFk2abdSlpXI-Yj3n9fdj61QefH-2j5fc7ZkW2LvY6zqCq8W0Iu9XYnG62HvDDxFaOiGDmfg3dB019PnAS6QLn2DziPPZ4hiKm810wUHYh5xiZ7k61adso8~k3bC7FXMsQBhIV21dv-68ZU~6vIw3A1jVsFv2T-wMwvUDSu0nIsNuC8Zk4xhgOI2QlHpVCIh9BfgVcdwe6N5y0ALWE8xNfmgVHRjSTk8Ww__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
    "https://s3-alpha-sig.figma.com/img/9637/99e6/3f0cad38e58cf842798c9be72c11e291?Expires=1682899200&Signature=VO5RSiDSXYxAXFW2bokcPKHsn-EFa9OTtKrRctO0r-~gXHjRrDMNLTNynDUlt8WFbgG5Jg6V-Y~~LT~KicTHJvmd--0psMGql0yHVSgrgjbsKwcwEqidLo5~uh2JK6caPpmjT9vyaCsG6c~JiH9vDER1-ladWM6hk9a0Lm7A4V841dxyM3A2lbvcL7afcL3~ri7tpOx-6L-atv7N26XHiTyuem1iOLZbJ4JFPG-cxBSIIaa4oko3ar6Yl1HCT28aQYSuQx~Vm3duL7x4iRqfcfD4U7nJlLnCu8ANcOuI9rZTSTIYLWCQN6ZgHPGPinbDq4yikmrjxRHIUfukN8I23w__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
    "https://s3-alpha-sig.figma.com/img/d73d/72e0/23879f98f373ddfbc48017990a1d4f37?Expires=1682899200&Signature=Vrsd5ujCImIcpN2DM1tEQAyj86gZ~qb-riXAqNr7OrDj53KI1FNv~TB-Iir7stJCOjo5l1XUgV4SbBiUCCoi1NOfOReVRPylMbrqI0z4Yy8Z1P2BsH7KFR9VJb4YivW~ve5Yp5LWVlGcIp0GT2-G4cRbJMWGUtZKvMzqvgA9Ahooi5WGeOEgFxS7GBD4vIxp2c31XF9QYQefcUjDlxd7EVnam3aEJ62JAXbNTrOKnOSvXBhuAuvCvmKL1M-hOzYkUjXyP1KEHliNSdJsPwbYJQKVv1TWZuQ8vPVPlWWv3X0vYBH4kgZYSH~fqG9iqvMJE~O~QHlAGXysnyn8iwoZ1g__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
    "https://s3-alpha-sig.figma.com/img/6c6a/0d35/a1cffa21b0a781278f5503a1e288b24e?Expires=1682899200&Signature=I38~TE6VElYqUGUfnxfbpToc0sHGAyLQfjsyrRbGm6LAr~1YZSM3g9A6SD7j3i5TY65DS-lj9rUE2ppQd4zIa1nE5Ngn9VNqZVsxZP7fbiuFlqE8vAH9OyTsyWHV3ukVXwlZ~x~WPh4vIbVpLlkUtenRNdLdOTG-cKtjqGjHZs7HxRk-Tcc3Mc6FFSRUwLrwJEhzghVBFNFS4FQ8N9rU4Pc1W7kHKAu55btwaHz2D8TIyZoUFQEBqCZQPIRzzqUASg1DSYU8E-CEVLPhYYzW6Wwn~trUXqmXkdCSrKlOWfdy8W2ddi7WdfTuzml~B3dD1VNelyurS-Hyo-8HxIfEBw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
  ];

  static List Hname = [
    "  Hotel Green Leaf",
    "  Hotel Marina",
    "  Hotel Pacific",
    "  Hotel The Park",
  ];

  // static List Hdesc = [
  //   ' Lorem ipsum dolor sit amet, \n consectetur adipiscing elit. \nOdio et convallis euismod '
  // ];

  final List<Hoteldata> Hdata = List.generate(
      Hname.length,
      (index) => Hoteldata('${Hname[index]}', '${url[index]}',
          ' Lorem ipsum dolor sit amet,consectetur \n adipiscing elit. Odio et convallis euismod '));

  var valuesecond = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: const [
                Opendrawer(),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(81, 146, 89, 1),
        elevation: 10,
        title: Text(
          'Anna Chatra',
          style: GoogleFonts.montserrat(
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          Row(
            children: [
              Text(
                'Denote',
                style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => Donate());
                },
                icon: Icon(Icons.fastfood),
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: Hdata.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: [
                        Container(
                          height: 280,
                          width: 396,
                          //color: Colors.blueGrey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 17),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 155, left: 125),
                                    child: Text(
                                      Hdata[index].name,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(100, 100, 100, 1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 90, right: 1),
                                    child: Text(
                                      Hdata[index].desc,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color.fromRGBO(100, 100, 100, 1),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 320),
                                    child: ElevatedButton(
                                        onPressed: () {
                                          showDialogfunc(
                                              context,
                                              Hdata[index].name,
                                              Hdata[index].ImagesUrl,
                                              Hdata[index].desc);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 10),
                                          backgroundColor:
                                              Color.fromRGBO(240, 187, 98, 1),
                                          shape: StadiumBorder(),
                                        ),
                                        child: Text('View')),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 280,
                          width: 112,
                          color: Color.fromRGBO(178, 234, 112, 0.6),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(padding: EdgeInsets.all(80)),
                              Text(
                                'Quantity ',
                                style: GoogleFonts.montserrat(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(100, 100, 100, 1),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '2',
                                style: GoogleFonts.montserrat(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w800,
                                  color: Color.fromRGBO(100, 100, 100, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 170,
                          color: Colors.blue,
                          width: double.infinity,
                          child: Image.network(Hdata[index].ImagesUrl,
                              fit: BoxFit.cover),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future showDialogfunc(
      BuildContext context, String name, String imagesUrl, String desc) {
    return showDialog(
        context: context,
        builder: (context) {
          var checkbox = true;
          return Padding(
            padding: const EdgeInsets.all(30),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        child: Image.network(
                          imagesUrl,
                          fit: BoxFit.cover,
                          height: 200,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            name,
                            style: GoogleFonts.montserrat(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(100, 100, 100, 1),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              desc,
                              style: GoogleFonts.montserrat(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(100, 100, 100, 1),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text('Food details',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(100, 100, 100, 1),
                                    )),
                                SizedBox(width: 60),
                                Text('Quantity',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(100, 100, 100, 1),
                                    )),
                              ],
                            ),
                            SizedBox(height: 40),
                            Row(
                              children: [
                                Text('Paneer Masala',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(81, 146, 89, 1),
                                    )),
                                SizedBox(width: 80),
                                Text('2',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(100, 100, 100, 1),
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
                                      color: Color.fromRGBO(200, 92, 92, 0.6),
                                    )),
                                SizedBox(width: 80),
                                Text('10',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(100, 100, 100, 1),
                                    )),
                              ],
                            ),
                            SizedBox(height: 50),
                            Row(
                              children: [
                                Text('Available',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(100, 100, 100, 1),
                                    )),
                                SizedBox(width: 100),
                                Row(
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 20,
                                      child: Material(
                                        child: Checkbox(
                                          value: true,
                                          onChanged: ((value) {
                                            setState(() {
                                              value = value!;
                                            });
                                          }),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 70),
                            Padding(
                              padding: const EdgeInsets.only(left: 50),
                              child: Row(
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        backgroundColor:
                                            Color.fromRGBO(248, 248, 247, 1),
                                        shape: StadiumBorder(),
                                      ),
                                      child: Text(
                                        'Cancel',
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                240, 187, 98, 1)),
                                      )),
                                  SizedBox(width: 30),
                                  ElevatedButton(
                                      onPressed: () {
                                        showDialogfun(
                                          context,
                                          name,
                                          imagesUrl,
                                          desc,
                                        );
                                        // showDialog(
                                        //     context: context,
                                        //     builder: (BuildContext context) =>
                                        //         Thirdpop());
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        backgroundColor:
                                            Color.fromRGBO(240, 187, 98, 1),
                                        shape: StadiumBorder(),
                                      ),
                                      child: Text(
                                        'Pick up',
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

Future showDialogfun(
    BuildContext context, String name, String imagesUrl, String desc) {
  return showDialog(
    context: context,
    builder: (context) {
      bool? checKit = false;

      return Padding(
        padding: const EdgeInsets.all(30),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: Image.network(
                      imagesUrl,
                      fit: BoxFit.cover,
                      height: 200,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(100, 100, 100, 1),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          desc,
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(100, 100, 100, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, right: 20, left: 40),
                    child: Row(
                      children: [
                        Text(
                          "    Your Request Accepted !",
                          style: GoogleFonts.montserrat(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(81, 146, 89, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, right: 10, left: 20),
                    child: Row(
                      children: [
                        Text(
                          "  Please do collect the parcel from\n                           counter",
                          style: GoogleFonts.montserrat(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(81, 146, 89, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 70),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => Homepage()),
                            (route) => false);
                      },
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        backgroundColor: Color.fromRGBO(240, 187, 98, 1),
                        shape: StadiumBorder(),
                      ),
                      child: Text('Done')),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
