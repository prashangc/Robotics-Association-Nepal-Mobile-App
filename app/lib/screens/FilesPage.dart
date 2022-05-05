import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FilesPage extends StatefulWidget {
  final List<PlatformFile> files;
  final ValueChanged<PlatformFile> onOpenedFile;

  const FilesPage({
    Key? key,
    required this.files,
    required this.onOpenedFile,
  }) : super(key: key);
  @override
  State<FilesPage> createState() => _FilesPageState();
}

class _FilesPageState extends State<FilesPage> {
  @override
  Widget build(BuildContext context) {
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
          "All Files",
          style: TextStyle(color: Colors.black, fontSize: 22.0),
        ),
        elevation: 0.2,
      ),
      body: Center(
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                crossAxisSpacing: 8, mainAxisSpacing: 8, maxCrossAxisExtent: 2),
            itemCount: widget.files.length,
            itemBuilder: (context, index) {
              final file = widget.files[index];
              return buildFile(file);
            }),
      ),
    );
  }
}

Widget buildFile(PlatformFile file) {
  final kb = file.size / 1024;
  final mb = kb / 1024;
  final fileSize = mb >= 1 ? mb.toStringAsFixed(2) : kb.toStringAsFixed(2);
  final extension = file.extension ?? 'none';
  // final color = getColor(extension);
  const color = Colors.red;

  return GestureDetector(
    // onTap:() =>
    // widget.onOpenedFile(file),

    child: Container(
      padding: const EdgeInsets.all(8),
      child: Column(children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '.$extension',
              style: const TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          file.name,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          fileSize,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        )
      ]),
    ),
  );
}
