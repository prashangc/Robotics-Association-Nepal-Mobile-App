import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/details_state.dart';

class OrderInvoice extends StatefulWidget {
  const OrderInvoice({Key? key}) : super(key: key);

  @override
  State<OrderInvoice> createState() => _OrderInvoiceState();
}

class _OrderInvoiceState extends State<OrderInvoice> {
  @override
  Widget build(BuildContext context) {
    var title = Provider.of<DetailsState>(context, listen: false)
        .titleServices
        .toString();
    var image = Provider.of<DetailsState>(context, listen: false)
        .imageServices
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
        title: const Text(
          "Order Invoice",
          style: TextStyle(color: Colors.black, fontSize: 22.0),
        ),
        elevation: 0.2,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Image(image: AssetImage('assets/logo.png')),
              const Divider(
                color: Colors.black,
              ),
              Container(
                width: width,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        // color: Colors.yellow,
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          image: DecorationImage(
                            image: NetworkImage(image),
                            fit: BoxFit.fill,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 199, 199, 199),
                              blurRadius: 3,
                            ),
                          ],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                          // border: Border.all(
                          //   color: const Color.fromARGB(255, 224, 223, 223),
                          // ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        color: Colors.white,
                        width: 200,
                        // height: 60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              // '${widget.hospitalsData.hospitalDetail.toString().substring(0, 200)}...',

                              '$title Service',
                              style: const TextStyle(fontSize: 20),
                            ),
                            const SizedBox(height: 5.0),
                            Row(
                              children: const [
                                Text("2022-03-31"),
                                SizedBox(width: 15),
                                Text("12:45 PM"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 15.0),
                  Container(
                      color: const Color.fromARGB(255, 248, 218, 255),
                      padding: const EdgeInsets.all(8),
                      child: const Text(
                        'SUBMITTED',
                        style: TextStyle(color: Colors.purple, fontSize: 11.0),
                      )),
                  const SizedBox(width: 10.0),
                  Container(
                      color: const Color.fromARGB(255, 252, 218, 218),
                      padding: const EdgeInsets.all(8),
                      child: const Text('UNPAID',
                          style: TextStyle(color: Colors.red, fontSize: 11.0)))
                ],
              ),
              const SizedBox(height: 10.0),
              const Divider(color: Colors.black),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    width: 150,
                    height: height / 6.5,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Order ID:', style: TextStyle(fontSize: 15)),
                        SizedBox(height: 2.0),
                        Text('08743F4R6',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        SizedBox(height: 8.0),
                        Text('Phone:', style: TextStyle(fontSize: 15)),
                        SizedBox(height: 2.0),
                        Text('9840308344', style: TextStyle(fontSize: 15))
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    width: 150,
                    height: height / 6.5,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Order By:', style: TextStyle(fontSize: 15)),
                        SizedBox(height: 2.0),
                        Text('Prashanna GC', style: TextStyle(fontSize: 15)),
                        SizedBox(height: 8.0),
                        Text('Email:', style: TextStyle(fontSize: 15)),
                        SizedBox(height: 2.0),
                        Text('prashannagc00@gmail.com',
                            style: TextStyle(fontSize: 15))
                      ],
                    ),
                  )
                ],
              ),
              const Divider(color: Colors.black),
              const Text('Order Requirements:', style: TextStyle(fontSize: 15)),
              const SizedBox(height: 5),
              SizedBox(
                width: width,
                child: const Text(
                  "Please select one of the payment gateway to proceed the appointment booking. For any issues regarding the payment gateways, contact us at support@ran.com.",
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: const [
                  Text('Budget Estimation:', style: TextStyle(fontSize: 15)),
                  SizedBox(width: 5),
                  Text('\$450',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
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
            onPressed: () {},
            child: const Text(
              'Save PDF',
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
