import 'package:flutter/material.dart';
import 'package:hellomoney/widgets/app_tour_widget.dart';
import 'package:hellomoney/theme/app_theme.dart';

class AppTourManager {
  static const List<Map<String, String>> tourSteps = [
    {
      'title': 'Send',
      'content':
          'Tap to send money to anyone, instantly.\nFast and secure — whether local or international.',
    },
    {
      'title': 'Account Details',
      'content':
          'View your account number and banking info for sending or receiving funds.\nShare details easily to get paid.',
    },
    {
      'title': 'Add Funds',
      'content':
          'Top up your account balance from a linked card or bank.\nQuick and seamless funding.',
    },
    {
      'title': 'Conversion',
      'content':
          'Exchange your funds into other currencies with ease.\nReal-time rates, no stress.',
    },
    {
      'title': 'More',
      'content':
          'Explore additional features and settings.\nEverything else you might need, in one place.',
    },
    {
      'title': 'Settings',
      'content':
          'Manage your account.\nTap here to adjust preferences, change security settings, or manage notifications.',
    },
    {
      'title': 'Transactions',
      'content':
          'Keep track of your money\nHere you can view all your transaction history, transfers, top-ups, conversions, and more.',
    },
    {
      'title': 'Profile',
      'content':
          'Your personal info\nReview and update your name, email, ID documents, and other personal details.',
    },
  ];

  static void showTourOverlay(
    BuildContext context,
    int currentStep, {
    required VoidCallback onNext,
    required VoidCallback onPrev,
    required VoidCallback onClose,
  }) {
    final step = tourSteps[currentStep];
    final isFirstStep = currentStep == 0;
    final isLastStep = currentStep == tourSteps.length - 1;

    Navigator.of(context).popUntil((route) => route.isFirst);

    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: AppTheme.overlayColor,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Stack(
            children: [
              Positioned(
                top: _getTooltipPosition(currentStep).dy,
                left: _getTooltipPosition(currentStep).dx,
                child: AppTourWidget(
                  title: step['title']!,
                  content: step['content']!,
                  onNext: () {
                    Navigator.of(context).pop();
                    onNext();
                  },
                  onPrev:
                      isFirstStep
                          ? null
                          : () {
                            Navigator.of(context).pop();
                            onPrev();
                          },
                  onClose: () {
                    Navigator.of(context).pop();
                    onClose();
                  },
                  showPrevButton: !isFirstStep,
                  showNextButton: true,
                  isLastStep: isLastStep,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static Offset _getTooltipPosition(int step) {
    switch (step) {
      case 0:
        return const Offset(70, 520);
      case 1:
        return const Offset(20, 280);
      case 2:
        return const Offset(70, 280);
      case 3:
        return const Offset(120, 280);
      case 4:
        return const Offset(170, 280);
      case 5:
        return const Offset(20, 580);
      case 6:
        return const Offset(70, 580);
      case 7:
        return const Offset(170, 580);
      default:
        return const Offset(70, 300);
    }
  }
}
