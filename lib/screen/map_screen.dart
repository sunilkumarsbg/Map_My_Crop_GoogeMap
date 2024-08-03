import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mappage/constant/colors.dart';
import 'package:mappage/constant/constant.dart';
import 'package:mappage/controller/api_controller.dart';
import 'package:mappage/widget/common_widget.dart';

class PolygoneScreen extends StatefulWidget {
  const PolygoneScreen({Key? key}) : super(key: key);

  @override
  _PolygoneScreenState createState() => _PolygoneScreenState();
}

class _PolygoneScreenState extends State<PolygoneScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  final ApiController apiController = Get.put(ApiController());

  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(17.697995426, 75.899273157),
    zoom: 16,
  );
  final Set<Marker> _markers = {};
  final Set<Polygon> _polygone = HashSet<Polygon>();

  List<LatLng> points = const [
    LatLng(17.697995426, 75.899273157),
    LatLng(17.69811201, 75.900360458),
    LatLng(17.696535086, 75.900577046),
    LatLng(17.696488452, 75.899297632),
    LatLng(17.697995426, 75.899273157),
  ];

  void _setPolygone() {
    _polygone.add(Polygon(
        polygonId: const PolygonId('1'),
        points: points,
        strokeColor: AppColors.coordinateLineColor,
        strokeWidth: 5,
        fillColor: AppColors.coordinateLineColor.withOpacity(0.1),
        geodesic: true));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _setPolygone();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mapAapBar(),
      body: Stack(
        children: [
          Positioned(
            top: 5,
            left: 0,
            right: 0,
            child: labelText(Constants.byteImage),
          ),
          Obx(() {
            if (apiController.isLoading == true) {
              return const CircularProgressIndicator();
            } else {
              return Positioned(
                top: 40,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Image.memory(
                    apiController.bytes,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }
          }),
          Positioned(
            top: 250,
            left: 0,
            right: 0,
            child: labelText(Constants.polyGone),
          ),
          Positioned(
            top: 280,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 450,
              child: GoogleMap(
                mapType: MapType.terrain,
                initialCameraPosition: _kGooglePlex,
                myLocationButtonEnabled: true,
                myLocationEnabled: false,
                markers: _markers,
                polygons: _polygone,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
