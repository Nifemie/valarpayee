import 'dart:async'; // Import for Timer
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/features/dashboard/widgets/payment_widget_icons.dart';
import '/features/dashboard/widgets/kyc_widget.dart';
import '/features/dashboard/widgets/ourservice.dart';
import '/features/dashboard/widgets/navbar.dart';
import '../../../core/themes/app_theme.dart';

class Homescreen extends StatefulWidget {
  final String firstName;
  final String profileImageUrl;
  final String balance;

  const Homescreen({
    Key? key,
    required this.firstName,
    required this.profileImageUrl,
    required this.balance,
  }) : super(key: key);

  @override
  State<Homescreen> createState() => _HomeScreenTopState();
}

class _HomeScreenTopState extends State<Homescreen> {
  bool _isBalanceVisible = false;
  String _currentBannerImage = 'assets/images/valarbanner.png';
  Timer? _timer;
  List<String> _bannerImages = [
    'assets/images/valarbanner.png',
    'assets/images/valarbanner4.png',
  ];
  int _currentImageIndex = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer t) {
      if (mounted) {
        setState(() {
          _currentImageIndex = (_currentImageIndex + 1) % _bannerImages.length;
          _currentBannerImage = _bannerImages[_currentImageIndex];
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor, // Use theme's scaffold background color
      bottomNavigationBar: const CustomBottomNavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
          children: [
            // Custom AppBar
            _buildAppBar(),
            const SizedBox(height: 16),
            // Balance Card
            _buildBalanceCard(),
            const SizedBox(height: 16),
            const PaymentWidget(),
            const SizedBox(height: 16),
            const KYCWidget(),
            const SizedBox(height: 16),
            Image.asset(_currentBannerImage), // Use the state variable here
            const SizedBox(height: 16),
            const OurServicesWidget(),
            const SizedBox(height: 16),
          ],
        ),
      )
      )
    );
  }

  Widget _buildAppBar() {
    return Container(
      color: Colors.black, // Explicitly set app bar background to black
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Row(
        children: [
          // Profile Picture
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(
                image: NetworkImage(widget.profileImageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          // User Name
          Text(
            'Hello ${widget.firstName}',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface, // Use theme's onSurface color
              fontFamily: 'SF Pro',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 20 / 14,
              letterSpacing: 0.035,
            ),
          ),
          const Spacer(),
          // Right Icons
          Row(
            children: [
              _buildIconButton('assets/images/payment_wid/Grouping (1).svg'),
              const SizedBox(width: 16),
              _buildIconButton('assets/images/payment_wid/scanning.svg'),
              const SizedBox(width: 16),
              _buildIconButton('assets/images/payment_wid/bell.svg', hasNotification: true),
            ],
          ),
        ],
      ),
      )
    );
  }

  Widget _buildIconButton(String svgPath, {bool hasNotification = false}) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => print('Icon tapped'),
          child: SvgPicture.asset(
            svgPath,
            width: 24,
            height: 24,
            colorFilter: const ColorFilter.mode(
              Color(0xFFF9FAFB),
              BlendMode.srcIn,
            ),
          ),
        ),
        if (hasNotification)
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      width: 335,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).primaryColor, // Use theme's primary color
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Your Balance with icons
          Row(
            children: [
              // Shield/Lock Icon
              SvgPicture.asset(
                'assets/images/payment_wid/security-safe.svg',
                width: 16,
                height: 16,
                colorFilter: const ColorFilter.mode(
                  Color(0xFFD1D5DB),
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 6),
              // Your Balance Text
              Text(
                'Your Balance',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary, // Use theme's onPrimary color
                  fontFamily: 'SF Pro',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 16 / 12,
                  letterSpacing: 0.06,
                ),
              ),
              const SizedBox(width: 6),
              // Eye Icon (toggle visibility)
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isBalanceVisible = !_isBalanceVisible;
                  });
                },
                child: Icon(
                  _isBalanceVisible ? Icons.visibility : Icons.visibility_off,
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: 16,
                ),
              ),
              const Spacer(),
              // Transaction History
              GestureDetector(
                onTap: () => print('Transaction History tapped'),
                child: Row(
                  children: [
                    Text(
                      'Transaction History',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary, // Use theme's onPrimary color
                        fontFamily: 'SF Pro',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 16 / 12,
                        letterSpacing: 0.06,
                      ),
                    ),
                    const SizedBox(width: 4),
                    SvgPicture.asset(
                      'assets/icons/arrow_right_icon.svg',
                      width: 16,
                      height: 16,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.onPrimary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Balance Display
          Row(
            children: [
              Text(
                _isBalanceVisible ? widget.balance : '₦••••••••••',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontFamily: 'SF Pro',
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  height: 32 / 24,
                ),
              ),
              const Spacer(),
              // Add Money Button
              GestureDetector(
                onTap: () => print('Add Money tapped'),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: const Color(0xFF040404), // Main Primary Black (reverted to original)
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.add,
                        color: Color(0xFFFCFCFC),
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Add Money',
                        style: TextStyle(
                          color: const Color(0xFFFCFCFC), // Main Primary White (reverted to original)
                          fontFamily: 'SF Pro',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 20 / 14,
                          letterSpacing: 0.035,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
