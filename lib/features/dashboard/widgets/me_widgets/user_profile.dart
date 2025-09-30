import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Models
class UserProfile {
  final String userName;
  final String accountNumber;
  final double balance;
  final double rewardsAmount;
  final String profileImagePath;
  final bool isBalanceVisible;

  UserProfile({
    required this.userName,
    required this.accountNumber,
    required this.balance,
    required this.rewardsAmount,
    required this.profileImagePath,
    this.isBalanceVisible = true,
  });

  UserProfile copyWith({
    String? userName,
    String? accountNumber,
    double? balance,
    double? rewardsAmount,
    String? profileImagePath,
    bool? isBalanceVisible,
  }) {
    return UserProfile(
      userName: userName ?? this.userName,
      accountNumber: accountNumber ?? this.accountNumber,
      balance: balance ?? this.balance,
      rewardsAmount: rewardsAmount ?? this.rewardsAmount,
      profileImagePath: profileImagePath ?? this.profileImagePath,
      isBalanceVisible: isBalanceVisible ?? this.isBalanceVisible,
    );
  }
}

// State Notifier
class UserProfileNotifier extends StateNotifier<UserProfile> {
  UserProfileNotifier()
      : super(
    UserProfile(
      userName: 'Timothy',
      accountNumber: '0000000000',
      balance: 7500.00,
      rewardsAmount: 7500.00,
      profileImagePath: 'assets/images/gotv.png',
    ),
  );

  void toggleBalanceVisibility() {
    state = state.copyWith(isBalanceVisible: !state.isBalanceVisible);
  }

  void updateBalance(double newBalance) {
    state = state.copyWith(balance: newBalance);
  }

  void updateRewards(double newRewards) {
    state = state.copyWith(rewardsAmount: newRewards);
  }
}

// Provider
final userProfileProvider =
StateNotifierProvider<UserProfileNotifier, UserProfile>((ref) {
  return UserProfileNotifier();
});

// Widget
class ProfileHeaderCard extends ConsumerWidget {
  final VoidCallback? onSecurityTipsTap;
  final VoidCallback? onRewardsTap;

  const ProfileHeaderCard({
    Key? key,
    this.onSecurityTipsTap,
    this.onRewardsTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfile = ref.watch(userProfileProvider);
    final userProfileNotifier = ref.read(userProfileProvider.notifier);

    return Container(
      width: 335,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2B2725),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row with profile and security icon
          Row(
            children: [
              // Profile image
              Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  color: Color(0xFF4ADE80),
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.asset(
                    userProfile.profileImagePath,
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Name and account number
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello ${userProfile.userName}',
                      style: const TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontFamily: 'SF Pro',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Text(
                          userProfile.accountNumber,
                          style: const TextStyle(
                            color: Color(0xFF9CA3AF),
                            fontFamily: 'SF Pro',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            height: 1.33,
                          ),
                        ),
                        const SizedBox(width: 4),
                        InkWell(
                          onTap: () {
                            Clipboard.setData(
                              ClipboardData(text: userProfile.accountNumber),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Account number copied'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                          child: const Icon(
                            Icons.copy,
                            size: 14,
                            color: Color(0xFF9CA3AF),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Settings icon
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  'assets/icons/settings_icon.svg',
                  width: 12, // Keep the same size as the original icon
                  height: 12,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.onSurfaceVariant,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Balance section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Balance
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Your Balance',
                        style: TextStyle(
                          color: Color(0xFF9CA3AF),
                          fontFamily: 'SF Pro',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 1.33,
                        ),
                      ),
                      const SizedBox(width: 4),
                      InkWell(
                        onTap: () => userProfileNotifier.toggleBalanceVisibility(),
                        child: Icon(
                          userProfile.isBalanceVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          size: 14,
                          color: const Color(0xFF9CA3AF),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    userProfile.isBalanceVisible
                        ? '₦${userProfile.balance.toStringAsFixed(2)}'
                        : '₦****',
                    style: const TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontFamily: 'SF Pro',
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      height: 1.33,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Rewards
                  InkWell(
                    onTap: onRewardsTap,
                    child: Row(
                      children: [
                        const Text(
                          'Your Rewards',
                          style: TextStyle(
                            color: Color(0xFF60A5FA),
                            fontFamily: 'SF Pro',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            height: 1.33,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '₦${userProfile.rewardsAmount.toStringAsFixed(0)}',
                          style: const TextStyle(
                            color: Color(0xFF60A5FA),
                            fontFamily: 'SF Pro',
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            height: 1.33,
                          ),
                        ),
                        const SizedBox(width: 2),
                        const Icon(
                          Icons.chevron_right,
                          size: 16,
                          color: Color(0xFF60A5FA),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Security Tips button
              InkWell(
                onTap: onSecurityTipsTap,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'View Security Tips',
                    style: TextStyle(
                      color: Color(0xFF1F2937),
                      fontFamily: 'SF Pro',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      height: 1.33,
                    ),
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

