import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../model/ServicesModel.dart';
import '../screens/ServicesDetails.dart';
import '../state/details_state.dart';

class GridServices extends StatefulWidget {
  // const GridServices({ Key? key }) : super(key: key);
  final ServicesModel services;
  const GridServices(this.services);

  @override
  State<GridServices> createState() => _GridServicesState();
}

class _GridServicesState extends State<GridServices> {
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
                    image = widget.services.serviceIcon.toString(),
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
                widget.services.serviceName.toString(),
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
