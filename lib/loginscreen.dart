import 'package:flutter/material.dart';
import 'package:loginapplication/homescreen.dart';
import 'package:loginapplication/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _isDataMatched = true;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Color.fromARGB(255, 110, 110, 110)],
              stops: [0.0, 1.0],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              tileMode: TileMode.repeated,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 200,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        Text(
                          'Login',
                          style: GoogleFonts.mcLaren(
                            textStyle: const TextStyle(
                                color: Colors.white, fontSize: 35),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(color: Colors.white),
                      ),
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        label: Text(
                          'User Name',
                          style: TextStyle(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.white,
                        )),
                      ),
                      validator: (value) {
                        return (value == null || value.isEmpty)
                            ? 'Username cannot be empty'
                            : null;
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        label: Text(
                          'password',
                          style: TextStyle(color: Colors.white),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      validator: (value) {
                        return (value == null || value.isEmpty)
                            ? 'Password cannot be empty'
                            : null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Visibility(
                      visible: !_isDataMatched,
                      child: const Text(
                        'User name Pasword does not match',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              (_formkey.currentState!.validate())
                                  ? loginCheck(context)
                                  : null;
                            },
                            icon: const Icon(
                              Icons.login,
                            ),
                            label: const Text('Login'),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void loginCheck(BuildContext ctx) async {
    final _username = _usernameController.text;
    final _password = _passwordController.text;
    if (loginid[_username] == _password) {
      final _sharedPrefs = await SharedPreferences.getInstance();
      await _sharedPrefs.setBool(savekeyname, true);

      Navigator.of(ctx).pushReplacement(
          MaterialPageRoute(builder: (ctx1) => const HomeScreen()));
    } else {
      setState(() {
        _isDataMatched = false;
      });
    }
  }
}
