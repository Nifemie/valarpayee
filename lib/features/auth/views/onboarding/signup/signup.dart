import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/color_utils.dart';
import '../../../../../features/auth/widgets/need_help_modal.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String selectedAccountType = 'Personal';
  String selectedCurrency = 'NGN';
  String selectedAirline = 'Schedule Airline';

  void _showAccountTypeDialog() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                      padding: EdgeInsets.zero,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Choose Account Type',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                _buildAccountTypeOption(
                  'Personal',
                  'For individuals and everyday needs',
                  selectedAccountType == 'Personal',
                  () {
                    setState(() {
                      selectedAccountType = 'Personal';
                    });
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 16),
                _buildAccountTypeOption(
                  'Business',
                  'For organizations and corporate needs',
                  selectedAccountType == 'Business',
                  () {
                    setState(() {
                      selectedAccountType = 'Business';
                    });
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showCurrencyDialog() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                      padding: EdgeInsets.zero,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Choose Currency Type',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                _buildCurrencyOption(
                  '🇳🇬',
                  'NGN',
                  'For transactions in Naira',
                  selectedCurrency == 'NGN',
                  () {
                    setState(() {
                      selectedCurrency = 'NGN';
                    });
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 16),
                _buildCurrencyOption(
                  '🇺🇸',
                  'USD',
                  'For transactions in US Dollars',
                  selectedCurrency == 'USD',
                  () {
                    setState(() {
                      selectedCurrency = 'USD';
                    });
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 16),
                _buildCurrencyOption(
                  '🇬🇧',
                  'GBP',
                  'For transactions in Pounds',
                  selectedCurrency == 'GBP',
                  () {
                    setState(() {
                      selectedCurrency = 'GBP';
                    });
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 16),
                _buildCurrencyOption(
                  '🇪🇺',
                  'EUR',
                  'For transactions in Euros',
                  selectedCurrency == 'EUR',
                  () {
                    setState(() {
                      selectedCurrency = 'EUR';
                    });
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAccountTypeOption(
    String title,
    String subtitle,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? appTheme.primaryColor : Colors.grey.shade300,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            Radio<String>(
              value: title,
              groupValue: isSelected ? title : null,
              onChanged: (value) => onTap(),
              activeColor: appTheme.primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrencyOption(
    String flag,
    String currency,
    String subtitle,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.green : Colors.grey.shade300,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color:
                    isSelected ? Colors.green.shade100 : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Text(
                  flag,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    currency,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            Radio<String>(
              value: currency,
              groupValue: isSelected ? currency : null,
              onChanged: (value) => onTap(),
              activeColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.go('/intro'),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () {
              NeedHelpModal.show(context);
            },
            child: const Text(
              'Need Help?',
              style: TextStyle(
                color: appTheme.primaryColor,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ValarPayee Logo
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: appTheme.primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.account_balance_wallet,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'ValarPayee',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),

            // Create account title
            const Text(
              'Create account',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Select the account type that best fits your needs',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 40),

            // Account Type Dropdown
            GestureDetector(
              onTap: _showAccountTypeDialog,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        selectedAccountType,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Currency Selection
            GestureDetector(
              onTap: _showCurrencyDialog,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          selectedCurrency == 'NGN'
                              ? '🇳🇬'
                              : selectedCurrency == 'USD'
                                  ? '🇺🇸'
                                  : selectedCurrency == 'GBP'
                                      ? '🇬🇧'
                                      : '🇪🇺',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        selectedCurrency,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Airline Dropdown
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.flight,
                      size: 16,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      selectedAirline,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_down),
                ],
              ),
            ),

            const Spacer(),

            // Continue Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (selectedAccountType == 'Personal') {
                    context.go('/personal-details');
                  } else {
                    context.go('/business-details');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: appTheme.primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

