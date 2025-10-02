import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentWidget extends StatelessWidget {
  const PaymentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).cardColor, // Same dark mode surface card color
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildActionItem(
            svgAssetPath: 'assets/images/payment_wid/valarpay.svg',
            label: 'To ValaPay',
            onTap: () => print('To ValaPay tapped'),
          ),

          _buildActionItem(
            svgAssetPath: 'assets/images/payment_wid/Bank.svg',
            label: 'To Bank',
            onTap: () => print('To Bank tapped'),
          ),


          _buildActionItem(
            svgAssetPath: 'assets/images/payment_wid/withdraw.svg',
            label: 'Withdraw',
            onTap: () => print('Withdraw tapped'),
          ),

          _buildActionItem(
            svgAssetPath: 'assets/images/payment_wid/Account.svg',
            label: 'Account',
            onTap: () => print('Account tapped'),
          ),
        ],
      ),
    );
  }

  Widget _buildActionItem({
    required String svgAssetPath,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon container with orange background
          Container(
            width: 40,
            height: 40,
            padding: const EdgeInsets.fromLTRB(9, 10, 9, 10),
            decoration: BoxDecoration(
              color: const Color(0xFFF76301), // Main Primary color
              borderRadius: BorderRadius.circular(100),
            ),
            child: SvgPicture.asset(
              svgAssetPath,
              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              width: 20,
              height: 20,
            ),
          ),
          const SizedBox(height: 8),
          // Label text
          Text(
            label,
            style: const TextStyle(
              color: Colors.black, // Same secondary text color as KYC widget
              fontFamily: 'SF Pro',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              height: 16 / 12,
              letterSpacing: 0.06,
            ),
          ),
        ],
      ),
    );
  }
}

