import 'package:flutter/material.dart';
import 'package:appeggsize/pages/homepage.dart';
import 'package:appeggsize/pages/splashpage.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eggSize',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        fontFamily: 'Mitr',
      ),
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        SplashScreen.routeName:(context) => const SplashScreen()
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}

