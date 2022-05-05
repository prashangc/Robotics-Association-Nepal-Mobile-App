import 'package:app/appbarScreeen/AllProgramsList.dart';
import 'package:app/appbarScreeen/AllProjectsList.dart';
import 'package:app/appbarScreeen/Collaborators.dart';
import 'package:app/appbarScreeen/Gallery.dart';
import 'package:app/bottomNavigationPages/HomeBottomNavigation.dart';
import 'package:app/bottomNavigationPages/RanMembersBottomNavigation.dart';
import 'package:app/screens/login_register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:localstorage/localstorage.dart';

import '../appbarScreeen/AboutUs.dart';
import '../appbarScreeen/AllServicesList.dart';

class AppDrawer extends StatefulWidget {
  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    LocalStorage storage = LocalStorage("usertoken");
    _logoutnow() {
      storage.clear();
      Navigator.of(context).pushReplacementNamed(LoginRegisterScreen.routeName);
    }

    return SafeArea(
      child: Container(
        color: Colors.white,
        width: 280.0,
        height: double.infinity,
        child: ListView(children: [
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/logo.png'),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HomeBottomNavigation()),
              );
            },
            leading: SvgPicture.asset('assets/home.svg'),
            title: const Text(
              "Home",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AllServicesList()),
              );
            },
            leading: SvgPicture.asset('assets/home.svg'),
            title: const Text(
              "Services",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AllProgramsList()),
              );
            },
            leading: SvgPicture.asset('assets/home.svg'),
            title: const Text(
              "Programs",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AllProjectsList()),
              );
            },
            leading: SvgPicture.asset('assets/home.svg'),
            title: const Text(
              "Projects",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Gallery()),
              );
            },
            leading: SvgPicture.asset('assets/home.svg'),
            title: const Text(
              "Gallery",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RanMembersBottomNavigation()),
              );
            },
            leading: SvgPicture.asset('assets/home.svg'),
            title: const Text(
              "RAN Family",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Collaborators()),
              );
            },
            leading: SvgPicture.asset('assets/home.svg'),
            title: const Text(
              "Collaborators",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutUs()),
              );
            },
            leading: SvgPicture.asset('assets/home.svg'),
            title: const Text(
              "About Us",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          const Spacer(),
          ListTile(
            onTap: () {},
            leading: SvgPicture.asset('assets/home.svg'),
            title: const Text(
              "Settings",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          ListTile(
            onTap: () {
              _logoutnow();
            },
            leading: const Icon(
              Icons.logout,
              size: 28.0,
              color: Colors.black,
            ),
            title: const Text(
              "Logout",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ]),
      ),
    );
  }
}
