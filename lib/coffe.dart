import 'package:coffe/drawer.dart';
import 'package:coffe/espresso.dart';
import 'package:coffe/model.dart';
import 'package:coffe/seasonal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Coffee extends StatelessWidget {
  Coffee({Key? key}) : super(key: key);
  static const routeName = '/coffee';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Color(0XFF4A403A),
        title: Text(
          'Menu',
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.w600, color: Colors.black54),
        ),
        centerTitle: true,
        backgroundColor: Color(0XFFEFEFEF),
      ),
      endDrawer: DrawerCoffe(),
      body: SafeArea(
        child: Center(
          child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: NetworkImage(
                    "https://img.freepik.com/free-photo/fresh-coffee_172251-157.jpg?w=996"),
                fit: BoxFit.cover,
              ),
            ),
            child: ListView(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SeasonalDrink.routeName);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    margin: EdgeInsets.only(
                        top: size.height * 0.06,
                        left: size.width * 0.02,
                        right: size.width * 0.02),
                    child: Container(
                      width: size.width * 0.6,
                      height: size.height * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.black,
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://img.freepik.com/free-psd/composition-paper-coffee-cup-with-coffee-splash_23-2148995383.jpg?t=st=1651370024~exp=1651370624~hmac=50fe0593ca35576402e5e627115337bc2872d6d05666b4f70b7179134a58db4d&w=996"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Seasonal Drinks",
                          style: GoogleFonts.roboto(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color(0XFFEFEFEF)),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Espresso.routeName);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    margin: EdgeInsets.only(
                        top: size.height * 0.06,
                        left: size.width * 0.02,
                        right: size.width * 0.02),
                    child: Container(
                      width: size.width * 0.6,
                      height: size.height * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.black,
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://cdn.pixabay.com/photo/2018/08/01/19/55/coffee-3578014_960_720.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Espresso Drinks",
                          style: GoogleFonts.roboto(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Color(0XFFEFEFEF)),
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  margin: EdgeInsets.only(
                      top: size.height * 0.06,
                      left: size.width * 0.02,
                      right: size.width * 0.02),
                  child: Container(
                    width: size.width * 0.6,
                    height: size.height * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.black,
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://cdn.pixabay.com/photo/2021/04/25/01/01/cake-6205331_960_720.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Pasta",
                        style: GoogleFonts.roboto(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0XFFEFEFEF)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
