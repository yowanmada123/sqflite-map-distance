import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_send/extention/colors.dart';
import 'package:my_send/extention/ext_text.dart';
import 'package:my_send/global_controller.dart';
import 'package:my_send/page/location_pick_up.dart';
import 'package:my_send/widget/alertx.dart';
import 'package:my_send/widget/button_base.dart';
import 'package:my_send/widget/custom_form.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final g = Get.put(GlobalController());
  TextEditingController titleController = TextEditingController();
  File? filePhoto;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    print("======================");
    print(filePhoto);
    print("======================");
    return Scaffold(
        appBar: AppBar(
          title: Text("Send Your Item").p18b(),
          backgroundColor: OPrimaryColor,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Stack(children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(1000)),
                      child: SizedBox(
                        width: 136,
                        height: 136,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: (filePhoto == null || filePhoto!.path == "" || filePhoto!.path == "-")
                              ? Container(
                                  color: Colors.grey,
                                  child: const Icon(
                                    Icons.card_giftcard,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                )
                              : Image.file(
                                  File(filePhoto!.path),
                                  fit: BoxFit.fitWidth,
                                ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 2,
                      right: 0,
                      child: GestureDetector(
                        onTap: () async {
                          showDialog(
                            barrierDismissible: true,
                            context: context,
                            builder: (c) => AlertDialog(
                              // title: Container(),
                              content: Container(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                height: 58,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        Navigator.pop(context);
                                        // File? file = await Get.to(() => const CameraOverlay('identitas'));
                                        final XFile? image = await _picker.pickImage(source: ImageSource.camera);
                                        if (image != null) {
                                          setState(() {
                                            filePhoto = File(image.path);
                                            g.itemPhotoPath = filePhoto!.path;
                                          });
                                        }
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(vertical: 10.0),
                                        child: Text(
                                          "Camera",
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        Navigator.pop(context);
                                        final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                                        if (image != null) {
                                          setState(() {
                                            filePhoto = File(image.path);
                                            g.itemPhotoPath = filePhoto!.path;
                                          });
                                        }
                                      },
                                      child: const Text("Galery"),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: 39,
                          height: 39,
                          decoration: BoxDecoration(
                              color: OPrimaryColor,
                              borderRadius: BorderRadius.circular(1000),
                              boxShadow: const [
                                BoxShadow(color: Color.fromARGB(83, 46, 46, 46), spreadRadius: 1, blurRadius: 1, offset: Offset(0.0, 1.0)),
                              ],
                              border: Border.all(color: Colors.white, width: 2)),
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    )
                  ]),
                  SizedBox(
                    height: 30,
                  ),
                  CustomForm(
                    controller: titleController,
                    // hintText: "",
                    hintText: "Input Message",
                    title: "Message",
                    isMust: true,
                  ),
                  // CustomForm(
                  //   controller: noKTPController,
                  //   // hintText: "",
                  //   hintText: MyData[0]['noKTP'] ?? "---",
                  //   title: "No. KTP",
                  //   isMust: true,
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BaseButton(
                    ontap: () async {
                      print(g.itemPhotoPath);
                      print(titleController.text);
                      if (titleController.text != null || titleController.text == "") {
                        if (filePhoto != null) {
                          g.title = titleController.text;
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const PickUpLocationMap()));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Choose The Image from Galery or Camera.'),
                            ),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please Fill The Title.'),
                          ),
                        );
                      }
                      // await LocalDatabase().updateMyData(username: emailController.text, password: passwordController.text, name: nameController.text, noKTP: noKTPController.text, photoPath: filePhoto!.path, id: widget.id);
                      // await LocalDatabase().readMyData();
                      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage())).then((value) {
                      //   setState(() {});
                      // });
                    },
                    text: "location input",
                    icon: Icons.location_on_rounded,
                    iconColor: Colors.white,
                    height: 33,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}



// class OrderPage extends StatelessWidget {
//   const OrderPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController noKTPController = TextEditingController();
//     File? filePhoto;
//     final ImagePicker _picker = ImagePicker();
//     return 
//   }
// }
