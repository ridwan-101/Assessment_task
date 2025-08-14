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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAppTour();
    });
  }

  void _startAppTour() {
    AppTourManager.showTourOverlay(
      context,
      0,
      onNext: () {
        _showNextTourStep(1);
      },
      onPrev: () {},
      onClose: () {
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
          _ensureDashboardVisible();
        },
      );
    } else {
      _ensureDashboardVisible();
    }
  }

  void _ensureDashboardVisible() {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return const BottomBarView();
  }
}
