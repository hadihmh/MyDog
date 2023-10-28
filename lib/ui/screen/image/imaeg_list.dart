import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_dog_app/controller/home_controller.dart';
import 'package:my_dog_app/ui/widgets/progress_bar.dart';
import 'package:my_dog_app/utils/enum.dart';

class ImageListPage extends StatelessWidget {
  ImageListPage({super.key});
  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Image List of Dogs"),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: Obx(
          () => homeController.currentStatus == PageStatus.loading
              ? const ProgressBar()
              : Container(
                  color: Colors.grey[200],
                  width: Get.width,
                  height: Get.height,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 1,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.vertical,
                      autoPlay: true,
                    ),
                    items: homeController.imageList
                        .map((element) => Center(
                              child: Container(
                                width: Get.width,
                                margin: const EdgeInsets.all(10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    element,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ))
                        .toList(),
                  )),
        ));
  }
}
