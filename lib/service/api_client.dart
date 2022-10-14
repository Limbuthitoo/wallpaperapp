import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio/model/wallpaper_model.dart';
import 'package:portfolio/utils/app_constants.dart';

class ApiCLient extends GetxService {
  static var client = http.Client();
  static Future<List<WallpaperModel>?> getData() async {
    try {
      final response = await client.get(Uri.parse(
          "${AppConstants.BASEURL}popular${AppConstants.POPULAR_URI}"));
      if (response.statusCode == 200) {
        final fetchData = response.body;
        return wallpaperModelFromJson(fetchData);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
    return null;
  }
}
