import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_send/extention/colors.dart';
import 'package:my_send/extention/ext_text.dart';

class BaseButton extends StatelessWidget {
  final IconData? icon;
  final String? text;
  final double? textSize;
  final TextStyle? textStyle;
  final FontWeight? textWeight;
  final Color? color;
  final Color? textColor;
  final Function() ontap;
  final String? image;
  final String? iconSvg;
  final Color? iconColor;
  final Color? outlineColor;
  final double? outlineRadius;
  final double? height;
  final double? width;
  const BaseButton({Key? key, this.icon, this.text, this.color, required this.ontap, this.textColor, this.image, this.iconSvg, this.outlineColor, this.outlineRadius, this.height, this.width, this.textSize, this.textWeight, this.textStyle, this.iconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: (height == null) ? 48 : height,
        width: (height == null) ? MediaQuery.of(context).size.width : width,
        decoration: BoxDecoration(color: (color == null) ? OPrimaryColor : color, borderRadius: BorderRadius.circular((outlineRadius == null) ? 8 : outlineRadius!), border: Border.all(color: (outlineColor == null) ? Colors.transparent : outlineColor!)),
        child: Center(
          child: (icon == null && image == null && iconSvg == null)
              ? Center(
                  child: Text(
                    text!,
                    style: GoogleFonts.poppins(fontSize: (textSize == null) ? 18 : textSize, color: (textColor == null) ? Colors.white : textColor, fontWeight: (textWeight == null) ? FontWeight.w700 : textWeight),
                    textAlign: TextAlign.center, // TextStyle(fontSize: (textSize == null) ? 18 : textSize, color: , fontWeight: (textWeight == null) ? FontWeight.w700 : textWeight),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (image == null) ...[
                      if (iconSvg == null) ...[
                        Icon(
                          icon,
                          color: (iconColor == null ? Colors.black : iconColor),
                        )
                      ]
                      // else ...[SvgPicture.asset(iconSvg!)]
                    ] else ...[
                      Image.asset(
                        image!,
                        width: 24,
                        height: 24,
                      )
                    ],
                    const SizedBox(
                      width: 8,
                    ),
                    (textColor == null)
                        ? Text(
                            text == null ? "" : text!,
                            style: GoogleFonts.poppins(fontSize: (textSize == null) ? 18 : textSize, color: (textColor == null) ? Colors.white : textColor, fontWeight: (textWeight == null) ? FontWeight.w700 : textWeight),
                          ).white()
                        : Text(
                            text == null ? "" : text!,
                            style: GoogleFonts.poppins(fontSize: (textSize == null) ? 18 : textSize, color: (textColor == null) ? Colors.white : textColor, fontWeight: (textWeight == null) ? FontWeight.w700 : textWeight),
                          )
                    // .pageTitleText()
                  ],
                ),
        ),
      ),
    );
  }
}
