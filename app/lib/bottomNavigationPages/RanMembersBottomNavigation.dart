import 'package:app/widgets/MemberDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../state/details_state.dart';
import '../widgets/app_drawer.dart';

class RanMembersBottomNavigation extends StatefulWidget {
  const RanMembersBottomNavigation({Key? key}) : super(key: key);

  @override
  _RanMembersBottomNavigationState createState() =>
      _RanMembersBottomNavigationState();
}

class _RanMembersBottomNavigationState
    extends State<RanMembersBottomNavigation> {
  bool _init = true;
  bool _isLoading = false;

  @override
  void didChangeDependencies() async {
    if (_init) {
      _isLoading = await Provider.of<DetailsState>(context, listen: false)
          .getAllMembersDetails();
      _isLoading = await Provider.of<DetailsState>(context, listen: false)
          .getAllYearsDetails();

      setState(() {});
    }
    _init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final membersList = Provider.of<DetailsState>(context).membersDetails;
    final yearsList = Provider.of<DetailsState>(context).yearDetails;

    // if (_isLoading == false || membersList == null || yearsList == null) {
    //   return const Scaffold(
    //     body: Center(child: CircularProgressIndicator()),
    //   );
    // }

    return Scaffold(
      endDrawer: AppDrawer(),
      appBar: AppBar(
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(
                Icons.menu,
                size: 30.0,
              ),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
        leading: const Icon(FontAwesomeIcons.image, size: 30.0),
        iconTheme: const IconThemeData(color: Colors.black),
        toolbarHeight: 70.0,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "RAN Family",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              // fontWeight: FontWeight.bold,
              fontSize: 28.0,
              letterSpacing: 0.5,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        color: const Color.fromRGBO(238, 238, 238, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(
            //   width: double.infinity,
            //   height: 48.0,
            //   child: ListView.builder(
            //       scrollDirection: Axis.horizontal,
            //       itemCount: yearsList!.length,
            //       itemBuilder: (ctx, i) {
            //         return GestureDetector(
            //           onTap: () {
            //             print("navigated");
            //             // Navigator.of(context).push(MaterialPageRoute(
            //             //     builder: (context) => const MembersPage()));
            //             Navigator.of(context).pushNamed(MembersPage.routeName,
            //                 arguments: membersList![i].membershipID);
            //           },
            //           child: Padding(
            //             padding: const EdgeInsets.all(3.0),
            //             child: Card(
            //               shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(20.0),
            //               ),
            //               // color: Theme.of(context).colorScheme.secondary,
            //               color: Colors.white,
            //               child: Padding(
            //                 padding: const EdgeInsets.symmetric(
            //                     vertical: 8.0, horizontal: 12.0),
            //                 child: Text(
            //                   yearsList[i].year.toString(),
            //                   style: const TextStyle(
            //                     fontSize: 15.0,
            //                     fontWeight: FontWeight.bold,
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ),
            //         );
            //       }),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Executive Members",
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    letterSpacing: 0.5,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (ctx, i) {
                    return Expanded(
                      // color: Colors.yellow,
                      child: StaggeredGridView.countBuilder(
                        staggeredTileBuilder: (index) {
                          return const StaggeredTile.count(1, 1.3);
                        },
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        itemCount: membersList!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const CupertinoAlertDialog();
                                  });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: Colors.white,
                              ),
                              child: Expanded(
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(5.0),
                                      width: double.infinity,
                                      height: 120.0,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            membersList[index].pic.toString(),
                                          ),
                                          fit: BoxFit.fill,
                                        ),
                                        color: Colors.red,
                                        // borderRadius: const BorderRadius.all(
                                        //     Radius.circular(5.0)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 25.0,
                                        color: Colors.white,
                                        child: Text(
                                          '${membersList[index].name.toString()} aasaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                              // fontWeight: FontWeight.bold,
                                              fontSize: 12.0,
                                              // letterSpacing: 0.5,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void CustomDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) {
        return const MemberDetails();
      });
}
