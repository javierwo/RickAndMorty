import 'package:flutter/material.dart';
import 'package:flutter_app_1/Pantallas/principal.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //material es un patrón de diseño de Google
    return MaterialApp(
      //para ocultar el banner de Debug
      debugShowCheckedModeBanner: false,
      title: 'R&M App',
      home: Principal(),
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          headline2: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 20,
            fontWeight: FontWeight.w100,
            color: Colors.grey[600],
          ),
          headline3: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.grey[600],
          ),
          headline4: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
