import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/me_widgets/account_widget.dart';
import '../widgets/me_widgets/user_profile.dart';
import '../widgets/me_widgets/security_widget.dart';
import 'package:flutter/services.dart';
import '../widgets/navbar.dart';

// Import your widgets
// import 'profile_header_card.dart';
// import 'account_menu_widget.dart';
// import 'security_menu_widget.dart';

class MeScreen extends ConsumerWidget {
  const MeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      bottomNavigationBar: const CustomBottomNavBar(), // Reverted
      appBar: AppBar(
            backgroundColor: const Color(0xFF000000),
            elevation: 0,
            toolbarHeight: 0,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,
            ),
          ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            children: [
              // Profile Header Card
              ProfileHeaderCard(
                onSecurityTipsTap: () {
                  // Navigate to security tips
                  print('Security Tips tapped');
                },
                onRewardsTap: () {
                  // Navigate to rewards
                  print('Rewards tapped');
                },
              ),
              const SizedBox(height: 16),

              // Account Menu Widget
              AccountMenuWidget(),
              const SizedBox(height: 16),

              // Security Menu Widget
              SecurityMenuWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

// Usage Example:
//
// In your main.dart or navigation:
// Navigator.push(
//   context,
//   MaterialPageRoute(builder: (context) => MeScreen()),
// )
//
// Or if using named routes:
// '/me': (context) => MeScreen(),