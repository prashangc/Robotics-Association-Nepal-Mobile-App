import 'package:app/screens/ProgramDetails.dart';
import 'package:app/screens/ProjectDetails.dart';
import 'package:app/screens/ServicesDetails.dart';
import 'package:app/screens/home_screen.dart';
import 'package:app/screens/login_register_screen.dart';
import 'package:app/state/details_state.dart';
import 'package:app/widgets/MembersPage.dart';
import 'package:app/widgets/login_tabView.dart';
import 'package:app/widgets/register_TabView.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocalStorage storage = LocalStorage("usertoken");
    return ChangeNotifierProvider(
      create: (ctx) => DetailsState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'RAN App',
        theme: ThemeData(
          canvasColor: Colors.grey[200],
          primarySwatch: Colors.blue,
        ),
        home: FutureBuilder(
            future: storage.ready,
            builder: (context, snapshop) {
              if (snapshop.data == null) {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (storage.getItem('token') == null) {
                return const LoginRegisterScreen();
              }
              return const HomeScreen();
            }),
        routes: {
          HomeScreen.routeName: (ctx) => const HomeScreen(),
          LoginRegisterScreen.routeName: (ctx) => const LoginRegisterScreen(),
          LoginTabView.routeName: (ctx) => const LoginTabView(),
          RegisterTabView.routeName: (ctx) => const RegisterTabView(),
          MembersPage.routeName: (ctx) => const MembersPage(),
          ProjectDetails.routeName: (ctx) => const ProjectDetails(),
          ServicesDetails.routeName: (ctx) => const ServicesDetails(),
          ProgramDetails.routeName: (ctx) => const ProgramDetails(),
        },
      ),
    );
  }
}
