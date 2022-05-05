import 'package:app/model/ProgramModel.dart';
import 'package:app/screens/ProgramDetails.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridPrograms extends StatefulWidget {
  // const GridPrograms({ Key? key }) : super(key: key);
  final ProgramsModel programs;
  const GridPrograms(this.programs);

  @override
  State<GridPrograms> createState() => _GridProgramsState();
}

class _GridProgramsState extends State<GridPrograms> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(ProgramDetails.routeName,
            arguments: widget.programs.programID!);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          // color: Colors.green,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    widget.programs.programIcon.toString(),
                  ),
                  fit: BoxFit.fill,
                ),
                color: Colors.blue,
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              // color: Colors.red,
              child: Text(
                widget.programs.programName.toString(),
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
  }
}
