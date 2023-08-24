import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_send/extention/ext_text.dart';

// import '../../constant.dart';

class Alertx {
  success(String? message, {String title = 'Success', String code = ''}) {
    Get.dialog(Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        height: 200,
        width: 200,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              const Icon(
                Icons.check,
                size: 30,
                color: Colors.green,
              ),
              const SizedBox(height: 5),
              Text(
                title,
              ).p18m(),
              const SizedBox(height: 5),
              Text(
                message ?? '',
              ).p15r(),
              TextButton(
                  onPressed: () {
                    Get.back(result: true);
                  },
                  child: Text("OK"))
            ],
          ),
        ),
      ),
    ));
  }

  Future<dynamic> confirmDialog({String title = '', desc = ''}) async {
    return Get.dialog(Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        height: 160,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const SizedBox(height: 10),
              Text(title).p18m(),
              const SizedBox(height: 10),
              Text(desc).p15r(),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: GestureDetector(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      child: Text('Tidak'),
                    ),
                    onTap: () {
                      Get.back(result: false);
                    },
                  )),
                  Flexible(
                      child: TextButton(
                          onPressed: () {
                            Get.back(result: true);
                          },
                          child: Text("OK"))
                      // OButton(
                      //     title: 'Ya',
                      //     // color: Colors.green,
                      //     onPressed: () {
                      //       Get.back(result: true);
                      //     }),
                      ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }

  loading() {
    Get.dialog(Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        height: 100,
        width: 50,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: const CircularProgressIndicator(),
          ),
        ),
      ),
    ));
  }

  error(String? message, {String title = 'Oops...', String code = ''}) {
    Get.dialog(Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Container(
        height: 300,
        width: 100,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              const Icon(
                Icons.error,
                size: 80,
                color: Colors.orange,
              ),
              const SizedBox(height: 10),
              Text(title),
              const SizedBox(height: 10),
              Text(message ?? ''),
              const SizedBox(height: 20),
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("OK"))
              // OButton(
              //     title: 'OK',
              //     onPressed: () {
              //       if (code == 'UNAUTHENTICATED') {
              //         gstate.token = '';
              //         Get.offAll(const OnboardingPage());
              //       } else {
              //         Get.back();
              //       }
              //     })
            ],
          ),
        ),
      ),
    ));
  }
}
