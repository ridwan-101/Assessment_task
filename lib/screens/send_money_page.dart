import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hellomoney/screens/send_money_to_recepient.dart';
import 'package:hellomoney/wid/payment_option_card_widget.dart';
import 'package:hellomoney/widgets/extension.dart';

class SendMoneyPage extends StatefulWidget {
  const SendMoneyPage({super.key});

  @override
  State<SendMoneyPage> createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            30.toColumnSpace(),

            Center(
              child: Text(
                "Select an option below :",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            16.toColumnSpace(),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.74,
                children: [
                  PaymentOptionCard(
                    title: "Local",
                    subtitle: "GBP → GBP\n(Fast Payment)",
                    description:
                        "Need to make a local payment? Select this option for fast, secure transfers within your country!",

                    imagePath: "assets/png/transference (1) 1.png",
                    backgroundColor: Colors.blue.shade50,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SendMoneyPageReceipent(),
                        ),
                      );
                    },
                  ),
                  PaymentOptionCard(
                    title: "International",
                    description:
                        "Send money to your friends or family overseas effortlessly! Choose this option for quick and reliable international transfers.",
                    imagePath: "assets/png/international 1.png",

                    onTap: () {
                      //  international payment tap
                    },
                  ),
                  PaymentOptionCard(
                    title: "Payment Link",
                    description:
                        "Create a payment link, for fast and secure transaction",
                    imagePath: "assets/png/paymentlink 1.png",
                    onTap: () {
                      //  payment link tap
                    },
                  ),
                  PaymentOptionCard(
                    title: "HelloMe Money Friends",
                    description:
                        "Send money to your friends on HelloMe Money using tags",
                    imagePath: "assets/png/people 1.png",
                    onTap: () {
                      //  friends payment tap
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
