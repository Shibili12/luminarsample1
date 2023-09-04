import 'package:flutter/material.dart';
import 'package:luminarsample1/moneymanageui/likesection.dart';
import 'package:luminarsample1/moneymanageui/profilesection.dart';
import 'package:luminarsample1/moneymanageui/transactionsection.dart';

void main() {
  runApp(MaterialApp(
    home: Uiexample(),
  ));
}

class Uiexample extends StatelessWidget {
  const Uiexample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text("Welcome SHIBILI"),
          leading: Icon(Icons.menu),
          actions: [Icon(Icons.money_off_csred_outlined)],
        ),
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    height: 200,
                    child: Stack(
                      children: [
                        Container(
                          height: 60,
                          color: Colors.red,
                        ),
                        Positioned(
                          top: 20,
                          left: 20,
                          right: 20,
                          child: Profilescetion(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.ac_unit,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "WOULD YOU LIKE TO?",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Likesection(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.ac_unit,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "LAST TRANSACTIONS",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Transaction(
                      transactionid: "954683459864756",
                      date: "10-9-2023",
                      npr: "NPR.1,00000",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Transaction(
                      transactionid: "954683459864756",
                      date: "11-10-2023",
                      npr: "NPR.2,00000",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Transaction(
                      transactionid: "954683459864756",
                      date: "10-9-2023",
                      npr: "NPR.1,00000",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
