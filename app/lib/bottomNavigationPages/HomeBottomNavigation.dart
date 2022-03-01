import 'package:app/state/details_state.dart';
import 'package:app/widgets/Projects.dart';
import 'package:app/widgets/app_drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/Programs.dart';
import '../widgets/Services.dart';
import '../widgets/Stats.dart';

class HomeBottomNavigation extends StatefulWidget {
  const HomeBottomNavigation({Key? key}) : super(key: key);

  @override
  State<HomeBottomNavigation> createState() => _HomeBottomNavigationState();
}

class _HomeBottomNavigationState extends State<HomeBottomNavigation> {
  bool _init = true;
  bool _isLoading = false;

  @override
  void didChangeDependencies() async {
    if (_init) {
      _isLoading = await Provider.of<DetailsState>(context, listen: false)
          .getAllServiceTitles();
      _isLoading = await Provider.of<DetailsState>(context, listen: false)
          .getAllProjectTitles();
      _isLoading = await Provider.of<DetailsState>(context, listen: false)
          .getAllProgramsTitles();
      setState(() {});
    }
    _init = false;
    super.didChangeDependencies();
  }

  // final services = List.generate(6, (index) => '$index');
  int activeIndex = 0;
  DetailsState imageAPIData = DetailsState();
  // DetailsState servicesAPIData = DetailsState();

  late List data;
  @override
  Widget build(BuildContext context) {
    final servicesLists = Provider.of<DetailsState>(context).serviceTitle;
    final projectsLists = Provider.of<DetailsState>(context).projectTitle;
    final programsLists = Provider.of<DetailsState>(context).programTitle;
    final statsLists = Provider.of<DetailsState>(context).statsDetails;

    if (_isLoading == false ||
        servicesLists == null ||
        projectsLists == null ||
        programsLists == null ||
        statsLists == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
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
        leading: const Icon(Icons.home, size: 40.0),
        iconTheme: const IconThemeData(color: Colors.black),
        toolbarHeight: 70.0,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "Home",
          style: GoogleFonts.poppins(
            textStyle: const TextStyle(
              // fontWeight: FontWeight.bold,
              fontSize: 28.0,
              letterSpacing: 0.5,
              color: Colors.black,
            ),
          ),
          // TextStyle(
          //   fontSize: 25.0,
          //   letterSpacing: 1.0,
          //   color: Colors.black,
          // ),
        ),
      ),
      body: Container(
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15.0),
                FutureBuilder<List>(
                  future: imageAPIData.getImageSliderData(),
                  builder: (context, snapshot) {
                    // print(snapshot.data);
                    var actualImages = snapshot.data!;
                    if (snapshot.hasData) {
                      return Stack(
                        children: [
                          CarouselSlider.builder(
                            options: CarouselOptions(
                                height: 220.0,
                                // enlargeCenterPage: true,
                                autoPlay: true,
                                aspectRatio: 16 / 9,
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enableInfiniteScroll: true,
                                autoPlayAnimationDuration:
                                    const Duration(milliseconds: 800),
                                viewportFraction: 1,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    activeIndex = index;
                                  });
                                }),
                            itemCount: actualImages.length,
                            itemBuilder: (context, index, realIndex) {
                              return Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      actualImages[index]['pictures']
                                          .toString(),
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20.0)),
                                ),
                              );
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 195.0),
                                child: AnimatedSmoothIndicator(
                                  activeIndex: activeIndex,
                                  count: snapshot.data!.length,
                                  effect: const ExpandingDotsEffect(
                                    activeDotColor: Colors.indigo,
                                    dotColor: Colors.grey,
                                    dotWidth: 14.0,
                                    dotHeight: 14.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    } else {
                      return const Center(
                        child: Text(
                          'No Images found for image slider',
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(height: 12.0),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                  child: Container(
                    width: double.infinity,
                    height: 160.0,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 0,
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 0.0),
                          child: Text(
                            'Top Services',
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
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 0.0),
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: servicesLists.length,
                                itemBuilder: (ctx, i) {
                                  return Services(servicesLists[i]);
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                  child: Container(
                    width: double.infinity,
                    height: 160.0,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 0,
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 0.0),
                          child: Text(
                            'Top Projects',
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
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 0.0),
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: projectsLists.length,
                                itemBuilder: (ctx, i) {
                                  return Projects(projectsLists[i]);
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                  child: Container(
                    width: double.infinity,
                    height: 160.0,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 0,
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 0.0),
                          child: Text(
                            'Top Programs',
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
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 0.0),
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: programsLists.length,
                                itemBuilder: (ctx, i) {
                                  return Programs(programsLists[i]);
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                  child: Container(
                    width: double.infinity,
                    height: 500.0,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 0,
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 0.0),
                          child: Text(
                            'Stats',
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
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 0.0),
                            child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                // scrollDirection: Axis.horizontal,
                                itemCount: statsLists.length,
                                itemBuilder: (ctx, i) {
                                  return Stats(statsLists[i]);
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget buildGridView() {
  //   return Container(
  //       // color: Colors.red,
  //       child: FutureBuilder<List>(
  //           future: servicesAPIData.getAllServiceTitles(),
  //           builder: (context, snapshot) {
  //             if (snapshot.hasData) {
  //               var actualGrid = snapshot.data!;
  //               return GridView.builder(
  //                   physics: const NeverScrollableScrollPhysics(),
  //                   shrinkWrap: true,
  //                   gridDelegate:
  //                       const SliverGridDelegateWithFixedCrossAxisCount(
  //                     childAspectRatio: (80.0 / 60.0),
  //                     // childAspectRatio: MediaQuery.of(context).size.width /
  //                     //     (MediaQuery.of(context).size.height / 6),

  //                     crossAxisCount: 2,
  //                     mainAxisSpacing: 10.0,
  //                     crossAxisSpacing: 10.0,
  //                   ),
  //                   padding: const EdgeInsets.all(8.0),
  //                   itemCount: actualGrid.length,
  //                   itemBuilder: (context, index) {
  //                     return Container(
  //                       decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(15.0),
  //                         color: Colors.white,
  //                       ),
  //                       child: Column(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: [
  //                           const Icon(Icons.ac_unit, size: 50.0),
  //                           const SizedBox(height: 10.0),
  //                           Text(
  //                             snapshot.data![index]['title'].toString(),
  //                             style: const TextStyle(
  //                               fontSize: 20.0,
  //                               color: Colors.black,
  //                             ),
  //                           ),
  //                         ],
  //                       ),
  //                     );
  //                   });
  //             } else {
  //               return const Center(
  //                 child: Text(
  //                   'No data found',
  //                 ),
  //               );
  //             }
  //           }));
  // }

}
