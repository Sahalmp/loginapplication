import 'package:flutter/material.dart';
import 'package:loginapplication/details.dart';
import 'package:loginapplication/loginscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          ElevatedButton(
            onPressed: () {
              signout(context);
            },
            child: const Text('SignOut'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.separated(
          itemBuilder: ((context, index) => ListTile(
                title: Text(
                  details.keys.elementAt(index),
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                leading: getimage(index),
              )),
          separatorBuilder: ((context, index) => const Divider(
                color: Colors.white,
              )),
          itemCount: details.length,
        ),
      ),
    );
  }

  getimage(index) {
    if (index % 2 == 0) {
      return Image.asset(
        details.values.elementAt(index),
        height: 100,
      );
    } else {
      return CircleAvatar(
        backgroundImage: AssetImage(details.values.elementAt(index)),
      );
    }
  }

  signout(BuildContext ctx) async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.clear();
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => const LoginPage()),
        (route) => false);
  }
}
