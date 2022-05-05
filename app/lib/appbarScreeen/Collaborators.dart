import 'package:flutter/material.dart';

class Collaborators extends StatefulWidget {
  const Collaborators({Key? key}) : super(key: key);

  @override
  State<Collaborators> createState() => _CollaboratorsState();
}

class _CollaboratorsState extends State<Collaborators> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Collaborators"),
      ),
    );
  }
}
