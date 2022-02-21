import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ProfileWidget extends StatefulWidget {
  final String imagePath;
  final VoidCallback onClicked;

  const ProfileWidget({
    Key? key,
    required this.imagePath,
    required this.onClicked,
  }) : super(key: key);

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: [
        buildImage(),
        Positioned(
          bottom: 0,
          right: 2,
          child: buildEditIcon(context),
        ),
      ]),
    );
  }

  Widget buildImage() {
    // final image = NetworkImage(imagePath);
    return GestureDetector(
      onTap: widget.onClicked,
      child: ClipOval(
        child: Material(
          color: Colors.transparent,
          child: Column(
            children: [
              image != null
                  ? Image.file(
                      image!,
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.cover,
                    )
                  : Image.network(widget.imagePath),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEditIcon(BuildContext context) => buildCircle(
        color: Colors.white,
        all: 3,
        child: GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: ((builder) => bottomSheet()),
            );
          },
          child: buildCircle(
            color: Colors.black,
            all: 8,
            child: const Icon(
              Icons.image,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );

  Widget bottomSheet() => Container(
        height: 100.0,
        // width: MediaQuery.of(context).size.width,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          children: <Widget>[
            const Text(
              'Choose Profile Photo',
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.camera),
                  label: const Text('Camera'),
                ),
                ElevatedButton.icon(
                  onPressed: () => pickImage(),
                  icon: const Icon(Icons.image),
                  label: const Text('Gallery'),
                )
              ],
            ),
          ],
        ),
      );
}
