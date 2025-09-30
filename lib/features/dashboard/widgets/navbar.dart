import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  final List<NavItem> _navItems = [
    NavItem(
      icon: 'assets/images/nav_icons/home.svg', // Replace with your SVG path
      label: 'Home',
    ),
    NavItem(
      icon: 'assets/images/nav_icons/bank.svg', // Replace with your SVG path
      label: 'Finance',
    ),
    NavItem(
      icon: 'assets/images/nav_icons/briefcase.svg', // Replace with your SVG path
      label: 'Invest',
    ),
    NavItem(
      icon: 'assets/images/nav_icons/card-pos.svg', // Replace with your SVG path
      label: 'Cards',
    ),
    NavItem(
      icon: 'assets/images/nav_icons/profile-circle.svg', // Replace with your SVG path
      label: 'Me',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: const BoxDecoration( // Reverted to const and black
        color: Colors.black, // Reverted to black
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          _navItems.length,
              (index) => _buildNavItem(index),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index) {
    final isSelected = _selectedIndex == index;
    final item = _navItems[index];

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              item.icon,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                isSelected ? const Color(0xFFF76301) : Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              item.label,
              style: TextStyle(
                color: isSelected ? const Color(0xFFF76301) : Colors.grey,
                fontFamily: 'SF Pro',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 16 / 12, // line-height / font-size
                letterSpacing: 0.06,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavItem {
  final String icon;
  final String label;

  NavItem({
    required this.icon,
    required this.label,
  });
}

// Usage example:
// In your Scaffold:
// bottomNavigationBar: const CustomBottomNavBar(),