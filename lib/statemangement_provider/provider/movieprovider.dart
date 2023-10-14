import 'dart:math';

import 'package:flutter/material.dart';
import 'package:luminarsample1/statemangement_provider/model/movies.dart';

final List<Movies> movieList = List.generate(
  100,
  (index) => Movies(
    title: 'movie $index',
    time: '${Random().nextInt(100) + 60} minutes',
  ),
);

class Movieprovider extends ChangeNotifier {
  final List<Movies> _movie = movieList;
  List<Movies> get movies =>
      _movie; //value from _movie accessible through get property
  final List<Movies> _wishlist = [];
  List<Movies> get moviewishlist => _wishlist;

  void addTowishlist(Movies moviefrommainpage) {
    _wishlist.add(moviefrommainpage);
    notifyListeners();
  }

  void removefromwishlist(Movies removedmovie) {
    _wishlist.remove(removedmovie);
    notifyListeners();
  }
}
