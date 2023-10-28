enum Routes {
  randomByBreed,
  imageListByBreed,
  randomImageByBreedAndSub,
  imageListByBreedAndSub
}

extension StaticRoutes on Routes {
  static const _url = {
    Routes.randomByBreed: "api/breed/hound/images/random",
    Routes.imageListByBreed: "api/breed/hound/images",
    Routes.randomImageByBreedAndSub: "api/breed/hound/afghan/images/random",
    Routes.imageListByBreedAndSub: "api/breed/hound/basset/images",
  };

  String get url => _url[this] ?? "";
}
