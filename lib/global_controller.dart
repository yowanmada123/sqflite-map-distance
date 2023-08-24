import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class GlobalController extends GetxController {
  Future<GlobalController> init() async {
    return this;
  }

  static GlobalController get to => Get.find();

  double latitude = -7.250445;
  double longitude = 112.768845;

  String addres = "";

  String title = "";
  String itemPhotoPath = "";
  String alamatPenjemputan = "";
  String alamatTujuan = "";
  String jarakPengiriman = "";
  var createdAt = "";
}
