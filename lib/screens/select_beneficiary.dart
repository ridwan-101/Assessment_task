import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hellomoney/widgets/currency_icon_widget.dart';

class ChooseBeneficiaryPage extends StatelessWidget {
  const ChooseBeneficiaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Choose Beneficiary",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        flexibleSpace: SvgPicture.asset(
          "assets/svg/5 1.svg",
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                const SizedBox(height: 24),

                // Add new Beneficiary
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE2E8F0),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: const BoxDecoration(
                          color: Color(0xFF3B82F6),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Text(
                        'Add new Beneficiary',
                        style: TextStyle(
                          color: Color(0xFF1E293B),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Search Bar
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.search, color: Color(0xFF94A3B8), size: 20),
                      SizedBox(width: 12),
                      Text(
                        'Search Saved Beneficiaries',
                        style: TextStyle(
                          color: Color(0xFF94A3B8),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Beneficiaries List
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    children: [
                      _buildBeneficiaryItem(
                        'Samad Julius',
                        '8106673596 - Kuda',
                        _buildNigerianFlag(),
                      ),
                      _buildBeneficiaryItem(
                        'Samad Julius',
                        '8106673596 - Netbank',
                        _buildUKFlag(),
                      ),
                      _buildBeneficiaryItem(
                        'Samad Julius',
                        '8106673596 - Netbank',
                        _buildUSFlag(),
                      ),
                      _buildBeneficiaryItem(
                        'Samad Julius',
                        '8106673596 - Netbank',
                        _buildUKFlag(),
                      ),
                      _buildBeneficiaryItem(
                        'Samad Julius',
                        '8106673596 - Netbank',
                        _buildCanadianFlag(),
                      ),
                      _buildBeneficiaryItem(
                        'Samad Julius',
                        '8106673596 - Netbank',
                        _buildCanadianFlag(),
                      ),
                      _buildBeneficiaryItem(
                        'Samad Julius',
                        '8106673596 - Netbank',
                        _buildNigerianFlag(),
                      ),
                    ],
                  ),
                ),

                // View Saved Beneficiaries
                Container(
                  padding: const EdgeInsets.all(24),
                  child: const Text(
                    'View Saved Beneficiaries',
                    style: TextStyle(
                      color: Color(0xFF3B82F6),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBeneficiaryItem(
    String name,
    String accountInfo,
    Widget flagIcon,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              color: Color(0xFF94A3B8),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text(
                'SJ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),

          // Name and Account Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Color(0xFF1E293B),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  accountInfo,
                  style: const TextStyle(
                    color: Color(0xFF3B82F6),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          // Flag Icon
          flagIcon,
        ],
      ),
    );
  }

  Widget _buildNigerianFlag() {
    return CurrencyIconWidget(
      currencyCode: 'NGN',
      width: 32,
      height: 32,
      borderRadius: 16, // Makes it circular
    );
  }

  Widget _buildUKFlag() {
    return CurrencyIconWidget(
      currencyCode: 'GBP',
      width: 32,
      height: 32,
      borderRadius: 16, // Makes it circular
    );
  }

  Widget _buildUSFlag() {
    return CurrencyIconWidget(
      currencyCode: 'EUR', // Using Europe instead of US
      width: 32,
      height: 32,
      borderRadius: 16, // Makes it circular
    );
  }

  Widget _buildCanadianFlag() {
    return CurrencyIconWidget(
      currencyCode: 'NGN', // Using Nigeria instead of Canada
      width: 32,
      height: 32,
      borderRadius: 16, // Makes it circular
    );
  }
}
