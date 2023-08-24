import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_send/extention/colors.dart';
import 'package:my_send/extention/ext_text.dart';

class CustomFixedForm extends StatefulWidget {
  const CustomFixedForm({
    super.key,
    required this.title,
    required this.content,
    // this.height,
    this.ontap,
    this.backgroundColor,
    this.cornerIcon,
    this.ontapIcon,
    this.isMust,
    this.uboundedHeight,
  });
  final String content;
  final String title;
  final bool? uboundedHeight;
  final Function()? ontap;
  final Color? backgroundColor;
  final IconData? cornerIcon;
  final Function()? ontapIcon;
  final bool? isMust;

  @override
  State<CustomFixedForm> createState() => _CustomFixedFormState();
}

class _CustomFixedFormState extends State<CustomFixedForm> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: 30,
            child: RichText(
              text: TextSpan(
                text: widget.title,
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600),
                children: <TextSpan>[
                  TextSpan(
                    text: (widget.isMust == true) ? '*' : '',
                    style: GoogleFonts.poppins(color: const Color(0xffF1416C), fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          (widget.uboundedHeight == false)
              ? Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  width: MediaQuery.of(context).size.width,
                  height: 46,
                  decoration: BoxDecoration(color: (widget.backgroundColor == null) ? Color(0xffD0F4FF) : widget.backgroundColor, borderRadius: BorderRadius.circular(10), border: Border.all(color: Color.fromARGB(255, 40, 245, 57))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.cornerIcon == null) ...[
                        Text(widget.content).p12m().grey(),
                      ] else ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(widget.content).p12m().grey(),
                            GestureDetector(
                              onTap: widget.ontapIcon,
                              child: Icon(
                                widget.cornerIcon,
                                color: OPrimaryColor,
                                size: 15,
                              ),
                            )
                          ],
                        )
                      ]
                    ],
                  ),
                )
              : Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  width: MediaQuery.of(context).size.width,
                  // height:    46,
                  decoration: BoxDecoration(color: (widget.backgroundColor == null) ? Color.fromARGB(255, 221, 255, 208) : widget.backgroundColor, borderRadius: BorderRadius.circular(10), border: Border.all(color: Color.fromARGB(255, 40, 245, 78))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (widget.cornerIcon == null) ...[
                        Text(widget.content).p12m().grey(),
                      ] else ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(widget.content).p12m().grey(),
                            GestureDetector(
                              onTap: widget.ontapIcon,
                              child: Icon(
                                widget.cornerIcon,
                                color: OPrimaryColor,
                                size: 15,
                              ),
                            )
                          ],
                        )
                      ]
                    ],
                  ),
                ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
