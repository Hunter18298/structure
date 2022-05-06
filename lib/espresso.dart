import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe/coffe.dart';
import 'package:coffe/drawer.dart';
import 'package:coffe/model.dart';
import 'package:coffe/product_des1.dart';
import 'package:coffe/product_desc2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Espresso extends StatelessWidget {
  static const routeName = '/espresso';
  Espresso({Key? key}) : super(key: key);
  final _firebase = FirebaseFirestore.instance
      .collection("/coffe/esbZ0ERJcNrk2LALGTjo/espresso")
      .snapshots();

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<CoffeData>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Color(0XFF4A403A),
        title: Text(
          'Espresso',
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.w600, color: Colors.black54),
        ),
        centerTitle: true,
        backgroundColor: Color(0XFFEFEFEF),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, Coffee.routeName);
          },
        ),
      ),
      endDrawer: DrawerCoffe(),
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
            stream: _firebase,
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      crossAxisSpacing: 10,
                      childAspectRatio: 2.0,
                      mainAxisExtent: 150,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, i) {
                      final data = snapshot.data!.docs[i];

                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, ProductDescription2.routeName,
                              arguments: data.id);
                        },
                        child: Container(
                          margin: EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.black,
                            image: DecorationImage(
                              image: NetworkImage(data['imageUrl'].toString()),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Text(
                            data['name'].toString(),
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                            ),
                          ),
                        ),
                      );
                    });
              }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}
