import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_dog_app/controller/home_controller.dart';
import 'package:my_dog_app/ui/screen/home/widgets/main_item.dart';
import 'package:my_dog_app/ui/screen/image/imaeg_list.dart';
import 'package:my_dog_app/ui/screen/image/random_image.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            // pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                    textAlign: TextAlign.start, 'Find Your Dog Picture ...'),
              ),
              background: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Colors.black
                      .withOpacity(0.5), // Change the opacity here (0.0 to 1.0)
                  BlendMode.dstATop,
                ),
                child: Image.network(
                  'https://images.dog.ceo/breeds/terrier-westhighland/n02098286_1814.jpg',
                  fit: BoxFit.cover,
                  // color: Colors.,
                ),
              ),
            ),
            backgroundColor: Colors.transparent,
            actions: [
              Container(
                  padding: const EdgeInsets.only(top: 10, right: 20),
                  // height: 60,
                  width: Get.width - 20,
                  // decoration: BoxDecoration(color: Colors.amber),
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Search...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    onChanged: (text) {
                      // Handle the text input changes here
                      print('Search text: $text');
                    },
                  ))
            ],
          ),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            return GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: (0.68),
                shrinkWrap: true,
                children: [
                  MainItem(
                      imageUrl: "images/dogs/dog1.png",
                      marginButton: 20,
                      marginTop: 0,
                      onTap: () {
                        homeController.getRandomImageByBreed();
                        Get.to(RandomImagePage());
                      },
                      titleContent: "Random image\nby breed"),
                  MainItem(
                      imageUrl: "images/dogs/dog2.png",
                      marginButton: 0,
                      marginTop: 20,
                      onTap: () {
                        homeController.getImageListByBreed();
                        Get.to(ImageListPage());
                      },
                      titleContent: "Images list\nby breed"),
                  MainItem(
                      imageUrl: "images/dogs/dog3.png",
                      marginButton: 20,
                      marginTop: 0,
                      onTap: () {
                        homeController.getRandomImageByBreedAndSub();
                        Get.to(RandomImagePage());
                      },
                      titleContent: "Random image\nby breed and sub breed"),
                  MainItem(
                      imageUrl: "images/dogs/dog4.png",
                      marginButton: 0,
                      marginTop: 20,
                      onTap: () {
                        homeController.getImageListByBreedAndSub();
                        Get.to(ImageListPage());
                      },
                      titleContent: "Images list\nby breed and sub breed"),
                ]);
          }, childCount: 1))
        ],
      ),
    );
  }
}
