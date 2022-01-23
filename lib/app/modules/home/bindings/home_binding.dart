import 'package:get/get.dart';
import 'package:localdata/app/data/provider/api.dart';
import 'package:localdata/app/data/repository/post_repository.dart';
import 'package:http/http.dart' as http;

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyController>(
      () => MyController( repository:
              MyRepository(apiClient: MyApiClient(httpClient: http.Client()))),
    );
  }
}
