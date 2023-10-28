import 'package:my_dog_app/domain/api/base_api.dart';
import 'package:my_dog_app/domain/config/routes.dart';
import 'package:my_dog_app/domain/models/image_list_model.dart';
import 'package:my_dog_app/domain/models/random_image_model.dart';

class CallApis extends BaseAPI {
  Future<ImageListModel> imageListByBreed() async {
    var result =
        await get<Map<String, dynamic>>(route: Routes.imageListByBreed);

    return ImageListModel.fromJson(result);
  }

  Future<ImageListModel> imageListByBreedAndSub() async {
    var result =
        await get<Map<String, dynamic>>(route: Routes.imageListByBreedAndSub);

    return ImageListModel.fromJson(result);
  }

  Future<RandomImageModel> randomByBreed() async {
    var result = await get<Map<String, dynamic>>(route: Routes.randomByBreed);
    return RandomImageModel.fromJson(result);
  }

  Future<RandomImageModel> randomImageByBreedAndSub() async {
    var result =
        await get<Map<String, dynamic>>(route: Routes.randomImageByBreedAndSub);
    return RandomImageModel.fromJson(result);
  }
}
