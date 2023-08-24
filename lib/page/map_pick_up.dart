import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:my_send/global_controller.dart';
import 'package:my_send/widget/alertx.dart';

class BaseMapOpenStreet extends StatefulWidget {
  final Function(String)? onChanged;
  final Function(LatLng)? onLatLongChanged;
  const BaseMapOpenStreet({Key? key, this.onChanged, this.onLatLongChanged}) : super(key: key);

  @override
  State<BaseMapOpenStreet> createState() => BaseMapOpenStreetState();
}

class BaseMapOpenStreetState extends State<BaseMapOpenStreet> {
  final gstate = Get.find<GlobalController>();
  bool _serviceEnabled = false;
  LocationPermission? _permissionGranted;

  MapController mapController = MapController();
  LatLng point = LatLng(53.225768, -101.753958);
  LatLng newFirstPoint = LatLng(53.225768, -101.753958);
  List<LatLng> tappedPoints = [];
  @override
  void initState() {
    super.initState();
    cekPermision();
  }

  static double calculateDistance(LatLng p1, LatLng p2) {
    final Distance distance = new Distance();
    print(distance.toString());
    return distance.as(LengthUnit.Meter, p1, p2);
  }

  cekPermision() async {
    // _serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!_serviceEnabled) {
    //   await Geolocator.openLocationSettings();
    //   return Future.error('Location services are disabled.');
    // }

    _permissionGranted = await Geolocator.checkPermission();

    log(_permissionGranted.toString());
    if (_permissionGranted == LocationPermission.denied || _permissionGranted == LocationPermission.unableToDetermine) {
      bool isAllow = await Alertx().confirmDialog(title: 'Permission location', desc: 'The Apps need to access current location ');
      if (isAllow) {
        _permissionGranted = await Geolocator.requestPermission();
        log(_permissionGranted.toString());

        if (_permissionGranted == LocationPermission.always || _permissionGranted == LocationPermission.whileInUse) {
          getLocation();
        } else {
          Alertx().error('Please grant location access from app settings');
        }
      } else {
        Get.back();
        Get.snackbar('Required permission', 'Please grant location access');
        // Alertx().error('Harap beri akses lokasi dari pengaturan aplikasi');
      }
    } else if (_permissionGranted == LocationPermission.deniedForever) {
      Alertx().error('Please grant location access from app settings');
    } else if (_permissionGranted == LocationPermission.always || _permissionGranted == LocationPermission.whileInUse) {
      getLocation();
    }

    // mapController?.animateCamera(
    //   CameraUpdate.newLatLngZoom(
    //     LatLng(currentLocation.latitude, currentLocation.longitude),
    //     20.0,
    //   ),
    // );
    // setState(() {
    // markers.add(Marker(
    //     markerId: markerId,
    //     position: LatLng(currentLocation.latitude, currentLocation.longitude)));
  }

  Future<void> getLocation() async {
    Position currentLocation = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    if (currentLocation.latitude != null) {
      log("currentLocation.accuracy ${currentLocation.accuracy}");
      tappedPoints.clear();
      tappedPoints.add(LatLng(currentLocation.latitude, currentLocation.longitude));
      if (currentLocation.accuracy < 30) {
        getAddressFromLatLong(currentLocation.latitude, currentLocation.longitude, true);
      }
    }
  }

  Future<void> getAddressFromLatLong(double latitude, double longitude, bool isMove) async {
    //TODO : JIKA bukan web, get addres from plugin
    if (!kIsWeb) {
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
      print(placemarks);
      Placemark place = placemarks[0];
      var address = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
      setState(() {
        // gstate.addres = address;
      });
      if (widget.onChanged != null) {
        widget.onChanged!(address);
      }
    }

    setState(() {
      gstate.latitude = latitude;
      gstate.longitude = longitude;

      if (isMove) {
        mapController.move(LatLng(latitude, longitude), 17);
      }
    });

    // widget.presensiState.setLatitude(position.latitude);
    // widget.presensiState.setLongitude(position.longitude);
    // widget.presensiState.setAddress(address);
  }

  void _handleTap(var tapPosition, LatLng latlng) {
    setState(() {
      tappedPoints.clear();
      tappedPoints.add(latlng);
      print(latlng.latitude.toString());
      print(latlng.longitude.toString());
      getAddressFromLatLong(latlng.latitude, latlng.longitude, false);
      newFirstPoint = latlng;
      if (widget.onLatLongChanged != null) {
        widget.onLatLongChanged!(latlng);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var markers = tappedPoints.map((latlng) {
      return Marker(
        width: 80.0,
        height: 80.0,
        point: latlng,
        builder: (ctx) => Container(
          child: Icon(
            Icons.location_on,
            color: Colors.red,
          ),
        ),
      );
    }).toList();

    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.56,
      // double.infinity * 0.56,
      child: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              center: (gstate.latitude == 0.0)
                  ? point
                  : LatLng(
                      gstate.latitude,
                      gstate.longitude,
                    ),
              zoom: 13.0,
              onTap: _handleTap,
            ),
            children: [
              TileLayer(
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    width: 500.0,
                    height: 500.0,
                    point: LatLng(newFirstPoint.latitude, newFirstPoint.longitude), // Second marker position
                    builder: (ctx) => Container(
                      child: Icon(
                        Icons.location_on,
                        size: 40.0,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {
                  cekPermision();
                },
                icon: Icon(
                  Icons.my_location,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
