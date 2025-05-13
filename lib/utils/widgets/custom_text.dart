import 'package:pretium_app/utils/exports.dart';

Widget customText(String text,
    {Color? color,
    double fontSize = 14,
    double? letterSpacing,
    double? height,
    TextAlign? textAlign,
    int? maxLines,
    TextOverflow overflow = TextOverflow.visible,
    TextDecoration? decoration,
    FontWeight? fontWeight,
    bool blur = false}) {
  return Text(
    text,
    textAlign: textAlign,
    maxLines: maxLines,
    overflow: overflow,
    softWrap: true,
    style: TextStyle(
      fontFamily: GoogleFonts.albertSans().fontFamily!,
      fontFamilyFallback: [GoogleFonts.montserrat().fontFamily!],
      color: color,
      letterSpacing: letterSpacing,
      fontSize: fontSize,
      height: height,
      fontWeight: fontWeight,
      decoration: decoration,
    ),
  );
}
