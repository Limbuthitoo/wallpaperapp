import 'package:get/get.dart';

class Dimensions {
  //screen size
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  // dynamic height padding and margin
  static double height10 = screenHeight / 80.3;
  static double height20 = screenHeight / 40.15;
  static double height15 = screenHeight / 50.53;
  static double height30 = screenHeight / 26.76;
  static double height45 = screenHeight / 17.8;
  static double height70 = screenHeight / 9;
  static double height300 = screenHeight / 2.81;

  // dynamic width padding and margin
  static double width10 = screenWidth / 39.27;
  static double width20 = screenWidth / 19.36;
  static double width15 = screenWidth / 26.18;
  static double width30 = screenWidth / 13.1;

  //dynamic Icon Size
  static double iconSize25 = screenHeight / 37;
  static double iconSize15 = screenHeight / 53.53;

  //Font Size
  static double font20 = screenHeight / 40;
  static double font26 = screenHeight / 30.88;
  static double font10 = screenHeight / 60;
  static double font16 = screenHeight / 50.18;

  //radius
  static double radius15 = screenHeight / 56;
  static double radius30 = screenHeight / 26.76;
}
