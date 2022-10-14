import 'dart:developer';

import 'package:get/get.dart';
import 'package:portfolio/model/wallpaper_model.dart';
import 'package:portfolio/service/api_client.dart';

class WallpaperController extends GetxController {
  var wallpaper = <WallpaperModel>[].obs;
  var isLoading = true.obs;

  Future getWallpaper() async {
    try {
      isLoading(true);
      final wallpaperData = await ApiCLient.getData();
      if (wallpaperData != null) {
        wallpaper.value = wallpaperData;
      }
    } catch (e) {
      Get.snackbar("ERROR", e.toString());
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getWallpaper();
  }
}
