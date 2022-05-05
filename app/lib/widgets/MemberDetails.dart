import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/details_state.dart';

class MemberDetails extends StatefulWidget {
  const MemberDetails({Key? key}) : super(key: key);

  @override
  State<MemberDetails> createState() => _MemberDetailsState();
}

class _MemberDetailsState extends State<MemberDetails> {

  @override
  Widget build(BuildContext context) {
       final id = ModalRoute.of(context)?.settings.arguments;
    final data = Provider.of<DetailsState>(context)
        .singlePost(int.parse(id.toString()));

    return Dialog(
      
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisSize: MainAxisSize.min, children: const [
          SizedBox(height: 12.0),
          Text("data"),
          SizedBox(height: 12.0),
          Text("data"),
        ]),
      ),
    );
  }
}
