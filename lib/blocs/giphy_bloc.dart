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

  /// Usaria firebase como backend de exemplo.
  // final _firebaseInstance = Firestore.instance;

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

  // ignore: unnecessary_getters_setters
  set search(String value) {
    _search = value;
  }

  // ignore: unnecessary_getters_setters
  set offset(int value) {
    _offset = value;
  }

  ///
  ///  usando firebase como backend
  ///  o Criar e update metodo deveria retornar 'DocumentReference' e o gifData model
  ///  para retorner o return await _firebaseInstance.collection('gifs').add(model.toJson());
  ///
  ///

  // Future<DocumentReference> addNewGif(GifData model) async {
  //   if(model.id == null){
  //     return await _firebaseInstance.collection('gifs').add(model.toJsonFirebase());
  //     Get.offAll(HomeScreen());
  //   } else {
  //     DocumentReference get firestoreRef => firestore.document('gifs/$model.id');
  //     return await firestoreRef.updateData(model.toJsonFirebase());
  //     Get.offAll(HomeScreen());
  //   }
  //
  // }

  ///
  ///  usando firebase como backend
  ///  o Deletar metodo - Primeiro procuro o Id do documento atravez de um Collection reference
  ///  com o id do gif chamado no bloc é só chamar o .delete();
  ///  dentro do proprio bloc é possivel atraves do get navegar entre telas e voltar para a main
  ///

  // Future<void> deletePost(String documentId) async {
  //   final CollectionReference gifsCollection = Firestore.instance.collection('gifs');
  //   await gifsCollection.document(documentId).delete();
  //   Get.offAll(HomeScreen());
  // }



}