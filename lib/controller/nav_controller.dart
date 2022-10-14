import 'package:get/get.dart';
import 'package:portfolio/service/api_client.dart';

class NavController extends GetxController {
  var selectedIndex = 0.obs;
  RxString orderBy = "latest".obs;
  List<String> nav = [
    'Latest',
    'Oldest',
    'Popular',
    'Views',
  ].obs;

  orderFunc(String newValue) {
    orderBy.value = newValue;
    ApiCLient.getData();
  }
}
