import 'dart:convert';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:http/http.dart' as http;
import 'package:gif_app_example/routes/giphy_api.dart';

class GiphyBloc extends BlocBase {

  GiphyBloc() {
    getGifs();
  }

  String _search = '';
  // ignore: unnecessary_getters_setters
  String get search => _search;

  int _offset = 0;
  // ignore: unnecessary_getters_setters
  int get offset => _offset;

  Future<Map> getGifs() async {
    http.Response response;

    if(_search == null || _search.isEmpty){
      _search = 'starwars';
      response = await http.get(GiphyApi.routeOne + GiphyApi().getText(_search, _offset));
    } else {
      response = await http.get(GiphyApi.routeOne + GiphyApi().getText(_search, _offset));
    }

    return json.decode(response.body);
  }


}