import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

void main() {
  runApp(MaterialApp(
    home: Readmoreless(),
  ));
}

class Readmoreless extends StatelessWidget {
  const Readmoreless({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Read more"),
      ),
      body: Column(
        children: [
          ReadMoreText(
            "Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.",
            trimLines: 2,
            preDataText: 'Haiii',
            preDataTextStyle:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            style: TextStyle(color: Colors.green, fontSize: 20),
            colorClickableText: Colors.red,
            trimMode: TrimMode.Line,
          ),
          Divider(
            thickness: 3,
          ),
          ReadMoreText(
            "Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.",
            trimLines: 2,
            preDataText: 'Haiii',
            preDataTextStyle:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            style: TextStyle(color: Colors.purple, fontSize: 20),
            colorClickableText: Colors.deepOrange,
            trimMode: TrimMode.Line,
          ),
        ],
      ),
    );
  }
}
