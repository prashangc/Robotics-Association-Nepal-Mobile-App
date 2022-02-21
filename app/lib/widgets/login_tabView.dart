import 'package:app/screens/home_screen.dart';
import 'package:app/state/details_state.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginTabView extends StatefulWidget {
  static const routeName = "/login-tab-view-screen";
  const LoginTabView({Key? key}) : super(key: key);

  @override
  State<LoginTabView> createState() => _LoginTabViewState();
}

class _LoginTabViewState extends State<LoginTabView> {
  final _form = GlobalKey<FormState>();
  String? _username;
  String? _password;

  void _loginNow() async {
    var isValid = _form.currentState?.validate();
    if (!isValid!) {
      //if not valid / if empty)
      return;
    }
    _form.currentState?.save();
    bool islogin = await Provider.of<DetailsState>(context, listen: false)
        .loginNow(_username.toString(), _password.toString());
    if (!islogin) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      // Navigator.of(context).pushReplacementNamed(const HomeScreen().routeName);
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                "Please provide correct credentials.",
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Ok",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(35.0, 30.0, 35.0, 0.0),
          child: Form(
            key: _form,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: TextFormField(
                    validator: (v) {
                      if (v!.isEmpty) {
                        return 'Enter your Username';
                      }
                      return null;
                    },
                    onSaved: (v) {
                      _username = v;
                    },
                    cursorHeight: 22,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      labelText: 'Username',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: TextFormField(
                    validator: (v) {
                      if (v!.isEmpty) {
                        return 'Enter your password';
                      }
                      return null;
                    },
                    onSaved: (v) {
                      _password = v;
                    },
                    obscureText: true,
                    cursorHeight: 22,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: Icon(Icons.remove_red_eye_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      labelText: 'Password',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    SizedBox(
                      width: 1.0,
                    ),
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 15.0,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      padding: const EdgeInsets.all(8.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      _loginNow();
                    },
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'OR',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                FontAwesomeIcons.facebook,
                size: 35.0,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                FontAwesomeIcons.google,
                size: 35.0,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                FontAwesomeIcons.twitter,
                size: 35.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
