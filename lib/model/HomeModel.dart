import 'package:http/http.dart' as http; // Import correctement la classe http

class HomeModel {
  void fetchAlbum() async {
    http.Response r = await http.get(Uri.parse('https://gsi.fly.dev/characters/1'));
    print(r.body);
  }
}
