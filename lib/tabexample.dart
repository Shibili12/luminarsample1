import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Tabexample(),
  ));
}

class Tabexample extends StatelessWidget {
  const Tabexample({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.teal,
          title: const Text(
            "Whatsapp",
          ),
          actions: [
            const Icon(Icons.search),
            const Icon(Icons.camera_alt),
            PopupMenuButton(itemBuilder: (context) {
              return [
                const PopupMenuItem(child: Text("settings")),
              ];
            })
          ],
          bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              labelPadding: EdgeInsets.zero,
              tabs: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * .1,
                    child: const Icon(Icons.group)),
                SizedBox(
                    width: MediaQuery.of(context).size.width * .3,
                    child: const Text("Chat")),
                SizedBox(
                    width: MediaQuery.of(context).size.width * .3,
                    child: const Text("Status")),
                SizedBox(
                    width: MediaQuery.of(context).size.width * .3,
                    child: const Text("call")),
              ]),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text("community"),
            ),
            Center(
              child: Text("chat"),
            ),
            Center(
              child: Text("status"),
            ),
            Center(
              child: Text("call"),
            ),
          ],
        ),
      ),
    );
  }
}
