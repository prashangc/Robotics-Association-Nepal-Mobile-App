import 'package:app/state/details_state.dart';
import 'package:app/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServicesBottomNavigation extends StatefulWidget {
  const ServicesBottomNavigation({Key? key}) : super(key: key);

  @override
  State<ServicesBottomNavigation> createState() =>
      _ServicesBottomNavigationState();
}

class _ServicesBottomNavigationState extends State<ServicesBottomNavigation> {
  bool _init = true;

  @override
  void didChangeDependencies() {
    if (_init) {
      // Provider.of<DetailsState>(context, listen: false).getImageByProvider();
    }
    _init = false;
    super.didChangeDependencies();
  }

  DetailsState imageService = DetailsState();
  @override
  Widget build(BuildContext context) {
    final screenImages = Provider.of<DetailsState>(context).imageSlider;
    return Scaffold(
      endDrawer: AppDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        toolbarHeight: 70.0,
        backgroundColor: Colors.red,
        elevation: 0.0,
        title: const Text("Services"),
      ),
      body: Container(
        color: Colors.green,
        child: ListView.builder(
            itemCount: screenImages!.length,
            itemBuilder: (ctx, i) {
              return Card(
                child: Image.network(
                  screenImages[i].pictures.toString(),
                ),
                // Text(screenTitles[i].title.toString()),
              );
            }),
      ),
    );
  }
}
