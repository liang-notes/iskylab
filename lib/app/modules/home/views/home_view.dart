import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('HomeView'),
            centerTitle: true,
          ),
          body: Center(
            child: GestureDetector(
              onTap: () {
                // controller.loadJson();
              },
              child: const Text(
                'HomeView is working111',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        );
      },
    );
  }
}
