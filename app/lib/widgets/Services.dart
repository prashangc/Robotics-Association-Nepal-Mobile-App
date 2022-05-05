import 'package:app/screens/ServicesDetails.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/ServicesModel.dart';
import '../state/details_state.dart';

class Services extends StatefulWidget {
  // const Services({Key? key}) : super(key: key);
  final ServicesModel services;
  const Services(this.services);

  @override
  _ServicesState createState() => _ServicesState(services: services);
}

class _ServicesState extends State<Services> {
  final ServicesModel services;
  _ServicesState({required this.services});
  var image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var serviceImage = image;
        context.read<DetailsState>().ServiceImage(serviceImage);

        Navigator.of(context).pushNamed(ServicesDetails.routeName,
            arguments: widget.services.servicesID!);
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
                    image = widget.services.serviceIcon.toString(),
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
                  widget.services.serviceName.toString(),
                  // "${snapshot.data![index]['hospital_name'].substring(0, 6)}...",
                  style: const TextStyle(
                    fontSize: 16.0,
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
