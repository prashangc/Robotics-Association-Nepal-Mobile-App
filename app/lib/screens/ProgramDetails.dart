import 'package:app/state/details_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProgramDetails extends StatefulWidget {
  const ProgramDetails({Key? key}) : super(key: key);
  static const routeName = "/programDetails-screen";

  @override
  State<ProgramDetails> createState() => _ProgramDetailsState();
}

class _ProgramDetailsState extends State<ProgramDetails> {
  var size, height, width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;

    final programID = ModalRoute.of(context)?.settings.arguments;
    final programData = Provider.of<DetailsState>(context)
        .programsData(int.parse(programID.toString()));
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
        title: Text(
          programData!.programName.toString(),
          style: const TextStyle(color: Colors.black, fontSize: 22.0),
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
        child: Expanded(
          // width: width,
          // height: height,
          // color: Colors.red,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(13),
                width: width,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      programData.programCoverImage.toString(),
                    ),
                    fit: BoxFit.fill,
                  ),
                  color: Colors.blue,
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(13),
                padding: const EdgeInsets.symmetric(horizontal: 13),
                color: Colors.green,
                child: Text(
                  programData.objectives.toString(),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
