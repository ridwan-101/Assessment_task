import 'package:flutter/material.dart';
import '../utils/responsive_utils.dart';

class ResponsiveContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final Decoration? decoration;
  final AlignmentGeometry? alignment;
  final Clip? clipBehavior;
  final double? maxWidth;
  final double? minWidth;
  final double? maxHeight;
  final double? minHeight;

  const ResponsiveContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.color,
    this.decoration,
    this.alignment,
    this.clipBehavior,
    this.maxWidth,
    this.minWidth,
    this.maxHeight,
    this.minHeight,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double responsiveWidth = width ?? constraints.maxWidth;
        double responsiveHeight = height ?? constraints.maxHeight;

        // Apply responsive constraints
        if (maxWidth != null) {
          responsiveWidth = ResponsiveUtils.getResponsiveWidth(
            context,
            maxWidth!,
          );
        }
        if (minWidth != null) {
          responsiveWidth = ResponsiveUtils.getResponsiveWidth(
            context,
            minWidth!,
          );
        }
        if (maxHeight != null) {
          responsiveHeight = ResponsiveUtils.getResponsiveHeight(
            context,
            maxHeight!,
          );
        }
        if (minHeight != null) {
          responsiveHeight = ResponsiveUtils.getResponsiveHeight(
            context,
            minHeight!,
          );
        }

        // Apply responsive padding
        EdgeInsetsGeometry responsivePadding =
            padding ?? ResponsiveUtils.getResponsiveEdgeInsets(context);

        // Apply responsive margin
        EdgeInsetsGeometry responsiveMargin =
            margin ??
            EdgeInsets.all(ResponsiveUtils.getResponsiveMargin(context));

        return Container(
          width: responsiveWidth,
          height: responsiveHeight,
          padding: responsivePadding,
          margin: responsiveMargin,
          color: color,
          decoration: decoration,
          alignment: alignment,
          clipBehavior: clipBehavior ?? Clip.none,
          child: child,
        );
      },
    );
  }
}

class ResponsiveCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final double? elevation;
  final ShapeBorder? shape;
  final Clip? clipBehavior;
  final bool semanticContainer;
  final double? maxWidth;
  final double? minWidth;

  const ResponsiveCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.color,
    this.elevation,
    this.shape,
    this.clipBehavior,
    this.semanticContainer = true,
    this.maxWidth,
    this.minWidth,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double responsiveWidth = constraints.maxWidth;

        if (maxWidth != null) {
          responsiveWidth = ResponsiveUtils.getResponsiveWidth(
            context,
            maxWidth!,
          );
        }
        if (minWidth != null) {
          responsiveWidth = ResponsiveUtils.getResponsiveWidth(
            context,
            minWidth!,
          );
        }

        EdgeInsetsGeometry responsivePadding =
            padding ?? ResponsiveUtils.getResponsiveEdgeInsets(context);

        EdgeInsetsGeometry responsiveMargin =
            margin ??
            EdgeInsets.all(ResponsiveUtils.getResponsiveMargin(context));

        return Card(
          margin: responsiveMargin,
          color: color,
          elevation: elevation,
          shape: shape,
          clipBehavior: clipBehavior,
          semanticContainer: semanticContainer,
          child: Container(
            width: responsiveWidth,
            padding: responsivePadding,
            child: child,
          ),
        );
      },
    );
  }
}

class ResponsivePadding extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const ResponsivePadding({
    super.key,
    required this.child,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    EdgeInsetsGeometry responsivePadding =
        padding ?? ResponsiveUtils.getResponsiveEdgeInsets(context);

    EdgeInsetsGeometry responsiveMargin =
        margin ?? EdgeInsets.all(ResponsiveUtils.getResponsiveMargin(context));

    return Padding(
      padding: responsivePadding,
      child: Container(margin: responsiveMargin, child: child),
    );
  }
}
