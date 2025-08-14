import 'package:flutter/material.dart';

class CurrencyIconWidget extends StatelessWidget {
  final String currencyCode;
  final double width;
  final double height;
  final double borderRadius;
  final BoxFit fit;

  const CurrencyIconWidget({
    super.key,
    required this.currencyCode,
    this.width = 24,
    this.height = 16,
    this.borderRadius = 2,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Image.asset(
          _getCurrencyIconPath(currencyCode),
          width: width,
          height: height,
          fit: fit,
        ),
      ),
    );
  }

  String _getCurrencyIconPath(String currencyCode) {
    switch (currencyCode.toUpperCase()) {
      case 'UK':
      case 'GBP':
        return 'assets/png/ukicon.png';
      case 'NGN':
      case 'NIGERIA':
        return 'assets/png/nigeriaicon.png';
      case 'EUR':
      case 'EUROPE':
        return 'assets/png/eruope.png';
      default:
        return 'assets/png/ukicon.png';
    }
  }
}
