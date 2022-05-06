import 'package:coffe/coffe.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  static const routeName = '/Home';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: NetworkImage(
                "https://cdn.pixabay.com/photo/2020/01/22/12/36/coffe-4785229_960_720.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: size.height * 0.9),
          child: ElevatedButton(
            child: Text(
              "Go and get some coffee",
              style: GoogleFonts.robotoSlab(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            onPressed: () {
              Navigator.pushReplacementNamed(context, Coffee.routeName);
            },
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 41, 13, 3),
            ),
          ),
        ),
      ),
    );
  }
}
