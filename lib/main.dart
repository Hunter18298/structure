import 'package:coffe/coffe.dart';
import 'package:coffe/espresso.dart';
import 'package:coffe/home_screen.dart';
import 'package:coffe/login_screen.dart';
import 'package:coffe/model.dart';
import 'package:coffe/product_des1.dart';
import 'package:coffe/product_desc2.dart';
import 'package:coffe/registration_screen.dart';
import 'package:coffe/seasonal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CoffeData>(create: (context) => CoffeData([])),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: LoginScreen(),
        ),
        routes: {
          Home.routeName: (context) => Home(),
          Coffee.routeName: (context) => Coffee(),
          SeasonalDrink.routeName: (context) => SeasonalDrink(),
          ProductDescription.routeName: (context) => ProductDescription(),
          Espresso.routeName: (context) => Espresso(),
          ProductDescription2.routeName: (context) => ProductDescription2(),
          RegistrationScreen.id: (context) => RegistrationScreen(),
        },
      ),
    );
  }
}
