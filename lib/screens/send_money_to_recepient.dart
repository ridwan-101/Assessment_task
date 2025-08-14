import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hellomoney/screens/select_beneficiary.dart';
import 'package:hellomoney/widgets/extension.dart';
import 'package:hellomoney/widgets/reusable_button.dart';
import 'package:hellomoney/widgets/currency_icon_widget.dart';

class SendMoneyPageReceipent extends StatefulWidget {
  const SendMoneyPageReceipent({super.key});

  @override
  State<SendMoneyPageReceipent> createState() => _SendMoneyPageReceipentState();
}

class _SendMoneyPageReceipentState extends State<SendMoneyPageReceipent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F7),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Send Money",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        flexibleSpace: SvgPicture.asset(
          "assets/svg/5 1.svg",
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.north_east,
                                color: Color(0xFF667085),
                                size: 20,
                              ),
                              SizedBox(width: 8),
                              Text(
                                "You're sending",
                                style: TextStyle(
                                  color: Color(0xFF667085),
                                  fontSize: 14,
                                ),
                              ),
                              130.toRowSpace(),
                              Column(
                                children: [
                                  Text(
                                    'Available Balance:',
                                    style: TextStyle(
                                      color: Color(0xFF667085),
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    '£24,624.00',
                                    style: TextStyle(
                                      color: Color(0xFF344054),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          // const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '500.00',
                                style: TextStyle(
                                  color: Color(0xFF344054),
                                  fontSize: 32,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Row(
                                children: [
                                  CurrencyIconWidget(currencyCode: 'UK'),
                                  const SizedBox(width: 8),
                                  const Text(
                                    'GBP',
                                    style: TextStyle(
                                      color: Color(0xFF77B7FD),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Color(0xFF77B7FD),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    20.toColumnSpace(),
                    // Recipient gets
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(
                                Icons.south_west,
                                color: Color(0xFF667085),
                                size: 20,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Recipient gets',
                                style: TextStyle(
                                  color: Color(0xFF667085),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '1101500.23',
                                style: TextStyle(
                                  color: Color(0xFF344054),
                                  fontSize: 32,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Row(
                                children: [
                                  CurrencyIconWidget(currencyCode: 'NGN'),
                                  const SizedBox(width: 8),
                                  const Text(
                                    'NGN',
                                    style: TextStyle(
                                      color: Color(0xFF77B7FD),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Color(0xFF77B7FD),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Exchange Rate
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        '1 GBP = 2203.12 NGN',
                        style: TextStyle(
                          color: Color(0xFF036BDD),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    // Delivery Method
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFFD0D5DD)),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Choose delivery method',
                            style: TextStyle(color: Color(0xFF667085)),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0xFF667085),
                          ),
                        ],
                      ),
                    ),
                    30.toColumnSpace(),
                    // Fee Toggle
                    Row(
                      children: [
                        Expanded(
                          child: ReusableButton(
                            onPressed: () {},
                            text: 'Fee',
                            backgroundColor: const Color(0xFF036BDD),
                            textColor: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ReusableButton(
                            onPressed: () {},
                            text: 'No Fee',
                            backgroundColor: const Color(0xFFE0E3E5),
                            textColor: const Color(0xFF667085),
                          ),
                        ),
                      ],
                    ),

                    30.toColumnSpace(),
                    // Fee Breakdown
                    const Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Fee :',
                              style: TextStyle(color: Color(0xFF667085)),
                            ),
                            Text(
                              '£ 4.00',
                              style: TextStyle(
                                color: Color(0xFF344054),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Discount :',
                              style: TextStyle(color: Color(0xFF667085)),
                            ),
                            Text(
                              '£ 0.00',
                              style: TextStyle(
                                color: Color(0xFF344054),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Payable Amount :',
                              style: TextStyle(
                                color: Color(0xFF27BE69),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '£ 504.00',
                              style: TextStyle(
                                color: Color(0xFF344054),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // Use Promo Credit
                    30.toColumnSpace(),
                    ReusableButton(
                      onPressed: () {},
                      text: 'Use Promo Credit',
                      backgroundColor: const Color(0xFF222B45),
                      textColor: Colors.white,
                      icon: const Icon(Icons.local_offer, size: 20),
                    ),

                    30.toColumnSpace(),

                    // Next Button
                    ReusableButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ChooseBeneficiaryPage(),
                          ),
                        );
                      },
                      text: 'Next',
                      backgroundColor: const Color(0xFF036BDD),
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
