import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:portal_film/api/endpoints.dart';
import 'package:portal_film/modal_class/credits.dart';
import 'package:portal_film/modal_class/genres.dart';
import 'package:portal_film/modal_class/movie.dart';

import '../api/endpoints.dart';
import 'credits.dart';
import 'genres.dart';
import 'movie.dart';

Future<List<Movie>> fetchMovies(String api) async {
  MovieList movieList;
  var res = await http.get(Uri.parse(api));
  var decodeRes = jsonDecode(res.body);
  movieList = MovieList.fromJson(decodeRes);
  return movieList.movies ?? [];
}

Future<Credits> fetchCredits(String api) async {
  Credits credits;
  var res = await http.get(Uri.parse(api));
  var decodeRes = jsonDecode(res.body);
  credits = Credits.fromJson(decodeRes);
  return credits;
}

Future<GenresList> fetchGenres() async {
  GenresList genresList;
  var res = await http.get(Uri.parse(Endpoints.genresUrl()));
  var decodeRes = jsonDecode(res.body);
  genresList = GenresList.fromJson(decodeRes);
  return genresList;
}
