import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hellomoney/widgets/bottom_navigator.dart';
import 'theme/app_theme.dart';
import 'package:hellomoney/widgets/app_tour_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'HelloMoney - Responsive Demo',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          home: const AppLauncher(),
        );
      },
    );
  }
}

class AppLauncher extends StatefulWidget {
  const AppLauncher({super.key});

  @override
  State<AppLauncher> createState() => _AppLauncherState();
}

class _AppLauncherState extends State<AppLauncher> {
  @override
  void initState() {
    super.initState();
    // Start the tour after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAppTour();
    });
  }

  void _startAppTour() {
    // Show the first tour step
    AppTourManager.showTourOverlay(
      context,
      0, // Start with first step
      onNext: () {
        _showNextTourStep(1);
      },
      onPrev: () {
        // No previous action on first step
      },
      onClose: () {
        // Tour closed, ensure dashboard is visible
        _ensureDashboardVisible();
      },
    );
  }

  void _showNextTourStep(int step) {
    if (step < AppTourManager.tourSteps.length) {
      AppTourManager.showTourOverlay(
        context,
        step,
        onNext: () {
          _showNextTourStep(step + 1);
        },
        onPrev: () {
          _showNextTourStep(step - 1);
        },
        onClose: () {
          // Tour closed, ensure dashboard is visible
          _ensureDashboardVisible();
        },
      );
    } else {
      // Tour completed, ensure dashboard is visible
      _ensureDashboardVisible();
    }
  }

  void _ensureDashboardVisible() {
    // Ensure all dialogs are closed and dashboard is visible
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return const BottomBarView();
  }
}
