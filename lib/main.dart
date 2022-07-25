import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calendar App',
      theme: ThemeData(fontFamily: GoogleFonts.sora().fontFamily),
      routes: {
        '/': (context) => const HomePage(),
      },
    );
  }
}
