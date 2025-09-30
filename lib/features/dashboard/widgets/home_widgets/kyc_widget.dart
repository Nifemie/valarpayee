import 'package:flutter/material.dart';

class KYCWidget extends StatelessWidget {
  const KYCWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFF2B2725), // Dark mode surface card color
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SVG Icon placeholder - replace with your actual icon
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Image.asset(
              'assets/images/payment_wid/kyc.png',
              width: 16,
              height: 16,
              color: Colors.white, // Assuming you want to keep the white color filter
            ),
          ),
          const SizedBox(width: 12),

          // Text content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Complete Your KYC',
                  style: TextStyle(
                    color: Color(0xFFF9FAFB), // Dark Mode Text Primary
                    fontFamily: 'SF Pro',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 20 / 14, // line-height / font-size
                    letterSpacing: 0.035,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Verify your identity to unlock access',
                  style: TextStyle(
                    color: Color(0xFFD1D5DB), // Dark Mode Text Secondary
                    fontFamily: 'SF Pro',
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    height: 14 / 10, // line-height / font-size
                    letterSpacing: 0.1,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),

          // Setup button
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0x26216EB2), // rgba(33, 110, 178, 0.15)
            ),
            child: const Text(
              'Setup',
              style: TextStyle(
                color: Color(0xFF216EB2), // Main Secondary
                fontFamily: 'SF Pro',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 16 / 12, // line-height / font-size
                letterSpacing: 0.06,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

