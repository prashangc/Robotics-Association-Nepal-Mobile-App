import 'package:app/screens/ProgramDetails.dart';
import 'package:flutter/material.dart';

import '../model/ProgramModel.dart';

class Programs extends StatefulWidget {
  // const Programs({ Key? key }) : super(key: key);
  final ProgramsModel programs;
  const Programs(this.programs);
  @override
  _ProgramsState createState() => _ProgramsState();
}

class _ProgramsState extends State<Programs> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(ProgramDetails.routeName,
            arguments: widget.programs.programID!);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    widget.programs.programIcon.toString(),
                  ),
                  fit: BoxFit.fill,
                ),
                color: Colors.green,
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              ),
            ),
            const SizedBox(height: 10.0),
            Center(
              child: Text(
                widget.programs.programName.toString(),
                // "${snapshot.data![index]['hospital_name'].substring(0, 6)}...",
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
