import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bottom_menu_controller.dart';

class BottomMenuView extends GetView<BottomMenuController> {
  const BottomMenuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomMenuView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'BottomMenuView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
