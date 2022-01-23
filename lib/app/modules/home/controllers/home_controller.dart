import 'package:get/get.dart';
import 'package:localdata/app/data/model/model.dart';
import 'package:localdata/app/data/repository/post_repository.dart';

import 'package:meta/meta.dart';

class MyController extends GetxController {
  //repository required
  final MyRepository? repository;
  MyController({@required this.repository}) : assert(repository != null);

  //use o snippet getfinal para criar está variável
  final _postsList = <MyModel>[].obs;
  // ignore: invalid_use_of_protected_member
  get postList => _postsList.value;
  set postList(value) => _postsList.value = value;

  ///função para recuperar todos os posts
  getAll() {
    repository?.getAll().then((data) {
      postList = data;
    });
  }
}
