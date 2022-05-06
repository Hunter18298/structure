import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe/drawer.dart';
import 'package:coffe/espresso.dart';
import 'package:coffe/model.dart';
import 'package:coffe/seasonal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDescription2 extends StatefulWidget {
  static const routeName = '/product_des2';
  ProductDescription2({Key? key}) : super(key: key);

  @override
  State<ProductDescription2> createState() => _ProductDescriptionState2();
}

class _ProductDescriptionState2 extends State<ProductDescription2> {
  @override
  getId() async {
    var product = ModalRoute.of(context)!.settings.arguments as String;
    products = product;
  }

  String? products;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    getId();

    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Color(0XFF4A403A),
        title: Text(
          'Seasonal Drink',
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.w600, color: Colors.black54),
        ),
        centerTitle: true,
        backgroundColor: Color(0XFFEFEFEF),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, Espresso.routeName);
          },
        ),
      ),
      endDrawer: DrawerCoffe(),
      body: StreamBuilder<DocumentSnapshot<Map>>(
        stream: FirebaseFirestore.instance
            .collection("/coffe/esbZ0ERJcNrk2LALGTjo/espresso")
            .doc(products)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            return SafeArea(
                child: Container(
              child: Column(
                children: [
                  SizedBox(
                    width: size.width,
                    height: size.height * 0.4,
                    child: ClipRRect(
                      child: Image.network(data['imageUrl']),
                    ),
                  ),
                  Text(data['name']),
                  Text(data['description']),
                  Text("Price:  " + data['price']),
                ],
              ),
            ));
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
