import 'package:flutter/material.dart';

class MembersPage extends StatefulWidget {
  const MembersPage({Key? key}) : super(key: key);
  static const routeName = '/ran-members-screen';

  @override
  State<MembersPage> createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  @override
  Widget build(BuildContext context) {
    // final id = ModalRoute.of(context)?.settings.arguments;
    // final post =
    //     Provider.of<DetailsState>(context).singlePost(int.parse(id.toString()));
    return Scaffold(
      appBar: AppBar(
        title: const Text("Members"),
      ),
      // body:
    );
    // return MaterialApp(
    //   home: Scaffold(
    //     appBar: AppBar(
    //       title: const Text("Members"),
    //     ),
    //     body: Container(
    //       width: 100,
    //       height: 100,
    //       color: Colors.red,
    //       child: ListView.builder(
    //         itemCount: 1,
    //         itemBuilder: (ctx, i) {
    //           return Expanded(
    //             // color: Colors.yellow,
    //             child: StaggeredGridView.countBuilder(
    //               staggeredTileBuilder: (index) {
    //                 return const StaggeredTile.count(1, 1.1);
    //               },

    //               // physics: const NeverScrollableScrollPhysics(),
    //               shrinkWrap: true,
    //               crossAxisCount: 3,
    //               mainAxisSpacing: 10.0,
    //               crossAxisSpacing: 10.0,
    //               itemCount: post.length,
    //               itemBuilder: (context, index) {
    //                 return Container(
    //                   decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(5.0),
    //                     color: Colors.white,
    //                   ),
    //                   child: Column(
    //                     // mainAxisAlignment: MainAxisAlignment.center,
    //                     children: [
    //                       Container(
    //                         margin: const EdgeInsets.all(5.0),
    //                         width: double.infinity,
    //                         height: 100.0,
    //                         decoration: BoxDecoration(
    //                           image: DecorationImage(
    //                             image: NetworkImage(
    //                               post.picture.toString(),
    //                             ),
    //                             fit: BoxFit.fill,
    //                           ),
    //                           color: Colors.green,
    //                           // borderRadius: const BorderRadius.all(
    //                           //     Radius.circular(5.0)),
    //                         ),
    //                       ),
    //                       Text(
    //                         post.name.toString(),
    //                         style: GoogleFonts.poppins(
    //                           textStyle: const TextStyle(
    //                             // fontWeight: FontWeight.bold,
    //                             fontSize: 14.0,
    //                             // letterSpacing: 0.5,
    //                             color: Colors.black,
    //                           ),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 );
    //               },
    //             ),
    //           );
    //         },
    //       ),
    //     ),
    //   ),
    // );
  }
}
