import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valarpayee/core/utils/color_utils.dart';
import 'core/routing/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // For web compatibility, we need to handle ScreenUtil differently
    if (kIsWeb) {
      return MaterialApp.router(
        title: 'ValarPay',
        debugShowCheckedModeBanner: false,
        theme: _getLightTheme(),
        darkTheme: _getDarkTheme(),
        themeMode: ThemeMode.system,
        routerConfig: router,
      );
    }

    return ScreenUtilInit(
      designSize: const Size(375, 812), // Figma design dimensions
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'ValarPay',
          debugShowCheckedModeBanner: false,
          theme: _getLightTheme(),
          darkTheme: _getDarkTheme(),
          themeMode: ThemeMode.system,
          routerConfig: router,
        );
      },
    );
  }

  String? _getFontFamily() {
    if (kIsWeb) return "Roboto";
    try {
      // Use defaultTargetPlatform for safer platform detection
      return defaultTargetPlatform == TargetPlatform.iOS ? null : "Roboto";
    } catch (e) {
      return "Roboto"; // Fallback
    }
  }

  ThemeData _getLightTheme() {
    return ThemeData(
        fontFamily: _getFontFamily(),
        colorScheme: ColorScheme.fromSeed(
          seedColor: appTheme.primaryColor,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        textTheme: Typography.blackCupertino);
  }

  ThemeData _getDarkTheme() {
    return ThemeData(
        fontFamily: _getFontFamily(),
        colorScheme: ColorScheme.fromSeed(
          seedColor: appTheme.primaryColor,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.grey[900],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[900],
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        textTheme: Typography.whiteCupertino);
  }
}
