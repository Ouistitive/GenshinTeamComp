
import '../Model/HomeModel.dart';

class HomeController {
  HomeModel model = HomeModel();

  void fetchAlbum() {
    model.fetchAlbum();
  }
}