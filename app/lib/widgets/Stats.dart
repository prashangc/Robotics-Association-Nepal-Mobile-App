import 'package:flutter/material.dart';

import '../model/StatsModel.dart';

class Stats extends StatefulWidget {
  // const Stats({ Key? key }) : super(key: key);
  final StatsModel stats;
  const Stats(this.stats);
  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(1.0, 5, 1.0, 20.0),
      child: Container(
        width: double.infinity,
        height: 90.0,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        widget.stats.statsIcons.toString(),
                      ),
                      fit: BoxFit.fill,
                    ),
                    color: Colors.green,
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  widget.stats.statsValue.toString(),
                  style: const TextStyle(
                    fontSize: 26.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5.0),
            Center(
              child: Text(
                widget.stats.statsName.toString(),
                // "${snapshot.data![index]['hospital_name'].substring(0, 6)}...",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
