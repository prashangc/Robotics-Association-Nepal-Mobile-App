import 'package:app/widgets/login_tabView.dart';
import 'package:app/widgets/register_TabView.dart';
import 'package:flutter/material.dart';

class LoginRegisterScreen extends StatelessWidget {
  static const routeName = "/login-register-screen";
  const LoginRegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        // resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          toolbarHeight: 190.0,
          title: Image.asset(
            'assets/logo.png',
          ),
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.0),
                child: TabBar(
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(width: 5, color: Colors.black),
                    insets: EdgeInsets.symmetric(horizontal: 40),
                  ),
                  tabs: [
                    Tab(
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'REGISTER',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    LoginTabView(),
                    RegisterTabView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
