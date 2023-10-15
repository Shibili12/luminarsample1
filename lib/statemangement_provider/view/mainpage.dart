import 'package:flutter/material.dart';
import 'package:luminarsample1/statemangement_provider/provider/movieprovider.dart';
import 'package:luminarsample1/statemangement_provider/view/wishlistpage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<Movieprovider>(
    create: (BuildContext context) => Movieprovider(),
    child: MaterialApp(
      home: Moviemainpage(),
    ),
  ));
}

class Moviemainpage extends StatelessWidget {
  const Moviemainpage({super.key});

  @override
  Widget build(BuildContext context) {
    var movies = context.watch<Movieprovider>().movies;
    var wishmovies = context.watch<Movieprovider>().moviewishlist;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Movies"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Wishlistscreen()));
            },
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: ((context, index) {
          final currentmovie = movies[index];
          return Card(
            child: ListTile(
              title: Text(currentmovie.title),
              subtitle: Text(currentmovie.time),
              trailing: IconButton(
                onPressed: () {
                  if (!wishmovies.contains(currentmovie)) {
                    context.read<Movieprovider>().addTowishlist(currentmovie);
                  } else {
                    context
                        .read<Movieprovider>()
                        .removefromwishlist(currentmovie);
                  }
                },
                icon: Icon(
                  Icons.favorite,
                  color: wishmovies.contains(currentmovie)
                      ? Colors.red
                      : Colors.white,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
