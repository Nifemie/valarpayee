
import 'package:go_router/go_router.dart';
import '../../features/dashboard/view/homescreen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Homescreen(),
    ),
  ],
);
