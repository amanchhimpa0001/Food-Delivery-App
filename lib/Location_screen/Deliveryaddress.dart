import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_new_project/componants/custom_elevated_button.dart';
import 'package:food_delivery_new_project/componants/custom_textfield.dart';
import 'package:food_delivery_new_project/componants/navbar.dart';

import 'package:food_delivery_new_project/componants/textformfield.dart';
import 'package:food_delivery_new_project/helpers/app_config.dart';
import 'package:food_delivery_new_project/helpers/app_services.dart';
import 'package:food_delivery_new_project/helpers/color_sheet.dart';
import 'package:food_delivery_new_project/helpers/text_theme.dart';
import 'package:food_delivery_new_project/model/txt_btn_dummydata.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Deliveryaddress extends StatefulWidget {
  const Deliveryaddress({super.key});

  @override
  State<Deliveryaddress> createState() => _DeliveryaddressState();
}

class _DeliveryaddressState extends State<Deliveryaddress> {
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
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: AppConfig.screenHeight / 2.8,
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
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Appservices.addheight(20),
                    Text(
                      'ADDRESS',
                      style: GetTextTheme.fs16_regular,
                    ),
                    Appservices.addheight(5),
                    CustomTextField(
                        icon: Icons.location_on,
                        controller: name_controller,
                        hide: false,
                        hintext: "Street in Los Angeles, California"),
                    Appservices.addheight(25),
                    Row(
                      children: [
                        Text(
                          'STREET',
                          style: GetTextTheme.fs16_regular,
                        ),
                        Appservices.addWidth(AppConfig.screenWidth / 3),
                        Text(
                          'POST CODE',
                          style: GetTextTheme.fs16_regular,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Customtextformfilled(
                            isExpanded: true,
                            fillcolor: AppColors.lightgrey,
                            hintText: 'Los Angeles',
                            style: GetTextTheme.fs12_regular),
                        Appservices.addWidth(5),
                        Customtextformfilled(
                            fillcolor: AppColors.lightgrey,
                            isExpanded: true,
                            hintText: '90055',
                            style: GetTextTheme.fs12_regular),
                      ],
                    ),
                    Appservices.addheight(20),
                    Text(
                      'APPARMANT',
                      style: GetTextTheme.fs16_regular,
                    ),
                    Customtextformfilled(
                      style: GetTextTheme.fs12_regular,
                      hintText: '233',
                      fillcolor: AppColors.lightgrey,
                    ),
                    Appservices.addheight(20),
                    Text(
                      'LEBAL AS',
                      style: GetTextTheme.fs16_regular,
                    ),
                    AspectRatio(
                      aspectRatio: 6,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: dummydata.News_button.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.h, horizontal: 25.w),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40)),
                                  backgroundColor: btnindex == index
                                      ? AppColors.orange
                                      : AppColors.lightgrey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    btnindex = index;
                                  });
                                },
                                child: Text(
                                  dummydata.News_button[index],
                                  style: GetTextTheme.fs12_medium.copyWith(
                                      color: btnindex == index
                                          ? AppColors.lightgrey
                                          : AppColors.greyColor),
                                )),
                          );
                        },
                      ),
                    ),
                    Appservices.addheight(20),
                    CustomElevatedButton(
                      peddingv: 18,
                      btnName: "SAVE LOCATION",
                      onTap: () {
                        Appservices.pushto(context, Navbar());
                      },
                      foreground_clr: AppColors.whiteColor,
                      color: AppColors.orange,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
