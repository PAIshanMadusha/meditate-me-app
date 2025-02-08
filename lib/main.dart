import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meditate_me_app/router/router_class.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "MeditateMe App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      routerConfig: RouterClass().router,
    );
  }
}
