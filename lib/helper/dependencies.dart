import 'package:get/get.dart';
import 'package:portfolio/controller/wallpaper_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(WallpaperController());
  }
}
