import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SecurityMenuWidget extends StatelessWidget {
  const SecurityMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF2B2725),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMenuItem(
            svgPath: 'assets/images/me_icons/security.svg',
            title: 'Security Centre',
            onTap: () {},
          ),
          const SizedBox(height: 20),
          _buildMenuItem(
            svgPath: 'assets/images/me_icons/live.svg',
            title: 'Live Support',
            onTap: () {},
          ),
          const SizedBox(height: 20),
          _buildMenuItem(
            svgPath: 'assets/images/me_icons/report.svg',
            title: 'Report Scam',
            onTap: () {},
          ),
          const SizedBox(height: 20),
          _buildMenuItem(
            svgPath: 'assets/images/me_icons/about.svg',
            title: 'About Us',
            onTap: () {},
          ),
          const SizedBox(height: 20),
          _buildMenuItem(
            svgPath: 'assets/images/me_icons/rate.svg',
            title: 'Rate Valarpay',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required String svgPath,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            // Left icon
            SvgPicture.asset(
              svgPath,
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 12),
            // Title text
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Color(0xFFD1D5DB),
                  fontFamily: 'SF Pro',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.428, // 20px line height / 14px font size
                  letterSpacing: 0.035,
                ),
              ),
            ),
            // Right arrow icon
            SvgPicture.asset(
              'assets/icons/arrow_right_icon.svg',
              width: 20,
              height: 20,
              colorFilter: const ColorFilter.mode(
                Color(0xFFD1D5DB),
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

