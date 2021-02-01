class GiphyApi {
  static const mainRoute = 'https://api.giphy.com/v1/gifs/';
  static const apiKey = 'search?api_key=JXgi4T4X21CEvR4Oz6Djve8KCU0rzAqm&';
  static const queryTerm = 'q=starwars&limit=25&offset=0&rating=g&lang=pt';

  static const routeOne = '$mainRoute$apiKey';

  String changeableText;
  int limit = 25;

  String getText(String text, int offset) {
    limit += offset;
    if (offset == 0) {
      changeableText = 'q=$text&limit=25&offset=$offset&rating=g&lang=pt';
    } else {
      changeableText = 'q=$text&limit=25&offset=$offset&rating=g&lang=pt';
    }
    return changeableText;
  }
}
