import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_send/extention/colors.dart';
import 'package:my_send/extention/ext_text.dart';
import 'package:my_send/historyDB.dart';
import 'package:my_send/page/history_order_page.dart';
import 'package:my_send/page/login_page.dart';
import 'package:my_send/page/order_page.dart';
import 'package:my_send/personDB.dart';
import 'package:my_send/page/location_pick_up.dart';
import 'package:my_send/page/update_page.dart';
import 'package:my_send/widget/alertx.dart';
import 'package:my_send/widget/button_base.dart';
import 'package:my_send/widget/button_square.dart';
import 'package:my_send/widget/custom_fixed_form.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    filePhoto = File(MyData[0]['photoPath']);
    super.initState();
  }

  File? filePhoto;
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Fake Go-Send").p18b(),
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
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(1000)),
                    child: SizedBox(
                      width: 100,
                      height: 100,
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
                  const SizedBox(
                    height: 20,
                  ),
                  CustomFixedForm(
                    content: MyData[0]['name'] ?? "---",
                    title: "Nama Lengkap",
                    isMust: false,
                  ),
                  CustomFixedForm(
                    content: MyData[0]['noKTP'] ?? "---",
                    title: "No. KTP",
                    isMust: false,
                  ),
                  CustomFixedForm(
                    content: MyData[0]['username'],
                    title: "Email / username",
                    isMust: false,
                  ),
                  CustomFixedForm(
                    isMust: true,
                    title: "Password",
                    cornerIcon: (visible) ? Icons.visibility : Icons.visibility_off,
                    ontapIcon: () {
                      setState(() {
                        visible = !visible;
                      });
                    },
                    content: (visible) ? MyData[0]['password'] : MyData[0]['password'].replaceAll(RegExp(r"."), "*"),
                    backgroundColor: Colors.white,
                    ontap: () {},
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SquareButton(
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileEditDataPage(
                                        id: MyData[0]['id'],
                                      ))).then((value) {
                            setState(() {});
                          });
                        },
                        text: "Edit Profile",
                        icon: Icons.edit,
                      ),
                      SquareButton(
                        ontap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderPage()));
                        },
                        text: "Go Send",
                        icon: Icons.card_giftcard,
                      ),
                      SquareButton(
                        ontap: () async {
                          await HistoryOrderDB().readAllData();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderHistoryPage()));
                        },
                        text: "Order History",
                        icon: Icons.history,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BaseButton(
                    ontap: () async {
                      bool isAllow = false;
                      isAllow = await Alertx().confirmDialog(title: 'Delete Account', desc: 'Are You Sure, Want To Delete Your Account? ');
                      if (isAllow) {
                        await LocalDatabase().delete(1);
                        await HistoryOrderDB().deleteAllData();
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                      } else {
                        Get.back();
                      }
                    },
                    text: "Delete Account",
                    icon: Icons.logout,
                    iconColor: Colors.white,
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
