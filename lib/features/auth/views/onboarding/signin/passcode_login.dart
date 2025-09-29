import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:valarpayee/core/utils/color_utils.dart';

class PasscodeLoginScreen extends StatefulWidget {
  const PasscodeLoginScreen({super.key});

  @override
  State<PasscodeLoginScreen> createState() => _PasscodeLoginScreenState();
}

class _PasscodeLoginScreenState extends State<PasscodeLoginScreen> {
  String _passcode = '';
  final int _passcodeLength = 6;

  void _onNumberPressed(String number) {
    if (_passcode.length < _passcodeLength) {
      setState(() {
        _passcode += number;
      });

      if (_passcode.length == _passcodeLength) {
        // Simulate passcode verification
        Future.delayed(const Duration(milliseconds: 500), () {
          context.go('/');
        });
      }
    }
  }

  void _onDeletePressed() {
    if (_passcode.isNotEmpty) {
      setState(() {
        _passcode = _passcode.substring(0, _passcode.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 40),

            const Text(
              'Enter Passcode',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Enter your 6-digit passcode to login',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 60),

            // Passcode dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_passcodeLength, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: index < _passcode.length
                        ? appTheme.primaryColor
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8),
                  ),
                );
              }),
            ),

            const SizedBox(height: 80),

            // Number pad
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  if (index == 9) {
                    return const SizedBox(); // Empty space
                  } else if (index == 10) {
                    return _buildNumberButton('0');
                  } else if (index == 11) {
                    return _buildDeleteButton();
                  } else {
                    return _buildNumberButton('${index + 1}');
                  }
                },
              ),
            ),

            // Forgot passcode
            TextButton(
              onPressed: () {
                context.go('/forgot-password');
              },
              child: const Text(
                'Forgot Passcode?',
                style: TextStyle(
                  color: appTheme.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberButton(String number) {
    return GestureDetector(
      onTap: () => _onNumberPressed(number),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
          child: Text(
            number,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDeleteButton() {
    return GestureDetector(
      onTap: _onDeletePressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(40),
        ),
        child: const Center(
          child: Icon(
            Icons.backspace_outlined,
            size: 24,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
