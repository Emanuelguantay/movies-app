import 'dart:async';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:movies_app/src/models/film_model.dart';

class FilmProvider{
  String _apiKey    = '90748164264e82ca7dcf296f2201a9c2';
  String _url       = 'api.themoviedb.org';
  String _language  = 'es-ES';
  int _popularPage = 0;

  List<Film> _popular = new List();

  final _popularStreamController = StreamController<List<Film>>.broadcast();

  Function(List<Film>) get popularSink => _popularStreamController.sink.add;
  Stream<List<Film>> get popularStream => _popularStreamController.stream;

  void disposeStream(){
    _popularStreamController?.close();
  }


  Future<List<Film>> _processFilmResponse(Uri url) async{
    final resp = await http.get( url );
    final decodedData = json.decode(resp.body);

    final films = new Films.fromJsonList(decodedData['results']);

    return films.items;
  }


  Future<List<Film>> getFilmsInCinema() async{
    final url = Uri.https(_url, '3/movie/now_playing',{
      'api_key' : _apiKey,
      'language'  : _language,
    });

    // final resp = await http.get( url );
    // final decodedData = json.decode(resp.body);

    // final films = new Films.fromJsonList(decodedData['results']);

    // return films.items;
    return await _processFilmResponse(url);
  }

  Future<List<Film>> getPopular() async{
    _popularPage ++;
    final url = Uri.https(_url, '3/movie/popular',{
      'api_key' : _apiKey,
      'language'  : _language,
      'page' : _popularPage.toString(),
    });

    // final resp = await http.get( url );
    // final decodedData = json.decode(resp.body);

    // final films = new Films.fromJsonList(decodedData['results']);
    final resp = await _processFilmResponse(url);

    _popular.addAll(resp);

    popularSink(_popular);

    return resp;
  }

}