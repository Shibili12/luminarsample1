import 'package:flutter/material.dart';

class Transaction extends StatelessWidget {
  String transactionid;
  String date;
  String npr;
  Transaction({
    required this.transactionid,
    required this.date,
    required this.npr,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 10,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
      ),
      title: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "CWDR/",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              transactionid,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      subtitle: Text(date),
      trailing: Text(
        npr,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
