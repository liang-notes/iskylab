import 'dart:convert';
import 'dart:developer';

import 'package:ditredi/ditredi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import '../course_gps_vector_details_model.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  final _vectors = CourseGpsVectorDetails().obs;
  CourseGpsVectorDetails? get vectors => _vectors.value;

  final _markers = <Marker>[].obs;
  set markers(value) => _markers.value = value;
  List<Marker> get markers => _markers;
  List<Offset> offsets = [];

  void addMarker(LatLng point, Offset offset) {
    markers.add(
      Marker(
        point: point,
        builder: (ctx) {
          return Container(
            color: Colors.red,
            width: 15,
            height: 15,
          );
        },
      ),
    );
    offsets.add(offset);
    generateParabola();
    update();
  }

  void generateParabola() {
    if (offsets.length > 1) {
      for (var i = 0; i < offsets.length - 1; i++) {
        Offset s = offsets[i];
        Offset e = offsets[i + 1];
        
        vector.Vector3 v1 = vector.Vector3(s.dx , s.dy , 1);
        vector.Vector3 v2 = vector.Vector3(e.dx , e.dy , 1);
        print('xxxxxx111====$v1,$v2');
        parabolas.add(Parabola(v1, v2, 100, 200));
      }
    }
  }

  Iterable<Cube3D> generateCubes() sync* {
    final colors = [
      Colors.grey.shade200,
      Colors.grey.shade300,
      Colors.grey.shade400,
      Colors.grey.shade500,
      Colors.grey.shade600,
      Colors.grey.shade700,
      Colors.grey.shade800,
      Colors.grey.shade900,
    ];

    const count = 8;
    for (var x = count; x > 0; x--) {
      for (var y = count; y > 0; y--) {
        for (var z = count; z > 0; z--) {
          print('xxxxx====$x-$y-$z');
          yield Cube3D(
            0.9,
            vector.Vector3(
              x.toDouble() * 2,
              y.toDouble() * 2,
              z.toDouble() * 2,
            ),
            color: colors[(colors.length - y) % colors.length],
          );
        }
      }
    }
  }

  final diTreDiController = DiTreDiController(
    rotationX: -20,
    rotationY: 30,
    // translation: const Offset(375/2, 0),
    light: vector.Vector3(-0.5, -0.5, 0.5),
  );

  late MapController mapController;
  @override
  void onInit() {
    super.onInit();
    loadJson();
    mapController = MapController();
  }

  void loadJson() async {
    log('xxxxxx====');
    String jsonData = await rootBundle.loadString('assets/models/course-gps-vector-details.json');
    Map<String, dynamic> data = json.decode(jsonData);
    _vectors.value = CourseGpsVectorDetails.fromJson(data);
    update();
    log(vectors.toString());
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  List<Parabola> parabolas = <Parabola>[];
  Iterable<Point3D> generatePoints() sync* {
    for (var element in parabolas) {
      final vectors = element.getPoints();
      for (var vector in vectors) {
        yield Point3D(vector,color: Colors.black,width: 10);
      }
    }
  }
}

class Parabola {
  final vector.Vector3 start; // 起点
  final vector.Vector3 end; // 终点
  final double height; // 抛物线高度
  final int segments; // 抛物线分段数

  Parabola(this.start, this.end, this.height, this.segments);
  List<vector.Vector3> getPoints() {
    final List<vector.Vector3> points = [];
    final double step = 1 / segments;
    for (double t = 0; t <= 1; t += step) {
      final vector.Vector3 p = vector.Vector3.zero();
      final double x = (1 - t) * start.x + t * end.x;
      final double y = (1 - t) * start.y + t * end.y;
      final double z = (1 - t) * start.z + t * end.z;
      p.setValues(x, y, z);
      final double h = height * 4 * t * (1 - t);
      p.y += h;
      points.add(p);
    }
    return points;
  }
}
