import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../GridContainer/gridPrograms.dart';
import '../state/details_state.dart';

class AllProgramsList extends StatefulWidget {
  const AllProgramsList({Key? key}) : super(key: key);
  @override
  State<AllProgramsList> createState() => _AllProgramsListState();
}

class _AllProgramsListState extends State<AllProgramsList> {
  bool _init = true;
  bool _isLoading = false;
  var size, height, width;
  @override
  void didChangeDependencies() async {
    if (_init) {
      _isLoading = await Provider.of<DetailsState>(context, listen: false)
          .getAllProgramsTitles();
      setState(() {});
    }
    _init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final programsLists = Provider.of<DetailsState>(context).programTitle;

    height = height;
    width = width;
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'Programs',
          style: TextStyle(color: Colors.black, fontSize: 22.0),
        ),
        elevation: 0.2,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              // Navigator.of(context).pushNamed(FavouriteHospitals.routeName,
              // arguments: hospitalLists);
            },
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Container(
        width: width,
        height: height,
        color: Colors.grey[200],
        child: Container(
          margin: const EdgeInsets.all(13),
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            // border: Border.all(
            //   color: const Color.fromARGB(255, 224, 223, 223),
            // ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: StaggeredGridView.countBuilder(
              staggeredTileBuilder: (index) {
                return const StaggeredTile.count(1, 1.3);
              },
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 3,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              itemCount: programsLists!.length,
              itemBuilder: (context, index) {
                return GridPrograms(programsLists[index]);
              },
            ),
          ),
        ),
      ),
    );
  }
}
