import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/responsive_utils.dart';
import 'responsive_text.dart';

class ResponsiveTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final int? maxLines;
  final int? maxLength;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? fillColor;
  final bool filled;
  final BorderRadius? borderRadius;

  const ResponsiveTextField({
    super.key,
    this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.maxLines = 1,
    this.maxLength,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.inputFormatters,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.fillColor,
    this.filled = false,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    double fieldHeight = height ?? ResponsiveUtils.getResponsiveFontSize(context, 
      mobile: 56, 
      tablet: 60, 
      desktop: 64
    );
    
    double fieldWidth = width ?? ResponsiveUtils.getResponsiveWidth(context, 
      ResponsiveUtils.isMobile(context) ? 0.9 : 0.7
    );

    EdgeInsetsGeometry fieldPadding = padding ?? 
        ResponsiveUtils.getResponsiveEdgeInsets(context, 
          horizontal: 16, 
          vertical: 8
        );

    EdgeInsetsGeometry fieldMargin = margin ?? 
        EdgeInsets.all(ResponsiveUtils.getResponsiveMargin(context));

    return Container(
      width: fieldWidth,
      height: fieldHeight,
      margin: fieldMargin,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        enabled: enabled,
        readOnly: readOnly,
        maxLines: maxLines,
        maxLength: maxLength,
        onTap: onTap,
        onChanged: onChanged,
        onFieldSubmitted: onSubmitted,
        validator: validator,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          helperText: helperText,
          errorText: errorText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          filled: filled,
          fillColor: fillColor,
          contentPadding: fieldPadding,
          border: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Theme.of(context).dividerColor,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error,
              width: 1.5,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}

class ResponsiveSearchField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onClear;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const ResponsiveSearchField({
    super.key,
    this.hintText,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.width,
    this.height,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    double fieldHeight = height ?? ResponsiveUtils.getResponsiveFontSize(context, 
      mobile: 48, 
      tablet: 52, 
      desktop: 56
    );
    
    double fieldWidth = width ?? ResponsiveUtils.getResponsiveWidth(context, 
      ResponsiveUtils.isMobile(context) ? 0.85 : 0.6
    );

    EdgeInsetsGeometry fieldPadding = padding ?? 
        ResponsiveUtils.getResponsiveEdgeInsets(context, 
          horizontal: 16, 
          vertical: 8
        );

    EdgeInsetsGeometry fieldMargin = margin ?? 
        EdgeInsets.all(ResponsiveUtils.getResponsiveMargin(context));

    return Container(
      width: fieldWidth,
      height: fieldHeight,
      margin: fieldMargin,
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        decoration: InputDecoration(
          hintText: hintText ?? 'Search...',
          prefixIcon: Icon(
            Icons.search,
            size: ResponsiveUtils.getResponsiveIconSize(context, 
              mobile: 20, 
              tablet: 22, 
              desktop: 24
            ),
          ),
          suffixIcon: controller?.text.isNotEmpty == true
              ? IconButton(
                  onPressed: onClear ?? () => controller?.clear(),
                  icon: Icon(
                    Icons.clear,
                    size: ResponsiveUtils.getResponsiveIconSize(context, 
                      mobile: 20, 
                      tablet: 22, 
                      desktop: 24
                    ),
                  ),
                )
              : null,
          filled: true,
          fillColor: Theme.of(context).colorScheme.surface,
          contentPadding: fieldPadding,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}

class ResponsiveDropdownField<T> extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final T? value;
  final List<T> items;
  final String Function(T)? itemToString;
  final Widget Function(T)? itemToWidget;
  final ValueChanged<T?>? onChanged;
  final FormFieldValidator<T>? validator;
  final bool enabled;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? fillColor;
  final bool filled;
  final BorderRadius? borderRadius;

  const ResponsiveDropdownField({
    super.key,
    this.labelText,
    this.hintText,
    this.errorText,
    this.value,
    required this.items,
    this.itemToString,
    this.itemToWidget,
    this.onChanged,
    this.validator,
    this.enabled = true,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.fillColor,
    this.filled = false,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    double fieldHeight = height ?? ResponsiveUtils.getResponsiveFontSize(context, 
      mobile: 56, 
      tablet: 60, 
      desktop: 64
    );
    
    double fieldWidth = width ?? ResponsiveUtils.getResponsiveWidth(context, 
      ResponsiveUtils.isMobile(context) ? 0.9 : 0.7
    );

    EdgeInsetsGeometry fieldPadding = padding ?? 
        ResponsiveUtils.getResponsiveEdgeInsets(context, 
          horizontal: 16, 
          vertical: 8
        );

    EdgeInsetsGeometry fieldMargin = margin ?? 
        EdgeInsets.all(ResponsiveUtils.getResponsiveMargin(context));

    return Container(
      width: fieldWidth,
      height: fieldHeight,
      margin: fieldMargin,
      child: DropdownButtonFormField<T>(
        value: value,
        items: items.map((T item) {
          return DropdownMenuItem<T>(
            value: item,
            child: itemToWidget?.call(item) ?? 
                ResponsiveText(
                  itemToString?.call(item) ?? item.toString(),
                ),
          );
        }).toList(),
        onChanged: enabled ? onChanged : null,
        validator: validator,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          errorText: errorText,
          filled: filled,
          fillColor: fillColor,
          contentPadding: fieldPadding,
          border: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Theme.of(context).dividerColor,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error,
              width: 1.5,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
