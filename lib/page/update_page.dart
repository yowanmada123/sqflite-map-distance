import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_send/extention/colors.dart';
import 'package:my_send/extention/ext_text.dart';
import 'package:my_send/personDB.dart';
import 'package:my_send/page/home_page.dart';
import 'package:my_send/widget/button_base.dart';
import 'package:my_send/widget/custom_form.dart';

class ProfileEditDataPage extends StatefulWidget {
  ProfileEditDataPage({super.key, required this.id});
  final id;

  @override
  State<ProfileEditDataPage> createState() => _ProfileEditDataPageState();
}

class _ProfileEditDataPageState extends State<ProfileEditDataPage> {
  @override
  void initState() {
    filePhoto = File(MyData[0]['photoPath']);
    super.initState();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController noKTPController = TextEditingController();
  File? filePhoto;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Edit Profile Page").p18b(),
          backgroundColor: OPrimaryColor,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Stack(children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(1000)),
                      child: SizedBox(
                        width: 136,
                        height: 136,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: (filePhoto == null || filePhoto!.path == "-")
                              ? FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Container(
                                    color: Colors.grey,
                                    child: const Icon(
                                      Icons.people,
                                      color: Colors.white,
                                    ),
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
                                            print("--------------------------------------------");
                                            print(filePhoto!.path);
                                            print("--------------------------------------------");

                                            // p.filePhoto = File(image.path);

                                            // filePhoto = image as File?;
                                          });
                                        }
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.symmetric(vertical: 10.0),
                                        child: Text(
                                          "Kamera",
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
                                            // print(image.path.toString());
                                            print("--------------------------------------------");
                                            print(filePhoto!.path);
                                            print("--------------------------------------------");
                                            // p.filePhoto = File(image.path);
                                            // print(p.filePhoto.toString());
                                          });
                                        }
                                      },
                                      child: const Text("Galeri"),
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
                            Icons.edit,
                            color: Colors.white,
                            size: 17,
                          ),
                        ),
                      ),
                    )
                  ]),
                  SizedBox(
                    height: 30,
                  ),
                  CustomForm(
                    controller: nameController,
                    // hintText: "",
                    hintText: MyData[0]['name'] ?? "---",
                    title: "Nama Lengkap",
                    isMust: true,
                  ),
                  CustomForm(
                    controller: noKTPController,
                    // hintText: "",
                    hintText: MyData[0]['noKTP'] ?? "---",
                    title: "No. KTP",
                    isMust: true,
                  ),
                  CustomForm(
                    controller: emailController,
                    // hintText: "",
                    hintText: MyData[0]['username'],
                    title: "Email / Username",
                    isMust: true,
                  ),
                  CustomForm(
                    controller: passwordController,
                    // hintText: "",
                    hintText: MyData[0]['password'],
                    title: "Password",
                    isMust: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BaseButton(
                    ontap: () async {
                      if (emailController.text == null || emailController.text == "" || emailController.text == "-") {
                        emailController.text = MyData[0]['username'];
                      }
                      if (passwordController.text == null) {
                        passwordController.text = MyData[0]['password'];
                      }
                      if (noKTPController.text == null || noKTPController.text == "" || noKTPController.text == "-") {
                        noKTPController.text = MyData[0]['noKTP'];
                      }
                      if (nameController.text == null || nameController.text == "" || nameController.text == "-") {
                        nameController.text = MyData[0]['name'];
                      }
                      await LocalDatabase().updateMyData(username: emailController.text, password: passwordController.text, name: nameController.text, noKTP: noKTPController.text, photoPath: filePhoto!.path, id: widget.id);
                      await LocalDatabase().readMyData();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage())).then((value) {
                        setState(() {});
                      });
                    },
                    text: "Save",
                    icon: Icons.edit,
                    iconColor: Colors.white,
                    height: 40,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
