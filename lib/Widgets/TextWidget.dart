import 'package:task/Utils/allExports.dart';

class TextWidget extends StatelessWidget {
  final dynamic text;
  final TextAlign? textAlign;
  final Color? color;

  final Color? decorationColor;
  final String? fontFamily;
  final double? fontSize;
  final double? decorationThickness;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;
  final int? maxLines;
  final double? height;
  final double? wordSpacing;
  final double? letterSpacing;
  final List<Shadow>? shadows;
  final TextStyle? style;

  final bool useGoogleFont;

  const TextWidget({
    super.key,
    required this.text,
    this.textAlign,
    this.style,
    this.color,
    this.fontFamily,
    this.fontSize,
    this.overflow,
    this.fontWeight,
    this.decoration,
    this.maxLines,
    this.height,
    this.wordSpacing,
    this.letterSpacing,
    this.decorationColor,
    this.decorationThickness,
    this.shadows,
    this.useGoogleFont = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      style: style ??
          (useGoogleFont
              ? GoogleFonts.getFont(
                  fontFamily ?? 'Lato',
                  textStyle: TextStyle(
                    color: color ?? AppColors.kBlack,
                    height: height,
                    decoration: decoration,
                    fontSize: fontSize,
                    letterSpacing: letterSpacing,
                    wordSpacing: wordSpacing,
                    fontWeight: fontWeight,
                    decorationColor: decorationColor,
                    decorationThickness: decorationThickness,
                    overflow: overflow,
                    shadows: shadows,
                  ),
                )
              : TextStyle(
                  color: color ?? AppColors.kBlack,
                  height: height,
                  decoration: decoration,
                  fontFamily: fontFamily,
                  overflow: overflow,
                  fontSize: fontSize,
                  shadows: shadows,
                  letterSpacing: letterSpacing,
                  wordSpacing: wordSpacing,
                  fontWeight: fontWeight,
                  decorationColor: decorationColor,
                  decorationThickness: decorationThickness,
                )),
    );
  }
}
