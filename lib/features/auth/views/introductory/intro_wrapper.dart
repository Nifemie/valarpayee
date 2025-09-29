import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:valarpayee/core/utils/color_utils.dart';

class IntroductoryScreen extends StatefulWidget {
  const IntroductoryScreen({super.key});

  @override
  State<IntroductoryScreen> createState() => _IntroductoryScreenState();
}

class _IntroductoryScreenState extends State<IntroductoryScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<IntroPageData> _pages = [
    IntroPageData(
      title: 'Seamless Payments Everywhere',
      description: 'Experience the future of your payments effortlessly online',
      imagePath: 'assets/images/intro1.png',
      icon: Icons.phone_android,
    ),
    IntroPageData(
      title: 'Save, Invest & Grow',
      description:
          'Unlock savings, savings, investments, and rewards built for everyday life',
      imagePath: 'assets/images/intro2.png',
      icon: Icons.savings,
    ),
    IntroPageData(
      title: 'All Your Services, One App',
      description:
          'Manage finances, send cash and manage your finances all at your fingertips',
      imagePath: 'assets/images/intro3.png',
      icon: Icons.apps,
    ),
    IntroPageData(
      title: 'Power Your Business with Ease',
      description:
          'Get best service POS solutions to accept payments and manage sales',
      imagePath: 'assets/images/intro4.png',
      icon: Icons.payment,
    ),
  ];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _goToWelcome();
    }
  }

  void _skipToEnd() {
    _goToWelcome();
  }

  void _goToWelcome() {
    context.go('/intro5');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return _buildIntroPage(_pages[index], index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIntroPage(IntroPageData pageData, int index) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          // Progress indicator
          Container(
            height: 4,
            margin: const EdgeInsets.only(top: 16, bottom: 40),
            child: LinearProgressIndicator(
              value: (index + 1) / _pages.length,
              backgroundColor: Colors.grey.shade200,
              valueColor:
                  const AlwaysStoppedAnimation<Color>(appTheme.primaryColor),
            ),
          ),

          // Main illustration
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(
                pageData.imagePath,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Icon(
                        pageData.icon,
                        size: 120,
                        color: appTheme.primaryColor,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 40),

          // Title and description
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text(
                  pageData.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  pageData.description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),

          // Action button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: index == _pages.length - 1 ? _goToWelcome : _nextPage,
              style: ElevatedButton.styleFrom(
                backgroundColor: appTheme.primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                index == _pages.length - 1 ? 'Finish' : 'Next',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class IntroPageData {
  final String title;
  final String description;
  final String imagePath;
  final IconData icon;

  IntroPageData({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.icon,
  });
}
