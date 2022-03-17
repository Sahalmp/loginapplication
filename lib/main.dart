import 'package:flutter/material.dart';
import 'package:loginapplication/splashscreen.dart';


const loginid = {'sahal':'123456','admin':'admin@123'};
const savekeyname = 'userLoggedIn';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const SplashScreen(),
    );
  }
}
