import 'package:app/bottomNavigationPages/BlogFeedsBottomNavigation.dart';
import 'package:app/bottomNavigationPages/HomeBottomNavigation.dart';
import 'package:app/bottomNavigationPages/NotificationsBottomNavigation.dart';
import 'package:app/bottomNavigationPages/ProgramsBottomNavigation.dart';
import 'package:app/bottomNavigationPages/ServicesBottomNavigation.dart';
import 'package:app/state/details_state.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/home-screen";
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DetailsState titleService = DetailsState();
  int _currentIndex = 0;
  final screens = [
    const HomeBottomNavigation(),
    const ProgramsBottomNavigation(),
    const ServicesBottomNavigation(),
    const BlogFeedBottomNavigation(),
    const NotificationsBottomNavigation(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: IndexedStack(
          //indexStack keeps the state of other page active even during the page switch
          index: _currentIndex,
          children: screens,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() {
          _currentIndex = index;
        }),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 35.0,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(FontAwesomeIcons.home),
          ),
          BottomNavigationBarItem(
            label: 'Programs',
            icon: Icon(FontAwesomeIcons.th),
          ),
          BottomNavigationBarItem(
            label: 'Services',
            icon: Icon(FontAwesomeIcons.servicestack),
          ),
          BottomNavigationBarItem(
            label: 'Blog-Feeds',
            icon: Icon(FontAwesomeIcons.fileAlt),
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            label: 'Notifications',
            icon: Icon(FontAwesomeIcons.bell),
          )
        ],
      ),
    );
  }
}
