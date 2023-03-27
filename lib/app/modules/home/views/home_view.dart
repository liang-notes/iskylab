import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../painters/map_painter.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:ditredi/ditredi.dart';

import 'package:vector_math/vector_math_64.dart' as vector;

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        Crs crs = const Epsg3857();
        // MapController mapController = MapController();
        var map = FlutterMap(
          mapController: controller.mapController,
          options: MapOptions(
            center: LatLng(40.031841, 116.381635),
            zoom: 5,
            crs: crs,
            bounds: LatLngBounds(
              LatLng(-0.0, 0.5986328125),
              LatLng(-0.626953125, 0.0),
            ),
            // swPanBoundary: LatLng(-0.626953125, 0.0),
            // nePanBoundary: LatLng(-0.0, 0.5986328125),
            onLongPress: (tapPosition, point) {
              print('xxxxx===1===${tapPosition.global}===${tapPosition.relative}===');
              controller.addMarker(point, tapPosition.relative!);
            },
            onMapReady: () {
              final pixel = crs.latLngToPoint(LatLng(40.031841, 116.381635), 5);
              print('xxxxx1====$pixel===${controller.mapController.bounds}');
              CustomPoint<num> northWestPoint = crs.projection.project(controller.mapController.bounds!.northWest);
              CustomPoint<num> markerPoint = crs.projection.project(LatLng(40.031841, 116.381635));
              Offset o =
                  Offset((markerPoint.x - northWestPoint.x).toDouble(), (northWestPoint.y - markerPoint.y).toDouble());
              o = o.scale(1 / 2, 1 / 2);
              print('xxxxx2====$o');
            },
          ),
          nonRotatedChildren: [
            AttributionWidget.defaultWidget(
              source: 'OpenStreetMap contributors',
              onSourceTapped: () {},
            ),
          ],
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.liang.iskylab',
            ),
            MarkerLayer(markers: controller.markers),
          ],
        );
        return Scaffold(
          appBar: AppBar(
            title: const Text('HomeView'),
            centerTitle: true,
          ),
          body: Stack(
            children: [
              Transform(
                transform: Matrix4(
                  1,
                  0,
                  0,
                  0,
                  0,
                  1,
                  0,
                  0,
                  0,
                  0,
                  1,
                  0,
                  0,
                  0,
                  0,
                  1,
                )
                  ..setEntry(3, 2, 0.001)
                  ..rotateX(0)
                  ..rotateY(0.0)
                  ..rotateZ(0.0),
                alignment: FractionalOffset.center,
                child: map,
              ),
              // IgnorePointer(
              //   child: DiTreDiDraggable(
              //     controller: controller.diTreDiController,
              //     scaleEnabled: false,
              //     child: Container(
              //       width: 300,
              //       height: 300,
              //       color: Colors.grey,
              //       child: DiTreDi(
              //         figures: [
              //           Point3D(vector.Vector3(0, 0, 0), color: Colors.purple, width: 5),
              //           Point3D(vector.Vector3(0, 1, 0), color: Colors.green, width: 5),
              //           Point3D(vector.Vector3(0, 2, 0), color: Colors.green, width: 5),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              if (controller.parabolas.length > 6)
                IgnorePointer(
                  // ignoring: controller.markers.length > 8,
                  child: DiTreDiDraggable(
                    controller: controller.diTreDiController,
                    child: DiTreDi(
                      figures: controller.generatePoints().toList(),
                      controller: controller.diTreDiController,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
