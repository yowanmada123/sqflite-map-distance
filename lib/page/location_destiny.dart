import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:my_send/extention/colors.dart';
import 'package:my_send/extention/ext_text.dart';
import 'package:my_send/global_controller.dart';
import 'package:my_send/historyDB.dart';
import 'package:my_send/page/map_destiny.dart';
import 'package:my_send/widget/alertx.dart';
import 'package:my_send/widget/button_base.dart';

class DestinyLocationMap extends StatefulWidget {
  final String location;
  final LatLng latlong;
  const DestinyLocationMap({Key? key, required this.location, required this.latlong}) : super(key: key);

  @override
  State<DestinyLocationMap> createState() => _DestinyLocationMapState();
}

class _DestinyLocationMapState extends State<DestinyLocationMap> {
  final g = Get.put(GlobalController());
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  String alamatTujuan = "-";
  String jarak = "-";
  TextEditingController alamat = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose Location Destiny").p18b(),
        backgroundColor: OPrimaryColor,
      ),
      body: SingleChildScrollView(
          child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DestinyMap(
            latlongAwal: LatLng(widget.latlong.latitude, widget.latlong.longitude),
            onChanged: (val) {
              log(val);
              setState(() {
                alamat.text = val;
                alamatTujuan = val;
              });
            },
            onChangedDistance: (val) {
              log(val);
              setState(() {
                jarak = val;
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
                          "Pick-up location",
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
                        widget.location,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.location_on_rounded,
                          color: Colors.green,
                        ),
                        Text(
                          "Tap Screen To Specify Destination Address",
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
                        alamatTujuan,
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
          const SizedBox(
            height: 20,
          ),
          Text(
            "Delivery distance as far as $jarak",
            style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: BaseButton(
              height: 30,
              ontap: () async {
                g.alamatPenjemputan = widget.location;
                g.alamatTujuan = alamatTujuan;
                if (g.alamatTujuan != "" || g.alamatTujuan != "-") {
                  await HistoryOrderDB().addDataLocally(title: g.title, alamatPenjemputan: g.alamatPenjemputan, alamatTujuan: g.alamatTujuan, itemPhotoPath: g.itemPhotoPath, jarakPengiriman: jarak);
                  await HistoryOrderDB().readAllData();
                  Get.close(3);
                  g.title = "-";
                  g.alamatPenjemputan = "-";
                  g.alamatTujuan = "-";
                  g.itemPhotoPath = "-";
                  g.jarakPengiriman = "-";
                  Alertx().success("Your item has arrived, check your order history");
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   const SnackBar(
                  //     content: Text('Your item has arrived, check your order history'),
                  //   ),
                  // );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please Choose Your Destination Location On The Map'),
                    ),
                  );
                }
                //  await HistoryOrderDB().addDataLocally(title: );
              },
              text: "Send Your Stuff",
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
