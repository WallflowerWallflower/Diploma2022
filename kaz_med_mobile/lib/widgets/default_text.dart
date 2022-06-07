import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared/size_config.dart';
import '../shared/theme.dart';

class DefaultText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final double fontSize;
  final Color? color;
  final bool? isCenter;
  final bool? isOverFlow;
  final bool isMaxLinesEq2;

  DefaultText({
    required this.text,
    this.fontWeight = FontWeight.w400,
    this.fontSize = 14,
    this.color = Colors.black,
    this.isCenter = true,
    this.isOverFlow = false,
    this.isMaxLinesEq2 = true,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: isCenter! ? TextAlign.center : TextAlign.start,
      overflow: isOverFlow! ? TextOverflow.ellipsis : null,
      maxLines: isMaxLinesEq2 ? 2 : 100,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: getProportionateScreenHeight(fontSize),
        ),
      ),
    );
  }
}
