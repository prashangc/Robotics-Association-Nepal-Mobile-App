import 'package:app/GridContainer/gridServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../state/details_state.dart';

class AllServicesList extends StatefulWidget {
  static const routeName = "/AllServicesList-screen";
  const AllServicesList({Key? key}) : super(key: key);

  @override
  State<AllServicesList> createState() => _AllServicesListState();
}

class _AllServicesListState extends State<AllServicesList> {
  bool _init = true;
  bool _isLoading = false;

  var size, height, width;
  @override
  void didChangeDependencies() async {
    if (_init) {
      _isLoading = await Provider.of<DetailsState>(context, listen: false)
          .getAllServiceTitles();
      setState(() {});
    }
    _init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    final serviceLists = Provider.of<DetailsState>(context).serviceTitle;
    height = size.height;
    width = size.width;
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
          'Services',
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
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                    icon: const Icon(
                      Icons.add_business,
                      color: Colors.white,
                      size: 16.0,
                    ),
                    label: const Text(
                      'My Orders',
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                    onPressed: () {
                      print('Button Pressed');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
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
                    itemCount: serviceLists!.length,
                    itemBuilder: (context, index) {
                      return GridServices(serviceLists[index]);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
