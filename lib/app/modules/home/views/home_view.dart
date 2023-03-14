import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../painters/map_painter.dart';

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
            child: CustomPaint(
              size: const Size(500, 400),
              painter: MapPainter(vectors: controller.vectors?.vectorGPSObject?.vegetation),
            ),
          ),
        );
      },
    );
  }
}
