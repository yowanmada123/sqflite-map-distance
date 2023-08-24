import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:my_send/extention/colors.dart';
import 'package:my_send/extention/ext_text.dart';
import 'package:my_send/global_controller.dart';
import 'package:my_send/page/location_destiny.dart';
import 'package:my_send/page/map_pick_up.dart';
import 'package:my_send/widget/button_base.dart';

class PickUpLocationMap extends StatefulWidget {
  const PickUpLocationMap({Key? key}) : super(key: key);

  @override
  State<PickUpLocationMap> createState() => _PickUpLocationMapState();
}

class _PickUpLocationMapState extends State<PickUpLocationMap> {
  final gstate = Get.put(GlobalController());
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  String alamatAwal = "-";
  TextEditingController alamat = TextEditingController();
  LatLng pickUpLatLong = LatLng(53.225768, -101.753958);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Location Pick Up").p18b(),
        backgroundColor: OPrimaryColor,
      ),
      body: SingleChildScrollView(
          child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BaseMapOpenStreet(
            onChanged: (val) {
              log(val);
              setState(() {
                alamat.text = val;
                alamatAwal = val;
              });
            },
            onLatLongChanged: (val) {
              log(val.toString());
              setState(() {
                pickUpLatLong = val;
              });
            },
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.location_on_rounded,
                          color: Colors.redAccent,
                        ),
                        Text(
                          "Tap the screen to specify the pick-up location",
                          style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: Get.width - 32,
                      child: Text(
                        alamatAwal,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: BaseButton(
              height: 30,
              ontap: () {
                if (alamatAwal != "" || alamatAwal != "-") {
                  Get.to(DestinyLocationMap(
                    latlong: pickUpLatLong,
                    location: alamatAwal,
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please Choose Your Pick Up Location On The Map'),
                    ),
                  );
                }
              },
              text: "Determine the Delivery Destination Location",
              textSize: 10,
            ),
          )
        ],
      )),
      // bottomNavigationBar: OButtonBar(
      //     title: "SAVE LOCATION",
      //     color: const Color(0xFF21005D),
      //     // Theme.of(context).colorScheme.onPrimaryContainer,
      //     onPressed: () {
      //       // Get.to(BookingDate());
      //     }),
    );
  }
}
