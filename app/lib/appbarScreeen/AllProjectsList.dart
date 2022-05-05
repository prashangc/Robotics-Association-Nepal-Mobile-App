import 'package:app/state/details_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AllProjectsList extends StatefulWidget {
  const AllProjectsList({Key? key}) : super(key: key);

  @override
  State<AllProjectsList> createState() => _AllProjectsListState();
}

class _AllProjectsListState extends State<AllProjectsList> {
  bool _init = true;
  bool _isLoading = false;
  var size, height, width;
  @override
  void didChangeDependencies() async {
    if (_init) {
      _isLoading = await Provider.of<DetailsState>(context, listen: false)
          .getAllProjectTitles();
      setState(() {});
    }
    _init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final projectLists = Provider.of<DetailsState>(context).projectTitle;

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
          'Projects',
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
                itemCount: projectLists!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        // color: Colors.green,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: width,
                            height: 100.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  projectLists[index].projectIcon.toString(),
                                ),
                                fit: BoxFit.fill,
                              ),
                              color: Colors.blue,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15.0)),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            // color: Colors.red,
                            child: Text(
                              projectLists[index].projectName.toString(),
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
