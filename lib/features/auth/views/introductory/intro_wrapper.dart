import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:valarpayee/core/themes/color_utils.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  final List<String> _backgroundImages = [
    'assets/images/intro1.png',
    'assets/images/intro2.png',
    'assets/images/intro3.png',
    'assets/images/intro4.png',
  ];

  final List<Map<String, String>> _slideContent = [
    {
      'title': 'Simple Banking',
      'description': 'Easy banking for everyone across\nall platforms',
    },
    {
      'title': 'Secure Payments',
      'description': 'Safe and secure transactions\nwith advanced encryption',
    },
    {
      'title': 'Quick Transfers',
      'description': 'Send money instantly to anyone\nanywhere in the world',
    },
    {
      'title': 'Smart Savings',
      'description':
          'Grow your money with intelligent\nsavings and investment options',
    },
  ];

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentPage < _backgroundImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          // Image Container with Shadow
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.6),
                    blurRadius: 30,
                    spreadRadius: 5,
                    offset: const Offset(0, 15),
                  ),
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurRadius: 60,
                    spreadRadius: 10,
                    offset: const Offset(0, 25),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Background Image Carousel
                    PageView.builder(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemCount: _backgroundImages.length,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          _backgroundImages[index],
                          fit: BoxFit.cover,
                        );
                      },
                    ),

                    // Gradient Overlay
                    Align(
                      alignment: AlignmentGeometry.bottomCenter,
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withValues(alpha: 0.2),
                              Colors.black.withValues(alpha: 0.6),
                              Colors.black.withValues(alpha: 1),
                            ],
                            stops: const [0.0, 0.3, 0.7, 1.0],
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _slideContent[_currentPage]['title']!,
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 16),
                            Text(
                              _slideContent[_currentPage]['description']!,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                height: 1.5,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),

                    // Text Overlay on Image
                    Positioned(
                      bottom: 0,
                      left: 20,
                      right: 20,
                      child: Column(
                        children: [
                          // Page Indicators (dots)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              _backgroundImages.length,
                              (index) => Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                width: _currentPage == index ? 8 : 6,
                                height: _currentPage == index ? 8 : 6,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _currentPage == index
                                      ? Colors.white
                                      : Colors.white.withValues(alpha: 0.4),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Shadow overlay extending from image

          // Bottom Content Section
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Sign Up Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        context.go('/signup');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Log In Button
                  TextButton(
                    onPressed: () {
                      context.go('/signin');
                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // License Text
                  const Text(
                    'Licensed by the Central Bank of Nigeria',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white70,
                    ),
                  ),

                  // Get Help

                  // const SizedBox(height: 16),

                  // // Get Help
                  // TextButton(
                  //   onPressed: () {
                  //     // Handle get help
                  //   },
                  //   child: const Text(
                  //     'Get Help',
                  //     style: TextStyle(
                  //       fontSize: 14,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),

                  // const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
