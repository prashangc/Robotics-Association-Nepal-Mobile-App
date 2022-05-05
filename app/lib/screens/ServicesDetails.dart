import 'package:app/screens/OrderPage.dart';
import 'package:app/state/details_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServicesDetails extends StatefulWidget {
  static const routeName = "/servicesDetails-screen";
  const ServicesDetails({Key? key}) : super(key: key);

  @override
  State<ServicesDetails> createState() => _ServicesDetailsState();
}

class _ServicesDetailsState extends State<ServicesDetails> {
  var title;
  var size, height, width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    height = size.height;
    width = size.width;
    final servicesID = ModalRoute.of(context)?.settings.arguments;
    final serviceData = Provider.of<DetailsState>(context)
        .servicesData(int.parse(servicesID.toString()));
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
        title: title = Text(
          serviceData!.serviceName.toString(),
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
        child: Container(
          width: width,
          height: height,
          color: Colors.grey[200],
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(13),
                width: width,
                height: height * 0.25,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      serviceData.serviceCoverImage.toString(),
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

                width: width,
                // color: Colors.pink,
                child: Text(
                  serviceData.serviceDescription.toString(),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        height: 45,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              padding: const EdgeInsets.all(8.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
            ),
            onPressed: () {
              var serviceTitle = title.data;
              context.read<DetailsState>().ServiceTitle(serviceTitle);

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const OrderPage()));
            },
            child: const Text(
              'Order now',
              style: TextStyle(
                fontSize: 22.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
