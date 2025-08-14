import 'package:flutter/material.dart';
import 'package:hellomoney/theme/app_theme.dart';

class RecentTransactionsWidget extends StatelessWidget {
  final VoidCallback? onViewAllPressed;
  final bool showAllTransactions;

  const RecentTransactionsWidget({
    super.key,
    this.onViewAllPressed,
    this.showAllTransactions = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              showAllTransactions ? 'All Transactions' : 'Recent Transactions',
              style: TextStyle(
                color: AppTheme.slateDarkColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (!showAllTransactions)
              GestureDetector(
                onTap: onViewAllPressed,
                child: Row(
                  children: [
                    const Text(
                      'View all',
                      style: TextStyle(
                        color: AppTheme.blueLightColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.arrow_forward,
                      color: AppTheme.blueLightColor,
                      size: 16,
                    ),
                  ],
                ),
              ),
          ],
        ),

        const SizedBox(height: 16),


        if (showAllTransactions)
          Column(
            children: List.generate(_getAllTransactions().length, (index) {
              final transaction = _getAllTransactions()[index];
              return _buildTransactionItem(
                transaction['title'],
                transaction['subtitle'],
                transaction['amount'],
                transaction['status'],
                transaction['icon'],
                transaction['iconColor'],
              );
            }),
          )
        else
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(3, (index) {
                  final transaction = _getAllTransactions()[index];
                  return _buildTransactionItem(
                    transaction['title'],
                    transaction['subtitle'],
                    transaction['amount'],
                    transaction['status'],
                    transaction['icon'],
                    transaction['iconColor'],
                  );
                }),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildTransactionItem(
    String title,
    String subtitle,
    String amount,
    String status,
    IconData icon,
    Color iconColor,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
                                color: AppTheme.greyTransparent10,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF1E293B),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF64748B),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: const TextStyle(
                  color: Color(0xFF1E293B),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (status.isNotEmpty) ...[
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.greenTransparent10,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    status,
                    style: const TextStyle(
                      color: Color(0xFF10B981),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> _getAllTransactions() {
    return [
      {
        'title': 'Fund deposit',
        'subtitle': '17 Feb 2025 • 12:02pm',
        'amount': '£350.00',
        'status': 'Success',
        'icon': Icons.arrow_downward,
        'iconColor': const Color(0xFF10B981),
      },
      {
        'title': 'Fund deposit',
        'subtitle': '17 Feb 2025 • 12:02pm',
        'amount': '€250.00',
        'status': 'Success',
        'icon': Icons.arrow_downward,
        'iconColor': const Color(0xFF10B981),
      },
      {
        'title': 'Currency conversion',
        'subtitle': '17 Feb 2025 • 12:02pm',
        'amount': '£240.00',
        'status': '',
        'icon': Icons.swap_horiz,
        'iconColor': const Color(0xFF3B82F6),
      },
      {
        'title': 'Payment to John',
        'subtitle': '16 Feb 2025 • 3:45pm',
        'amount': '£50.00',
        'status': 'Success',
        'icon': Icons.arrow_upward,
        'iconColor': const Color(0xFFEF4444),
      },
      {
        'title': 'Fund deposit',
        'subtitle': '16 Feb 2025 • 10:30am',
        'amount': '£200.00',
        'status': 'Success',
        'icon': Icons.arrow_downward,
        'iconColor': const Color(0xFF10B981),
      },
      {
        'title': 'Currency conversion',
        'subtitle': '15 Feb 2025 • 2:15pm',
        'amount': '£180.00',
        'status': '',
        'icon': Icons.swap_horiz,
        'iconColor': const Color(0xFF3B82F6),
      },
      {
        'title': 'Payment to Sarah',
        'subtitle': '15 Feb 2025 • 11:20am',
        'amount': '£75.00',
        'status': 'Success',
        'icon': Icons.arrow_upward,
        'iconColor': const Color(0xFFEF4444),
      },
      {
        'title': 'Fund deposit',
        'subtitle': '14 Feb 2025 • 9:45am',
        'amount': '£300.00',
        'status': 'Success',
        'icon': Icons.arrow_downward,
        'iconColor': const Color(0xFF10B981),
      },
      {
        'title': 'Payment to Mike',
        'subtitle': '14 Feb 2025 • 8:15am',
        'amount': '£120.00',
        'status': 'Success',
        'icon': Icons.arrow_upward,
        'iconColor': const Color(0xFFEF4444),
      },
      {
        'title': 'Currency conversion',
        'subtitle': '13 Feb 2025 • 4:30pm',
        'amount': '£150.00',
        'status': '',
        'icon': Icons.swap_horiz,
        'iconColor': const Color(0xFF3B82F6),
      },
      {
        'title': 'Fund deposit',
        'subtitle': '13 Feb 2025 • 2:45pm',
        'amount': '£400.00',
        'status': 'Success',
        'icon': Icons.arrow_downward,
        'iconColor': const Color(0xFF10B981),
      },
    ];
  }
}
