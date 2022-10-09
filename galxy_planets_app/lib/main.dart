import 'package:flutter/material.dart';

import 'pages/details_screen_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'HomePage',
    routes: {
      'HomePage': (context) => const HomePage(),
      'DetailScreenPage': (context) => const DetailScreenPage()
    },
  ));
}
