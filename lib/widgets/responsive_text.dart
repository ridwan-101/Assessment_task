import 'package:flutter/material.dart';
import '../utils/responsive_utils.dart';

class ResponsiveText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;
  final double? mobileFontSize;
  final double? tabletFontSize;
  final double? desktopFontSize;
  final FontWeight? fontWeight;
  final Color? color;

  const ResponsiveText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap,
    this.mobileFontSize,
    this.tabletFontSize,
    this.desktopFontSize,
    this.fontWeight,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    double fontSize = ResponsiveUtils.getResponsiveFontSize(
      context,
      mobile: mobileFontSize ?? 14,
      tablet: tabletFontSize ?? 16,
      desktop: desktopFontSize ?? 18,
    );

    TextStyle textStyle = style?.copyWith(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ) ??
        TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        );

    return Text(
      text,
      style: textStyle,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }
}

class ResponsiveHeadline extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final Color? color;
  final FontWeight? fontWeight;
  final double? mobileFontSize;
  final double? tabletFontSize;
  final double? desktopFontSize;

  const ResponsiveHeadline(
    this.text, {
    super.key,
    this.textAlign,
    this.color,
    this.fontWeight,
    this.mobileFontSize,
    this.tabletFontSize,
    this.desktopFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveText(
      text,
      textAlign: textAlign,
      color: color,
      fontWeight: fontWeight ?? FontWeight.bold,
      mobileFontSize: mobileFontSize ?? 24,
      tabletFontSize: tabletFontSize ?? 28,
      desktopFontSize: desktopFontSize ?? 32,
    );
  }
}

class ResponsiveTitle extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final Color? color;
  final FontWeight? fontWeight;
  final double? mobileFontSize;
  final double? tabletFontSize;
  final double? desktopFontSize;

  const ResponsiveTitle(
    this.text, {
    super.key,
    this.textAlign,
    this.color,
    this.fontWeight,
    this.mobileFontSize,
    this.tabletFontSize,
    this.desktopFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveText(
      text,
      textAlign: textAlign,
      color: color,
      fontWeight: fontWeight ?? FontWeight.w600,
      mobileFontSize: mobileFontSize ?? 18,
      tabletFontSize: tabletFontSize ?? 20,
      desktopFontSize: desktopFontSize ?? 22,
    );
  }
}

class ResponsiveBodyText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final Color? color;
  final FontWeight? fontWeight;
  final double? mobileFontSize;
  final double? tabletFontSize;
  final double? desktopFontSize;
  final int? maxLines;
  final TextOverflow? overflow;

  const ResponsiveBodyText(
    this.text, {
    super.key,
    this.textAlign,
    this.color,
    this.fontWeight,
    this.mobileFontSize,
    this.tabletFontSize,
    this.desktopFontSize,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveText(
      text,
      textAlign: textAlign,
      color: color,
      fontWeight: fontWeight ?? FontWeight.normal,
      mobileFontSize: mobileFontSize ?? 14,
      tabletFontSize: tabletFontSize ?? 16,
      desktopFontSize: desktopFontSize ?? 18,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

class ResponsiveCaption extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final Color? color;
  final FontWeight? fontWeight;
  final double? mobileFontSize;
  final double? tabletFontSize;
  final double? desktopFontSize;

  const ResponsiveCaption(
    this.text, {
    super.key,
    this.textAlign,
    this.color,
    this.fontWeight,
    this.mobileFontSize,
    this.tabletFontSize,
    this.desktopFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveText(
      text,
      textAlign: textAlign,
      color: color,
      fontWeight: fontWeight ?? FontWeight.normal,
      mobileFontSize: mobileFontSize ?? 12,
      tabletFontSize: tabletFontSize ?? 14,
      desktopFontSize: desktopFontSize ?? 16,
    );
  }
}

class ResponsiveLabel extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final Color? color;
  final FontWeight? fontWeight;
  final double? mobileFontSize;
  final double? tabletFontSize;
  final double? desktopFontSize;

  const ResponsiveLabel(
    this.text, {
    super.key,
    this.textAlign,
    this.color,
    this.fontWeight,
    this.mobileFontSize,
    this.tabletFontSize,
    this.desktopFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveText(
      text,
      textAlign: textAlign,
      color: color,
      fontWeight: fontWeight ?? FontWeight.w500,
      mobileFontSize: mobileFontSize ?? 12,
      tabletFontSize: tabletFontSize ?? 14,
      desktopFontSize: desktopFontSize ?? 16,
    );
  }
}
