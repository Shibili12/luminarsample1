import 'package:flutter/material.dart';
import 'package:luminarsample1/statemangement_provider/provider/movieprovider.dart';
import 'package:provider/provider.dart';

class Wishlistscreen extends StatelessWidget {
  const Wishlistscreen({super.key});

  @override
  Widget build(BuildContext context) {
    var wishmovies = context.watch<Movieprovider>().moviewishlist;
    return Scaffold(
      body: ListView.builder(
        itemCount: wishmovies.length,
        itemBuilder: (context, index) {
          final wishmovie = wishmovies[index];
          return Card(
            child: ListTile(
              title: Text(wishmovie.title),
              subtitle: Text(wishmovie.time),
              trailing: TextButton(
                onPressed: () {
                  context.read<Movieprovider>().removefromwishlist(wishmovie);
                },
                child: Text("remove"),
              ),
            ),
          );
        },
      ),
    );
  }
}
