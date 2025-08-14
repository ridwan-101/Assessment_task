import 'package:flutter/material.dart' hide CarouselController;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hellomoney/widgets/extension.dart';
import 'package:hellomoney/widgets/recent_transactions_widget.dart';
import 'package:hellomoney/screens/all_transactions_page.dart';
import 'package:hellomoney/widgets/currency_icon_widget.dart';
import 'package:carousel_slider/carousel_slider.dart' as cs;
import 'package:hellomoney/widgets/app_tour_manager.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int currentBalanceIndex = 0;
  int currentBannerIndex = 0;
  int currentTourStep = 0;
  bool isTourActive = false;

  final List<Map<String, dynamic>> balances = [
    {'currency': 'NGN', 'symbol': '₦', 'amount': '0.00', 'flag': 'Nigeria'},
    {'currency': 'GBP', 'symbol': '£', 'amount': '0.00', 'flag': 'UK'},
    {'currency': 'EUR', 'symbol': '€', 'amount': '0.00', 'flag': 'Europe'},
  ];

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
      backgroundColor: const Color(0xFFF1F5F9),
      body: Stack(
        children: [
          Column(
            children: [
              // Fixed Header Section
              Container(
                height: 380,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF036BDD), Color(0xFF1E88FC)],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        // Top Row
                        Row(
                          children: [
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              child: ClipOval(
                                child: Container(
                                  color: Colors.grey[300],
                                  child: const Icon(
                                    Icons.person,
                                    color: Colors.grey,
                                    size: 22,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Text(
                                'Welcome Saito',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              width: 38,
                              height: 38,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Transform.scale(
                                scale: 0.5,
                                child: SvgPicture.asset("assets/svg/bell.svg"),
                              ),
                            ),
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: startTour,
                              child: Container(
                                width: 38,
                                height: 38,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.help_outline,
                                  color: Color(0xFF036BDD),
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 14),

                        // Balance Carousel Section
                        cs.CarouselSlider(
                          options: cs.CarouselOptions(
                            height: 100,
                            autoPlay: false,
                            enlargeCenterPage: false,
                            viewportFraction: 1.0,
                            enableInfiniteScroll: true,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentBalanceIndex = index;
                              });
                            },
                          ),
                          items:
                              balances.map((balance) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Column(
                                      children: [
                                        // Balance section
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CurrencyIconWidget(
                                              currencyCode: balance['currency'],
                                            ),
                                            const SizedBox(width: 6),
                                            Text(
                                              '${balance['currency']} Balance',
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                            const SizedBox(width: 6),
                                            const Icon(
                                              Icons.visibility_off_outlined,
                                              color: Colors.white,
                                              size: 18,
                                            ),
                                          ],
                                        ),

                                        const SizedBox(height: 14),

                                        // Balance amount
                                        Text(
                                          '${balance['symbol']}${balance['amount']}',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 42,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }).toList(),
                        ),

                        // Carousel Indicator Dots
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            balances.length,
                            (index) => Container(
                              width: 8,
                              height: 8,
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    currentBalanceIndex == index
                                        ? Colors.white
                                        : Colors.white.withOpacity(0.3),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 44),

                        // Action buttons
                        Row(
                          children: [
                            Expanded(
                              child: _buildActionButton(
                                Icons.account_balance,
                                'Account',
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _buildActionButton(Icons.add, 'Add fund'),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _buildActionButton(
                                Icons.swap_horiz,
                                'Conversion',
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              height: 44,
                              width: 44,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(22),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.3),
                                ),
                              ),
                              child: const Icon(
                                Icons.more_horiz,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              20.toColumnSpace(),

              // Banner Carousel Section (moved below balance)
              cs.CarouselSlider(
                options: cs.CarouselOptions(
                  height: 140,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  enableInfiniteScroll: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentBannerIndex = index;
                    });
                  },
                ),
                items:
                    [
                      "assets/png/banner.png",
                      "assets/png/banner.png",
                      "assets/png/banner.png",
                    ].map((imagePath) {
                      return Builder(
                        builder: (BuildContext context) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              imagePath,
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                            ),
                          );
                        },
                      );
                    }).toList(),
              ),

              // Banner Carousel Indicator Dots
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3, // Number of banner items
                  (index) => Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          currentBannerIndex == index
                              ? const Color(0xFF3B82F6)
                              : const Color(0xFF3B82F6).withOpacity(0.3),
                    ),
                  ),
                ),
              ),

              // Scrollable Transactions Section
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 32),

                      // Recent Transactions Widget
                      Expanded(
                        child: RecentTransactionsWidget(
                          onViewAllPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => const AllTransactionsPage(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Floating chat button
          Positioned(
            bottom: 24,
            right: 24,
            child: Container(
              width: 56,
              height: 56,
              decoration: const BoxDecoration(
                color: Color(0xFF1E40AF),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x1A000000),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/png/chaticon.png',
                  width: 32,
                  height: 32,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 18),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                label,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
