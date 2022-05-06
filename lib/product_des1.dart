import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe/drawer.dart';
import 'package:coffe/model.dart';
import 'package:coffe/seasonal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductDescription extends StatefulWidget {
  static const routeName = '/product_des';
  ProductDescription({Key? key}) : super(key: key);

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
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
            Navigator.pushReplacementNamed(context, SeasonalDrink.routeName);
          },
        ),
      ),
      endDrawer: DrawerCoffe(),
      body: StreamBuilder<DocumentSnapshot<Map>>(
        stream: FirebaseFirestore.instance
            .collection("/coffe/esbZ0ERJcNrk2LALGTjo/seasonal")
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
        // body: SafeArea(
        //   child: FutureBuilder<DocumentSnapshot>(
        //       future: FirebaseFirestore.instance
        //           .collection("/coffe/esbZ0ERJcNrk2LALGTjo/seasonal")
        //           .doc(product)
        //           .get(),
        //       builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        //         if (snapshot.hasData) {
        //           return GridView.builder(
        //               scrollDirection: Axis.vertical,
        //               gridDelegate:
        //                   const SliverGridDelegateWithMaxCrossAxisExtent(
        //                 maxCrossAxisExtent: 300,
        //                 crossAxisSpacing: 10,
        //                 childAspectRatio: 2.0,
        //                 mainAxisExtent: 150,
        //                 mainAxisSpacing: 10,
        //               ),
        //               itemCount: snapshot.data!.id,
        //               itemBuilder: (context, i) {
        //                 // final data = snapshot.data!.docs[i];

        //                 return GestureDetector(
        //                   onTap: () {
        //                     Navigator.pushNamed(
        //                         context, ProductDescription.routeName,
        //                         arguments: data.toString());
        //                   },
        //                   child: Container(
        //                     margin: EdgeInsets.all(8.0),
        //                     alignment: Alignment.center,
        //                     height: 200,
        //                     decoration: BoxDecoration(
        //                       borderRadius: BorderRadius.circular(20.0),
        //                       color: Colors.black,
        //                       image: DecorationImage(
        //                         image: NetworkImage(data['imageUrl'].toString()),
        //                         fit: BoxFit.cover,
        //                       ),
        //                     ),
        //                     child: Column(
        //                       children: [
        //                         Text(
        //                           data['name'].toString(),
        //                           style: GoogleFonts.roboto(
        //                             color: Colors.white,
        //                             fontWeight: FontWeight.bold,
        //                             fontSize: 20,
        //                           ),
        //                         ),
        //                       ],
        //                     ),
        //                   ),
        //                 );
        //               });
        //         }
        //         return const CircularProgressIndicator();
        //       }),
        // ),
      ),
    );
  }
}
