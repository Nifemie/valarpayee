import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:valarpay/core/utils/color_utils.dart';

class NeedHelpModal {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(24.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with back arrow and title
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 24.sp,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Text(
                      'Select an option',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 32.h),

                // Live support option
                _buildHelpOption(
                  context: context,
                  title: 'Live support',
                  icon: Icons.chat_bubble_outline,
                  iconColor: appTheme.primaryColor,
                  onTap: () {
                    Navigator.pop(context);
                    _showComingSoon(context, 'Live Support');
                  },
                ),

                const SizedBox(height: 24),

                // Email us option
                _buildHelpOption(
                  context: context,
                  title: 'Email us',
                  icon: Icons.email_outlined,
                  iconColor: Colors.grey,
                  onTap: () {
                    Navigator.pop(context);
                    _launchEmail();
                  },
                ),

                const SizedBox(height: 24),

                // WhatsApp option
                _buildHelpOption(
                  context: context,
                  title: 'WhatsApp',
                  icon: Icons.chat,
                  iconColor: Colors.grey,
                  onTap: () {
                    Navigator.pop(context);
                    _launchWhatsApp();
                  },
                ),

                const SizedBox(height: 24),

                // Phone Call option
                _buildHelpOption(
                  context: context,
                  title: 'Phone Call',
                  icon: Icons.phone_outlined,
                  iconColor: Colors.grey,
                  onTap: () {
                    Navigator.pop(context);
                    _launchPhoneCall();
                  },
                ),

                const SizedBox(height: 32),
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget _buildHelpOption({
    required BuildContext context,
    required String title,
    required IconData icon,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: iconColor == appTheme.primaryColor
                    ? appTheme.primaryColor
                    : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                icon,
                color: iconColor == appTheme.primaryColor
                    ? Colors.white
                    : Colors.grey.shade600,
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'support@valarpay.com',
      query: 'subject=Need Help with ValarPay',
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  static void _launchWhatsApp() async {
    final Uri whatsappUri = Uri.parse('https://wa.me/2348000000000');

    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
    }
  }

  static void _launchPhoneCall() async {
    final Uri phoneUri = Uri.parse('tel:+2348000000000');

    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
  }

  static void _showComingSoon(BuildContext context, String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$feature coming soon!'),
        backgroundColor: appTheme.primaryColor,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
