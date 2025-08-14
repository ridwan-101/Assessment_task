import 'package:flutter/material.dart';
import '../utils/responsive_utils.dart';
import 'responsive_text.dart';

class ResponsiveElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Widget? icon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final bool isLoading;
  final Widget? loadingWidget;

  const ResponsiveElevatedButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation,
    this.padding,
    this.width,
    this.height,
    this.isLoading = false,
    this.loadingWidget,
  });

  @override
  Widget build(BuildContext context) {
    double buttonHeight = height ?? ResponsiveUtils.getResponsiveFontSize(context, 
      mobile: 48, 
      tablet: 52, 
      desktop: 56
    );
    
    double buttonWidth = width ?? ResponsiveUtils.getResponsiveWidth(context, 
      ResponsiveUtils.isMobile(context) ? 0.8 : 0.6
    );

    EdgeInsetsGeometry buttonPadding = padding ?? 
        EdgeInsets.symmetric(
          horizontal: ResponsiveUtils.getResponsivePadding(context, 
            mobile: 16, 
            tablet: 24, 
            desktop: 32
          ),
          vertical: ResponsiveUtils.getResponsivePadding(context, 
            mobile: 12, 
            tablet: 16, 
            desktop: 20
          ),
        );

    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          elevation: elevation,
          padding: buttonPadding,
        ),
        child: isLoading
            ? (loadingWidget ?? const CircularProgressIndicator())
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    icon!,
                    SizedBox(width: ResponsiveUtils.getResponsiveMargin(context)),
                  ],
                  ResponsiveText(
                    text,
                    fontWeight: FontWeight.w600,
                    color: foregroundColor,
                  ),
                ],
              ),
      ),
    );
  }
}

class ResponsiveOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Widget? icon;
  final Color? foregroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final bool isLoading;
  final Widget? loadingWidget;

  const ResponsiveOutlinedButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.foregroundColor,
    this.borderColor,
    this.borderWidth,
    this.padding,
    this.width,
    this.height,
    this.isLoading = false,
    this.loadingWidget,
  });

  @override
  Widget build(BuildContext context) {
    double buttonHeight = height ?? ResponsiveUtils.getResponsiveFontSize(context, 
      mobile: 48, 
      tablet: 52, 
      desktop: 56
    );
    
    double buttonWidth = width ?? ResponsiveUtils.getResponsiveWidth(context, 
      ResponsiveUtils.isMobile(context) ? 0.8 : 0.6
    );

    EdgeInsetsGeometry buttonPadding = padding ?? 
        EdgeInsets.symmetric(
          horizontal: ResponsiveUtils.getResponsivePadding(context, 
            mobile: 16, 
            tablet: 24, 
            desktop: 32
          ),
          vertical: ResponsiveUtils.getResponsivePadding(context, 
            mobile: 12, 
            tablet: 16, 
            desktop: 20
          ),
        );

    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: foregroundColor,
          side: BorderSide(
            color: borderColor ?? Theme.of(context).primaryColor,
            width: borderWidth ?? 1.5,
          ),
          padding: buttonPadding,
        ),
        child: isLoading
            ? (loadingWidget ?? const CircularProgressIndicator())
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    icon!,
                    SizedBox(width: ResponsiveUtils.getResponsiveMargin(context)),
                  ],
                  ResponsiveText(
                    text,
                    fontWeight: FontWeight.w600,
                    color: foregroundColor,
                  ),
                ],
              ),
      ),
    );
  }
}

class ResponsiveTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Widget? icon;
  final Color? foregroundColor;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final bool isLoading;
  final Widget? loadingWidget;

  const ResponsiveTextButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.foregroundColor,
    this.padding,
    this.width,
    this.height,
    this.isLoading = false,
    this.loadingWidget,
  });

  @override
  Widget build(BuildContext context) {
    double buttonHeight = height ?? ResponsiveUtils.getResponsiveFontSize(context, 
      mobile: 40, 
      tablet: 44, 
      desktop: 48
    );
    
    double buttonWidth = width ?? ResponsiveUtils.getResponsiveWidth(context, 
      ResponsiveUtils.isMobile(context) ? 0.6 : 0.4
    );

    EdgeInsetsGeometry buttonPadding = padding ?? 
        EdgeInsets.symmetric(
          horizontal: ResponsiveUtils.getResponsivePadding(context, 
            mobile: 12, 
            tablet: 16, 
            desktop: 20
          ),
          vertical: ResponsiveUtils.getResponsivePadding(context, 
            mobile: 8, 
            tablet: 12, 
            desktop: 16
          ),
        );

    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: TextButton(
        onPressed: isLoading ? null : onPressed,
        style: TextButton.styleFrom(
          foregroundColor: foregroundColor,
          padding: buttonPadding,
        ),
        child: isLoading
            ? (loadingWidget ?? const CircularProgressIndicator())
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    icon!,
                    SizedBox(width: ResponsiveUtils.getResponsiveMargin(context)),
                  ],
                  ResponsiveText(
                    text,
                    fontWeight: FontWeight.w500,
                    color: foregroundColor,
                  ),
                ],
              ),
      ),
    );
  }
}

class ResponsiveIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? size;
  final EdgeInsetsGeometry? padding;
  final String? tooltip;

  const ResponsiveIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.size,
    this.padding,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    double iconSize = size ?? ResponsiveUtils.getResponsiveIconSize(context);
    
    EdgeInsetsGeometry buttonPadding = padding ?? 
        EdgeInsets.all(ResponsiveUtils.getResponsiveMargin(context));

    return Container(
      padding: buttonPadding,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, size: iconSize),
        style: IconButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
        ),
        tooltip: tooltip,
      ),
    );
  }
}

class ResponsiveFloatingActionButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? size;
  final String? tooltip;

  const ResponsiveFloatingActionButton({
    super.key,
    required this.child,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.size,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    double buttonSize = size ?? ResponsiveUtils.getResponsiveIconSize(context, 
      mobile: 56, 
      tablet: 64, 
      desktop: 72
    );

    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      tooltip: tooltip,
      child: SizedBox(
        width: buttonSize * 0.6,
        height: buttonSize * 0.6,
        child: child,
      ),
    );
  }
}
