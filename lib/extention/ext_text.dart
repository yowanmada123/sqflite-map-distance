import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_send/extention/colors.dart';

extension TextExtension on Text {
  Text gray() => copyWith(style: const TextStyle(color: Color(0xff99A4AB)));
  Text p80eb() => copyWith(style: GoogleFonts.poppins(fontSize: 80, fontWeight: FontWeight.w900));
  Text p52eb() => copyWith(style: GoogleFonts.poppins(fontSize: 45, fontWeight: FontWeight.w900));
  Text p24b() => copyWith(style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w700));
  Text p20b() => copyWith(style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700));
  Text p18b() => copyWith(style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700));
  Text p18m() => copyWith(style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600));
  Text p18r() => copyWith(style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w400));
  Text p16m() => copyWith(style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600));
  Text p16b() => copyWith(style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w700));
  Text p16r() => copyWith(style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400));
  Text p15m() => copyWith(style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600));
  Text p15r() => copyWith(style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w400));
  Text p14m() => copyWith(style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600));
  Text p14b() => copyWith(style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w700));
  Text p14r() => copyWith(style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400));
  Text p12m() => copyWith(style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600));
  Text p12b() => copyWith(style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w700));
  Text p12r() => copyWith(style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w400));
  Text p12l() => copyWith(style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w200));
  Text p10m() => copyWith(style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w600));
  Text p10r() => copyWith(style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w400));
  Text p10b() => copyWith(style: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w700));
  Text p9r() => copyWith(style: GoogleFonts.poppins(fontSize: 9, fontWeight: FontWeight.w400));
  Text p9b() => copyWith(style: GoogleFonts.poppins(fontSize: 9, fontWeight: FontWeight.w700));
  Text p8r() => copyWith(style: GoogleFonts.poppins(fontSize: 8, fontWeight: FontWeight.w400));

  Text primary() => copyWith(style: TextStyle(color: OPrimaryColor));
  Text secondary() => copyWith(style: TextStyle(color: OSecondaryColor));
  Text white() => copyWith(style: const TextStyle(color: Colors.white));
  Text red() => copyWith(style: const TextStyle(color: Color.fromARGB(255, 255, 0, 0)));
  Text black() => copyWith(style: const TextStyle(color: Color(0xff050B16)));
  Text grey() => copyWith(style: const TextStyle(color: Color(0xff757575)));

  Text brown() => copyWith(style: const TextStyle(color: Colors.brown));
  Text title() => copyWith(
          style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ));
  Text copyWith({Key? key, StrutStyle? strutStyle, TextAlign? textAlign, TextDirection? textDirection = TextDirection.ltr, Locale? locale, bool? softWrap, TextOverflow? overflow, double? textScaleFactor, int? maxLines, String? semanticsLabel, TextWidthBasis? textWidthBasis, TextStyle? style}) {
    return Text(data ?? '',
        key: key ?? this.key,
        strutStyle: strutStyle ?? this.strutStyle,
        textAlign: textAlign ?? this.textAlign,
        textDirection: textDirection ?? this.textDirection,
        locale: locale ?? this.locale,
        softWrap: softWrap ?? this.softWrap,
        overflow: overflow ?? this.overflow,
        textScaleFactor: textScaleFactor ?? this.textScaleFactor,
        maxLines: maxLines ?? this.maxLines,
        semanticsLabel: semanticsLabel ?? this.semanticsLabel,
        textWidthBasis: textWidthBasis ?? this.textWidthBasis,
        style: style != null ? this.style?.merge(style) ?? style : this.style);
  }
}
