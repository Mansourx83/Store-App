import 'package:flutter/material.dart';
import 'package:store_app/screens/home_page.dart';

void main() {
  runApp(StoreApp());
}

class StoreApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context) => HomePage(),
      },
      initialRoute: HomePage.id,
    );
  }
}
