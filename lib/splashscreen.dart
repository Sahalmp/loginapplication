import 'package:flutter/material.dart';
import 'package:loginapplication/homescreen.dart';
import 'package:loginapplication/loginscreen.dart';
import 'package:loginapplication/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkUserLoggedIn();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Image.asset(
        'assets/images/hello.gif',
        height: 125,
      )),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> gotologin() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => const LoginPage()));
  }

  checkUserLoggedIn() async {
    final _sharedpref = await SharedPreferences.getInstance();
    final _userLoggedIn = _sharedpref.getBool(savekeyname);
    (_userLoggedIn == null || _userLoggedIn == false)
        ? gotologin()
        : Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx1) => const HomeScreen()));
  }
}
