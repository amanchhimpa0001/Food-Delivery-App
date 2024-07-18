import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery_new_project/helpers/app_config.dart';
import 'package:food_delivery_new_project/helpers/app_services.dart';
import 'package:food_delivery_new_project/helpers/color_sheet.dart';
import 'package:food_delivery_new_project/helpers/text_theme.dart';
import 'package:food_delivery_new_project/orders_screen/demo.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Tracker_orders extends StatefulWidget {
  const Tracker_orders({super.key});

  @override
  State<Tracker_orders> createState() => _Tracker_ordersState();
}

class _Tracker_ordersState extends State<Tracker_orders> {
  int btnindex = 0;
  final name_controller = TextEditingController();

  final phone_controller = TextEditingController();

  final Address_controller = TextEditingController();
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(29.1492, 75.7217);

  final Set<Marker> _markers = {};

  LatLng _lastMapPosition = _center;

  MapType _currentMapType = MapType.normal;

  // ignore: unused_element
  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  // ignore: unused_element
  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: InfoWindow(
          title: 'Really cool place',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Appservices.goback(context);
              },
              icon: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: AppColors.blackColor),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.whiteColor,
                  size: 20,
                ),
              )),
          title: Text(
            "Track Orders",
            style: GetTextTheme.fs20_regular,
          ),
        ),
        body: Container(
          height: AppConfig.screenHeight,
          child: GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 18.0,
            ),
            mapType: _currentMapType,
            markers: _markers,
            onCameraMove: _onCameraMove,
          ),
        ),
        bottomNavigationBar: Track_order_page());
  }
}
