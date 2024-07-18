import 'dart:async';

import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';

import 'package:flutter/material.dart';
import 'package:food_delivery_new_project/helpers/all_image.dart';
import 'package:food_delivery_new_project/helpers/app_config.dart';
import 'package:food_delivery_new_project/helpers/app_services.dart';
import 'package:food_delivery_new_project/helpers/color_sheet.dart';
import 'package:food_delivery_new_project/helpers/text_theme.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Track_order_page extends StatefulWidget {
  @override
  State<Track_order_page> createState() => _Track_order_pageState();
}

class _Track_order_pageState extends State<Track_order_page> {
  // ignore: unused_field
  var _index = 0;
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
      body: DraggableBottomSheet(
        onDragging: (p0) {},
        backgroundWidget: Scaffold(
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
        ),
        expandedWidget: Container(
          width: AppConfig.screenWidth,
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: AppColors.lightwhiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          child: Column(
            children: [
              Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black,
              ),
              Appservices.addheight(10),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Text(
                      "20 min",
                      style: GetTextTheme.fs26_bold,
                    ),
                    Appservices.addheight(10),
                    Text(
                      "ESTIMATED DELIVERY TIME",
                      style: GetTextTheme.fs14_regular
                          .copyWith(color: AppColors.greyColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        previewWidget: Container(
          width: AppConfig.screenWidth,
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
              color: AppColors.lightwhiteColor),
          child: Column(
            children: [
              Container(
                height: 5,
                width: 50,
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              Appservices.addheight(20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 61,
                      width: 61,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          Getimage.CafenioCoffeeClubimg,
                          fit: BoxFit.cover,
                        ),
                      )),
                  Appservices.addWidth(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Uttora Coffee House",
                        style: GetTextTheme.fs18_regular,
                      ),
                      Text(
                        "Orderd at 06 Sept, 10:00pm",
                        style: GetTextTheme.fs14_regular
                            .copyWith(color: AppColors.greyColor),
                      ),
                      Appservices.addheight(20),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                          text: "2x",
                          style: GetTextTheme.fs14_bold,
                        ),
                        TextSpan(
                          text: "  Burger",
                          style: GetTextTheme.fs13_regular
                              .copyWith(color: AppColors.greyColor),
                        ),
                      ])),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                          text: "4x",
                          style: GetTextTheme.fs14_bold,
                        ),
                        TextSpan(
                          text: "  Sanwitch",
                          style: GetTextTheme.fs13_regular
                              .copyWith(color: AppColors.greyColor),
                        ),
                      ])),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        minExtent: 70.0,
        expansionExtent: 200,
        maxExtent: MediaQuery.of(context).size.height * 0.7,
      ),
    );
  }
}
