import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hellomoney/screens/dashboard_page.dart';
import 'package:hellomoney/widgets/recent_transactions_widget.dart';
import 'package:hellomoney/widgets/app_tour_manager.dart';
import 'package:hellomoney/screens/send_money_page.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView({super.key});

  @override
  State<BottomBarView> createState() => _BottomBarViewState();
}

/// Class handling bottom bar of the application
class _BottomBarViewState extends State<BottomBarView> {
  int currentTab = 0;
  Widget currentScreen = const DashboardPage();
  int currentTourStep = 0;
  bool isTourActive = false;

  void startTour() {
    setState(() {
      isTourActive = true;
      currentTourStep = 0;
    });
    _showCurrentTourStep();
  }

  void _showCurrentTourStep() {
    if (!isTourActive) return;

    AppTourManager.showTourOverlay(
      context,
      currentTourStep,
      onNext: () {
        if (currentTourStep < AppTourManager.tourSteps.length - 1) {
          setState(() {
            currentTourStep++;
          });
          _showCurrentTourStep();
        } else {
          setState(() {
            isTourActive = false;
            currentTourStep = 0;
          });
          // Ensure dashboard is visible after tour completion
          Navigator.of(context).popUntil((route) => route.isFirst);
        }
      },
      onPrev: () {
        if (currentTourStep > 0) {
          setState(() {
            currentTourStep--;
          });
          _showCurrentTourStep();
        }
      },
      onClose: () {
        setState(() {
          isTourActive = false;
          currentTourStep = 0;
        });
        // Ensure dashboard is visible after tour close
        Navigator.of(context).popUntil((route) => route.isFirst);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentScreen,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF3B82F6),
        shape: const CircleBorder(),
        onPressed: () {
          // Navigate to send money page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SendMoneyPage()),
          );
        },
        child: Image.asset(
          'assets/png/send.png',
          height: 64.h,
          width: 64.w,
          fit: BoxFit.cover,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left side - First two items
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    bottomDetails(
                      'assets/svg/home.svg',
                      0,
                      'Dashboard',
                      const DashboardPage(),
                    ),
                    const SizedBox(width: 15),
                    bottomDetails(
                      'assets/svg/transactionicon.svg',
                      1,
                      'Transactions',
                      const TransactionView(),
                    ),
                  ],
                ),
              ),
              // Center space for floating action button
              SizedBox(width: 60),
              // Right side - Last two items
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    bottomDetails(
                      'assets/svg/setting-2.svg',
                      2,
                      'Settings',
                      const SettingsView(),
                    ),
                    const SizedBox(width: 15),
                    bottomDetails(
                      'assets/svg/profileicon.svg',
                      3,
                      'Profile',
                      const ProfileView(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Bottom bar details function
  Widget bottomDetails(
    String iconPath,
    int index,
    String label,
    Widget screen,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentScreen = screen;
          currentTab = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            height: 25.h,
            width: 30.w,
            colorFilter: ColorFilter.mode(
              currentTab == index
                  ? const Color(0xFF1E40AF)
                  : Colors.grey.shade400,
              BlendMode.srcIn,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color:
                  currentTab == index
                      ? const Color(0xFF1E40AF)
                      : Colors.grey.shade400,
            ),
          ),
        ],
      ),
    );
  }
}

// Placeholder screens with better naming
class TransactionView extends StatelessWidget {
  const TransactionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF036BDD),
        elevation: 0,
        title: const Text(
          'Transactions',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 16),
            const RecentTransactionsWidget(showAllTransactions: true),
            const SizedBox(height: 100), // Space for bottom navigation
          ],
        ),
      ),
    );
  }
}

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Settings View',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Profile View',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
