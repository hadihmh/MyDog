import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_dog_app/controller/home_controller.dart';
import 'package:my_dog_app/ui/widgets/progress_bar.dart';
import 'package:my_dog_app/utils/enum.dart';

class RandomImagePage extends StatelessWidget {
  RandomImagePage({super.key});
  final HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Random Dog Image"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Obx(() => homeController.currentStatus == PageStatus.loading
          ? ProgressBar()
          : Center(
              child: Container(
                width: Get.width,
                margin: EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    homeController.randomImageUrl.value,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            )
            ),
    );
  }
}
