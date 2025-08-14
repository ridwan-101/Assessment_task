import 'package:flutter/material.dart';
import '../utils/responsive_utils.dart';

class ResponsiveRow extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;
  final double? spacing;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const ResponsiveRow({
    super.key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.spacing,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    double responsiveSpacing =
        spacing ?? ResponsiveUtils.getResponsiveMargin(context);

    List<Widget> spacedChildren = [];
    for (int i = 0; i < children.length; i++) {
      spacedChildren.add(children[i]);
      if (i < children.length - 1) {
        spacedChildren.add(SizedBox(width: responsiveSpacing));
      }
    }

    return Container(
      padding: padding,
      margin: margin,
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
        children: spacedChildren,
      ),
    );
  }
}

class ResponsiveColumn extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;
  final double? spacing;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const ResponsiveColumn({
    super.key,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisSize = MainAxisSize.max,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.spacing,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    double responsiveSpacing =
        spacing ?? ResponsiveUtils.getResponsiveMargin(context);

    List<Widget> spacedChildren = [];
    for (int i = 0; i < children.length; i++) {
      spacedChildren.add(children[i]);
      if (i < children.length - 1) {
        spacedChildren.add(SizedBox(height: responsiveSpacing));
      }
    }

    return Container(
      padding: padding,
      margin: margin,
      child: Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: mainAxisSize,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        textBaseline: textBaseline,
        children: spacedChildren,
      ),
    );
  }
}

class ResponsiveWrap extends StatelessWidget {
  final List<Widget> children;
  final Axis direction;
  final WrapAlignment alignment;
  final double spacing;
  final double runSpacing;
  final WrapCrossAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final Clip clipBehavior;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const ResponsiveWrap({
    super.key,
    required this.children,
    this.direction = Axis.horizontal,
    this.alignment = WrapAlignment.start,
    this.spacing = 0.0,
    this.runSpacing = 0.0,
    this.crossAxisAlignment = WrapCrossAlignment.start,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.clipBehavior = Clip.none,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    double responsiveSpacing =
        spacing == 0.0 ? ResponsiveUtils.getResponsiveMargin(context) : spacing;

    double responsiveRunSpacing =
        runSpacing == 0.0
            ? ResponsiveUtils.getResponsiveMargin(context)
            : runSpacing;

    return Container(
      padding: padding,
      margin: margin,
      child: Wrap(
        direction: direction,
        alignment: alignment,
        spacing: responsiveSpacing,
        runSpacing: responsiveRunSpacing,
        crossAxisAlignment: crossAxisAlignment,
        textDirection: textDirection,
        verticalDirection: verticalDirection,
        clipBehavior: clipBehavior,
        children: children,
      ),
    );
  }
}

class ResponsiveGridView extends StatelessWidget {
  final List<Widget> children;
  final int? crossAxisCount;
  final double? childAspectRatio;
  final double? crossAxisSpacing;
  final double? mainAxisSpacing;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final bool primary;

  const ResponsiveGridView({
    super.key,
    required this.children,
    this.crossAxisCount,
    this.childAspectRatio,
    this.crossAxisSpacing,
    this.mainAxisSpacing,
    this.padding,
    this.margin,
    this.physics,
    this.shrinkWrap = false,
    this.primary = true,
  });

  @override
  Widget build(BuildContext context) {
    int responsiveCrossAxisCount =
        crossAxisCount ??
        (ResponsiveUtils.isMobile(context)
            ? 2
            : ResponsiveUtils.isTablet(context)
            ? 3
            : 4);

    double responsiveCrossAxisSpacing =
        crossAxisSpacing ?? ResponsiveUtils.getResponsiveMargin(context);

    double responsiveMainAxisSpacing =
        mainAxisSpacing ?? ResponsiveUtils.getResponsiveMargin(context);

    EdgeInsetsGeometry responsivePadding =
        padding ?? ResponsiveUtils.getResponsiveEdgeInsets(context);

    EdgeInsetsGeometry responsiveMargin =
        margin ?? EdgeInsets.all(ResponsiveUtils.getResponsiveMargin(context));

    return Container(
      padding: responsivePadding,
      margin: responsiveMargin,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: responsiveCrossAxisCount,
          childAspectRatio: childAspectRatio ?? 1.0,
          crossAxisSpacing: responsiveCrossAxisSpacing,
          mainAxisSpacing: responsiveMainAxisSpacing,
        ),
        itemCount: children.length,
        physics: physics,
        shrinkWrap: shrinkWrap,
        primary: primary,
        itemBuilder: (context, index) => children[index],
      ),
    );
  }
}

class ResponsiveListView extends StatelessWidget {
  final List<Widget> children;
  final Axis scrollDirection;
  final bool reverse;
  final ScrollController? controller;
  final bool? primary;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? itemExtent;
  final Widget? prototypeItem;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final double? cacheExtent;
  final int? semanticChildCount;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final String? restorationId;
  final Clip clipBehavior;
  final double? spacing;

  const ResponsiveListView({
    super.key,
    required this.children,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap = false,
    this.padding,
    this.margin,
    this.itemExtent,
    this.prototypeItem,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.cacheExtent,
    this.semanticChildCount,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.restorationId,
    this.clipBehavior = Clip.hardEdge,
    this.spacing,
  });

  @override
  Widget build(BuildContext context) {
    double responsiveSpacing =
        spacing ?? ResponsiveUtils.getResponsiveMargin(context);

    List<Widget> spacedChildren = [];
    for (int i = 0; i < children.length; i++) {
      spacedChildren.add(children[i]);
      if (i < children.length - 1 && spacing != null) {
        spacedChildren.add(
          scrollDirection == Axis.vertical
              ? SizedBox(height: responsiveSpacing)
              : SizedBox(width: responsiveSpacing),
        );
      }
    }

    EdgeInsetsGeometry responsivePadding =
        padding ?? ResponsiveUtils.getResponsiveEdgeInsets(context);

    EdgeInsetsGeometry responsiveMargin =
        margin ?? EdgeInsets.all(ResponsiveUtils.getResponsiveMargin(context));

    return Container(
      padding: responsivePadding,
      margin: responsiveMargin,
      child: ListView.builder(
        scrollDirection: scrollDirection,
        reverse: reverse,
        controller: controller,
        primary: primary,
        physics: physics,
        shrinkWrap: shrinkWrap,
        itemExtent: itemExtent,
        prototypeItem: prototypeItem,
        addAutomaticKeepAlives: addAutomaticKeepAlives,
        addRepaintBoundaries: addRepaintBoundaries,
        addSemanticIndexes: addSemanticIndexes,
        cacheExtent: cacheExtent,
        semanticChildCount: semanticChildCount,

        keyboardDismissBehavior: keyboardDismissBehavior,
        restorationId: restorationId,
        clipBehavior: clipBehavior,
        itemCount: spacedChildren.length,
        itemBuilder: (context, index) => spacedChildren[index],
      ),
    );
  }
}

class ResponsiveExpanded extends StatelessWidget {
  final Widget child;
  final int flex;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const ResponsiveExpanded({
    super.key,
    required this.child,
    this.flex = 1,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(padding: padding, margin: margin, child: child),
    );
  }
}

class ResponsiveFlexible extends StatelessWidget {
  final Widget child;
  final int flex;
  final FlexFit fit;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const ResponsiveFlexible({
    super.key,
    required this.child,
    this.flex = 1,
    this.fit = FlexFit.loose,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex,
      fit: fit,
      child: Container(padding: padding, margin: margin, child: child),
    );
  }
}
