import 'package:coffe/coffe.dart';
import 'package:coffe/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerCoffe extends StatelessWidget {
  DrawerCoffe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      backgroundColor: Color(0XFF4A403A),
      child: Column(
        children: [
          SizedBox(
            width: size.width,
            height: size.height * 0.25,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, Coffee.routeName);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.home_filled,
                  color: Color(0XFFEFEFEF),
                  size: size.height * 0.025,
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                Text(
                  "Home",
                  style: GoogleFonts.roboto(
                      color: Color(0XFFEFEFEF),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.06,
          ),
          GestureDetector(
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, LoginScreen.id);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.logout,
                  color: Color(0XFFEFEFEF),
                  size: size.height * 0.025,
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                Text(
                  "Sign Out",
                  style: GoogleFonts.roboto(
                      color: Color(0XFFEFEFEF),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
