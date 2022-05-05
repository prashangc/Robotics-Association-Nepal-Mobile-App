import 'package:app/bottomNavigationPages/BlogFeedsBottomNavigation.dart';
import 'package:app/bottomNavigationPages/HomeBottomNavigation.dart';
import 'package:app/bottomNavigationPages/NotificationsBottomNavigation.dart';
import 'package:app/bottomNavigationPages/ProgramsBottomNavigation.dart';
import 'package:app/bottomNavigationPages/RanMembersBottomNavigation.dart';
import 'package:app/state/details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    const RanMembersBottomNavigation(),
    const ProgramsBottomNavigation(),
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
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: SvgPicture.asset('assets/home.svg'),
          ),
          BottomNavigationBarItem(
            label: 'Gallery',
            icon: SvgPicture.asset('assets/gallery.svg'),
          ),
          BottomNavigationBarItem(
            label: 'Blog',
            icon: SvgPicture.asset('assets/blog.svg'),
          ),
          BottomNavigationBarItem(
            label: 'Projects',
            icon: SvgPicture.asset('assets/projects.svg'),
          ),
          const BottomNavigationBarItem(
            label: 'Menu',
            icon: Icon(
              Icons.menu,
              size: 28.0,
            ),
          ),
        ],
      ),
    );
  }
}
