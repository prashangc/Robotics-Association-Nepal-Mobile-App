import 'dart:io';

import 'package:app/screens/FilesPage.dart';
import 'package:app/screens/OrderInvoice.dart';
import 'package:app/state/details_state.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class OrderPageSecond extends StatefulWidget {
  const OrderPageSecond({Key? key}) : super(key: key);

  @override
  State<OrderPageSecond> createState() => _OrderPageSecondState();
}

class _OrderPageSecondState extends State<OrderPageSecond> {
  void openFiles(List<PlatformFile> files) =>
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FilesPage(
                files: files,
                onOpenedFile: openFile,
              )));

  @override
  Widget build(BuildContext context) {
    var title = Provider.of<DetailsState>(context, listen: false)
        .titleServices
        .toString();
    var size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;
    final _form = GlobalKey<FormState>();

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
            children: [
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
                          return 'Enter order ID';
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
                          labelText: 'Order ID',
                          labelStyle: TextStyle(
                            fontSize: 15.0,
                            color: Color.fromARGB(255, 209, 209, 209),
                          )),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'Enter order requirement';
                        }
                        return null;
                      },
                      onSaved: (v) {
                        // _fullName = v;
                      },
                      cursorHeight: 22,
                      decoration: const InputDecoration(
                          labelText: 'Enter order requirement *',
                          labelStyle: TextStyle(
                            fontSize: 15.0,
                            color: Color.fromRGBO(209, 209, 209, 1),
                          )),
                    ),
                    const SizedBox(height: 25.0),
                    DottedBorder(
                      dashPattern: const [8, 10],
                      strokeWidth: 1.5,
                      strokeCap: StrokeCap.round,
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(5),
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        width: width,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.folder,
                              size: 50,
                            ),
                            const SizedBox(height: 15),
                            const Text(
                              'Upload files or attachments',
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                            const SizedBox(height: 15),
                            SizedBox(
                              width: width * 0.3,
                              height: 40,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.black,
                                  padding: const EdgeInsets.all(8.0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0)),
                                ),
                                onPressed: () async {
                                  final result = await FilePicker.platform
                                      .pickFiles(allowMultiple: true);
                                  if (result == null) return;
                                  final file = result.files.first;
                                  openFiles(result.files);

                                  print('Name: ${file.name}');
                                  print('Bytes: ${file.bytes}');
                                  print('Size: ${file.size}');
                                  print('Extension: ${file.extension}');
                                  print('Path: ${file.path}');

                                  final newFile =
                                      await saveFilePermanently(file);
                                  print('From path: ${file.path!}');
                                  print('To path: ${newFile.path}');
                                },
                                child: const Text(
                                  'Browse',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      validator: (v) {
                        if (v!.isEmpty) {
                          return 'Enter budget';
                        }
                        return null;
                      },
                      onSaved: (v) {
                        // _fullName = v;
                      },
                      cursorHeight: 22,
                      decoration: const InputDecoration(
                          labelText: 'Budget',
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
                      builder: (context) => const OrderInvoice()));
            },
            child: const Text(
              'Submit',
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

Future<File> saveFilePermanently(PlatformFile file) async {
  final appStorage = await getApplicationDocumentsDirectory();
  final newFile = File('${appStorage.path}/${file.name} ');
  return File(file.path!).copy(newFile.path);
}

void openFile(PlatformFile file) {
  OpenFile.open(file.path!);
}
