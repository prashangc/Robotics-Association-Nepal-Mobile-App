import 'package:flutter/material.dart';

import '../model/ServicesModel.dart';

class Services extends StatefulWidget {
  // const Services({Key? key}) : super(key: key);
  final ServicesModel services;
  const Services(this.services);

  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
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
                  widget.services.icons.toString(),
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
                widget.services.title.toString(),
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
