// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:my_send/extention/colors.dart';
import 'package:my_send/extention/ext_text.dart';

class SquareButton extends StatelessWidget {
  final IconData? icon;
  final String? text;
  final Function() ontap;
  const SquareButton({
    Key? key,
    this.icon,
    this.text,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(color: OThirdColor, borderRadius: BorderRadius.circular(20)),
            child: Icon(
              icon,
              size: 40,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          text == null ? Text("").p10m() : Text(text!).p10m()
        ],
      ),
    );
  }
}
