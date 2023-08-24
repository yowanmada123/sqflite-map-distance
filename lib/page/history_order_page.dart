import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_send/extention/colors.dart';
import 'package:my_send/extention/ext_text.dart';
import 'package:my_send/historyDB.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Order History").p18b(),
          backgroundColor: OPrimaryColor,
        ),
        body: Container(
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: Get.height,
                  child: ListView.builder(
                      itemCount: historyOrder!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return index == 0
                            ? Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Card(
                                    elevation: 4,
                                    borderOnForeground: true,
                                    child: Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: Colors.grey, width: 0.2)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius: const BorderRadius.all(Radius.circular(1000)),
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child: FittedBox(
                                                  fit: BoxFit.cover,
                                                  child: Image.file(
                                                    File(historyOrder[index]['itemPhotoPath']),
                                                    fit: BoxFit.fitWidth,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "${historyOrder[index]['title']}   -   ",
                                                            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                                                          ),
                                                          Text(
                                                            historyOrder[index]['createdAt'],
                                                            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 2,
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                          Icons.location_on_rounded,
                                                          color: Colors.redAccent,
                                                          size: 10,
                                                        ),
                                                        Container(
                                                          width: 180,
                                                          child: Text(
                                                            historyOrder[index]['alamatPenjemputan'],
                                                            style: TextStyle(fontSize: 6, fontWeight: FontWeight.bold),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                          Icons.location_on_rounded,
                                                          color: Colors.green,
                                                          size: 10,
                                                        ),
                                                        Container(
                                                          width: 180,
                                                          child: Text(
                                                            historyOrder[index]['alamatTujuan'],
                                                            style: TextStyle(fontSize: 6, fontWeight: FontWeight.bold),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 8.0),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                        children: [
                                                          Text(
                                                            historyOrder[index]['jarakPengiriman'],
                                                            style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : index == historyOrder.length - 1
                                ? Column(
                                    children: [
                                      Card(
                                        elevation: 4,
                                        borderOnForeground: true,
                                        child: Container(
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: Colors.grey, width: 0.2)),
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                ClipRRect(
                                                  borderRadius: const BorderRadius.all(Radius.circular(1000)),
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child: FittedBox(
                                                      fit: BoxFit.cover,
                                                      child: Image.file(
                                                        File(historyOrder[index]['itemPhotoPath']),
                                                        fit: BoxFit.fitWidth,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                "${historyOrder[index]['title']}   -   ",
                                                                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                                                              ),
                                                              Text(
                                                                historyOrder[index]['createdAt'],
                                                                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 2,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons.location_on_rounded,
                                                              color: Colors.redAccent,
                                                              size: 10,
                                                            ),
                                                            Container(
                                                              width: 180,
                                                              child: Text(
                                                                historyOrder[index]['alamatPenjemputan'],
                                                                style: TextStyle(fontSize: 6, fontWeight: FontWeight.bold),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons.location_on_rounded,
                                                              color: Colors.green,
                                                              size: 10,
                                                            ),
                                                            Container(
                                                              width: 180,
                                                              child: Text(
                                                                historyOrder[index]['alamatTujuan'],
                                                                style: TextStyle(fontSize: 6, fontWeight: FontWeight.bold),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(right: 8.0),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                            crossAxisAlignment: CrossAxisAlignment.end,
                                                            children: [
                                                              Text(
                                                                historyOrder[index]['jarakPengiriman'],
                                                                style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 100,
                                      ),
                                    ],
                                  )
                                : Column(
                                    children: [
                                      Card(
                                        elevation: 4,
                                        borderOnForeground: true,
                                        child: Container(
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), border: Border.all(color: Colors.grey, width: 0.2)),
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                ClipRRect(
                                                  borderRadius: const BorderRadius.all(Radius.circular(1000)),
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child: FittedBox(
                                                      fit: BoxFit.cover,
                                                      child: Image.file(
                                                        File(historyOrder[index]['itemPhotoPath']),
                                                        fit: BoxFit.fitWidth,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                "${historyOrder[index]['title']}   -   ",
                                                                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                                                              ),
                                                              Text(
                                                                historyOrder[index]['createdAt'],
                                                                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 2,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons.location_on_rounded,
                                                              color: Colors.redAccent,
                                                              size: 10,
                                                            ),
                                                            Container(
                                                              width: 180,
                                                              child: Text(
                                                                historyOrder[index]['alamatPenjemputan'],
                                                                style: TextStyle(fontSize: 6, fontWeight: FontWeight.bold),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Icon(
                                                              Icons.location_on_rounded,
                                                              color: Colors.green,
                                                              size: 10,
                                                            ),
                                                            Container(
                                                              width: 180,
                                                              child: Text(
                                                                historyOrder[index]['alamatTujuan'],
                                                                style: TextStyle(fontSize: 6, fontWeight: FontWeight.bold),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(right: 8.0),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                            crossAxisAlignment: CrossAxisAlignment.end,
                                                            children: [
                                                              Text(
                                                                historyOrder[index]['jarakPengiriman'],
                                                                style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                    ],
                                  );
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
