import 'package:flutter/material.dart';
import '/features/dashboard/widgets/navbar.dart';

class SavingsComingSoonScreen extends StatelessWidget {
  const SavingsComingSoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),

              // Piggy Bank Icon
              Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF5722),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(
                  Icons.savings,
                  size: 80,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 32),

              // Title
              const Text(
                'Savings Coming Soon',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF5722),
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 16),

              // Description
              const Text(
                'We\'re building something amazing to help you\nsave and grow your money',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 32),

              // Progress Dots
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFFF5722),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.3),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 48),

              // Feature Cards
              _buildFeatureCard(
                icon: Icons.lock,
                title: 'Secure Savings',
                iconColor: const Color(0xFFFF5722),
              ),

              const SizedBox(height: 16),

              _buildFeatureCard(
                icon: Icons.trending_up,
                title: 'Competitive Rates',
                iconColor: const Color(0xFFFF5722),
              ),

              const SizedBox(height: 16),

              _buildFeatureCard(
                icon: Icons.access_time,
                title: 'Flexible Terms',
                iconColor: const Color(0xFFFF5722),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 24,
          ),
          const SizedBox(width: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
