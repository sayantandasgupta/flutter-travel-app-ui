import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app_ui/travel/travel_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TravelPage(),
      theme: ThemeData(
        primaryColor: Colors.green,
        accentColor: Colors.greenAccent,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
    );
  }
}
