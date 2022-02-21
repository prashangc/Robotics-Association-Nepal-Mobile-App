import 'package:app/state/details_state.dart';
import 'package:app/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class ProgramsBottomNavigation extends StatefulWidget {
  const ProgramsBottomNavigation({Key? key}) : super(key: key);

  @override
  State<ProgramsBottomNavigation> createState() =>
      _ProgramsBottomNavigationState();
}

class _ProgramsBottomNavigationState extends State<ProgramsBottomNavigation> {
  bool _init = true;

  @override
  void didChangeDependencies() {
    if (_init) {
      Provider.of<DetailsState>(context, listen: false).getAllStatsDetails();
    }
    _init = false;
    super.didChangeDependencies();
  }

  // DetailsState titleService = DetailsState();
  @override
  Widget build(BuildContext context) {
    final statsDetailsServices =
        Provider.of<DetailsState>(context).statsDetails;
    return Scaffold(
      endDrawer: AppDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        toolbarHeight: 70.0,
        backgroundColor: Colors.red,
        elevation: 0.0,
        title: const Text("Programs"),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (ctx, i) {
          return Container(
            // color: Colors.red,
            child: StaggeredGridView.countBuilder(
              staggeredTileBuilder: (index) {
                if (index == 2) {
                  return const StaggeredTile.count(2, 1);
                }
                if (index == 3) {
                  return const StaggeredTile.count(2, 1);
                } else {
                  return const StaggeredTile.count(1, 1);
                }
              },
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              // childAspectRatio: (80.0 / 80.0),
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              itemCount: statsDetailsServices!.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.red,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10.0),
                      Text(statsDetailsServices[index].statsName.toString()),
                      Text(statsDetailsServices[index].statsValue.toString()),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );

    // Card(
    //   child: Text(screenTitles[0].title.toString()),
    // );
  }
}
