import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery_new_project/Utils/routs/routs_name.dart';
import 'package:food_delivery_new_project/componants/custom_elevated_button.dart';
import 'package:food_delivery_new_project/helpers/app_config.dart';
import 'package:food_delivery_new_project/helpers/app_services.dart';
import 'package:food_delivery_new_project/helpers/color_sheet.dart';
import 'package:food_delivery_new_project/helpers/text_theme.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AccessLocation extends StatefulWidget {
  const AccessLocation({super.key});

  @override
  State<AccessLocation> createState() => _AccessLocationState();
}

class _AccessLocationState extends State<AccessLocation> {
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
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: AppConfig.screenHeight / 2.2,
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
            Column(
              children: [
                Appservices.addheight(25),
                CustomElevatedButton(
                  style: GetTextTheme.fs16_medium,
                  peddingv: 18,
                  btnName: "ACCESS LOCATION",
                  onTap: () {
                    Navigator.pushNamed(context, Routsname.Deliveryaddress);
                  },
                  foreground_clr: AppColors.whiteColor,
                  color: AppColors.orange,
                ),
                Appservices.addheight(35),
                Text(
                  'DFOOD WILL ACCESS YOUR LOCATION ONLY WHILE USING THE APP',
                  style:
                      GetTextTheme.fs16_regular.copyWith(color: AppColors.grey),
                  textAlign: TextAlign.center,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
