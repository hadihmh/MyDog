import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:my_dog_app/domain/api/call_api.dart';
import 'package:my_dog_app/domain/models/image_list_model.dart';
import 'package:my_dog_app/domain/models/random_image_model.dart';
import 'package:my_dog_app/utils/enum.dart';

class HomeController extends GetxController {
  var currentStatus = PageStatus.loaded.obs;
  var randomImageUrl = "".obs;
  var imageList = <String>[].obs;
  Future<RandomImageModel> getRandomImageByBreed() async {
    currentStatus.value = PageStatus.loading;
    var result = await CallApis().randomByBreed();
    randomImageUrl.value = result.message ?? "";

    currentStatus.value = PageStatus.loaded;

    return result;
  }

  Future<RandomImageModel> getRandomImageByBreedAndSub() async {
    currentStatus.value = PageStatus.loading;
    var result = await CallApis().randomImageByBreedAndSub();
    randomImageUrl.value = result.message ?? "";

    currentStatus.value = PageStatus.loaded;

    return result;
  }

  Future<ImageListModel> getImageListByBreed() async {
    currentStatus.value = PageStatus.loading;
    var result = await CallApis().imageListByBreed();
    imageList.value = result.message ?? [];
    currentStatus.value = PageStatus.loaded;

    return result;
  }

  Future<ImageListModel> getImageListByBreedAndSub() async {
    currentStatus.value = PageStatus.loading;
    var result = await CallApis().imageListByBreedAndSub();
    imageList.value = result.message ?? [];

    currentStatus.value = PageStatus.loaded;

    return result;
  }
}
