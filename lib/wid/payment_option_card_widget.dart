import 'package:flutter/material.dart';

class PaymentOptionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final String imagePath;
  final Color backgroundColor;
  final Color borderColor;
  final VoidCallback? onTap;
  final double width;
  final double height;

  const PaymentOptionCard({
    Key? key,
    required this.title,
    this.subtitle = '',
    required this.description,
    required this.imagePath,
    this.backgroundColor = Colors.white,
    this.borderColor = const Color(0xFF036BDD),
    this.onTap,
    this.width = 188,
    this.height = 255,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor, width: 2),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image container
              Container(
                height: 60,
                width: 60,
                child: Image.asset(imagePath, fit: BoxFit.contain),
              ),
              const SizedBox(height: 16),

              // Title with subtitle
              Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF05244C),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  if (subtitle.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ],
              ),

              const SizedBox(height: 12),

              // Description
              Expanded(
                child: Text(
                  description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
