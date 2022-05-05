import 'package:app/screens/OrderPageSecond.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/details_state.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var title = Provider.of<DetailsState>(context, listen: false)
        .titleServices
        .toString();
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;

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
          title,
          style: const TextStyle(color: Colors.black, fontSize: 22.0),
        ),
        elevation: 0.2,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          // border: Border.all(
          //   color: const Color.fromARGB(255, 224, 223, 223),
          // ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                "Place your order here",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    fontFamily: 'Poppins'),
              ),
              const SizedBox(height: 10),
              Form(
                key: _form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 5),
                    TextFormField(
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'Enter your full name';
                        }
                        return null;
                      },
                      onSaved: (v) {
                        // _fullName = v;
                      },
                      cursorHeight: 22,
                      decoration: const InputDecoration(
                          // prefixIcon: Icon(
                          //   Icons.person,
                          //   color: Colors.black,
                          // ),
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.all(
                          //     Radius.circular(12.0),
                          //   ),
                          // ),
                          labelText: 'Full name *',
                          labelStyle: TextStyle(
                            fontSize: 15.0,
                            color: Color.fromARGB(255, 209, 209, 209),
                          )),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'Enter your phone number';
                        }
                        return null;
                      },
                      onSaved: (v) {
                        // _fullName = v;
                      },
                      cursorHeight: 22,
                      decoration: const InputDecoration(
                          labelText: 'Phone number *',
                          labelStyle: TextStyle(
                            fontSize: 15.0,
                            color: Color.fromARGB(255, 209, 209, 209),
                          )),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'Enter your email address';
                        }
                        return null;
                      },
                      onSaved: (v) {
                        // _fullName = v;
                      },
                      cursorHeight: 22,
                      decoration: const InputDecoration(
                          labelText: 'Email *',
                          labelStyle: TextStyle(
                            fontSize: 15.0,
                            color: Color.fromARGB(255, 209, 209, 209),
                          )),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'Enter your city name';
                        }
                        return null;
                      },
                      onSaved: (v) {
                        // _fullName = v;
                      },
                      cursorHeight: 22,
                      decoration: const InputDecoration(
                          labelText: 'City *',
                          labelStyle: TextStyle(
                            fontSize: 15.0,
                            color: Color.fromARGB(255, 209, 209, 209),
                          )),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'Enter your address line ';
                        }
                        return null;
                      },
                      onSaved: (v) {
                        // _fullName = v;
                      },
                      cursorHeight: 22,
                      decoration: const InputDecoration(
                          labelText: 'Address line *',
                          labelStyle: TextStyle(
                            fontSize: 15.0,
                            color: Color.fromARGB(255, 209, 209, 209),
                          )),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'Enter your zip code';
                        }
                        return null;
                      },
                      onSaved: (v) {
                        // _fullName = v;
                      },
                      cursorHeight: 22,
                      decoration: const InputDecoration(
                          labelText: 'Zip code',
                          labelStyle: TextStyle(
                            fontSize: 15.0,
                            color: Color.fromARGB(255, 209, 209, 209),
                          )),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'Enter your organization name';
                        }
                        return null;
                      },
                      onSaved: (v) {
                        // _fullName = v;
                      },
                      cursorHeight: 22,
                      decoration: const InputDecoration(
                          labelText: 'Organization name',
                          labelStyle: TextStyle(
                            fontSize: 15.0,
                            color: Color.fromARGB(255, 209, 209, 209),
                          )),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'Enter your VAT/PN No.';
                        }
                        return null;
                      },
                      onSaved: (v) {
                        // _fullName = v;
                      },
                      cursorHeight: 22,
                      decoration: const InputDecoration(
                          labelText: 'VAT/PAN No.',
                          labelStyle: TextStyle(
                            fontSize: 15.0,
                            color: Color.fromARGB(255, 209, 209, 209),
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        height: 50,
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
              // var serviceTitle = title.data;
              // context.read<DetailsState>().ServiceTitle(serviceTitle);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OrderPageSecond()));
            },
            child: const Text(
              'Next',
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
