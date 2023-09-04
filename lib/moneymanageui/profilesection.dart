import 'package:flutter/material.dart';

class Profilescetion extends StatelessWidget {
  const Profilescetion({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        height: 150,
        width: 370,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                    "https://media.istockphoto.com/id/1368477551/photo/young-smiling-athlete-in-public-park.webp?b=1&s=170667a&w=0&k=20&c=59cxu-A1da3kSyduzj7bMoub48vr_8yi8RyNlfoKFO8="),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Mohammed Shibili kp",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "NPR. 1,00,999.35",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  Text(
                    "200020312414941",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
