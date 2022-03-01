import 'package:flutter/material.dart';

import '../model/ProjectsModel.dart';

class Projects extends StatefulWidget {
  // const Projects({ Key? key }) : super(key: key);
  final ProjectsModel projects;
  const Projects(this.projects);

  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  widget.projects.projectIcons.toString(),
                ),
                fit: BoxFit.fill,
              ),
              color: Colors.green,
              borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            ),
          ),
          const SizedBox(height: 10.0),
          Center(
            child: GestureDetector(
              onTap: () {
                // Navigator.of(context).pushNamed(
                //     HospitalDetailsScreen.routeName,
                //     arguments: widget.hospitalsData.id!);
              },
              child: Text(
                widget.projects.title.toString(),
                // "${snapshot.data![index]['hospital_name'].substring(0, 6)}...",
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
