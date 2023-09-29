import 'package:brewsko/main.dart';
import 'package:brewsko/user.pages/profile.screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: LoginScreen.routeName,
    pageBuilder: (context, state) => const NoTransitionPage(
      child: LoginBody(),
    ),
  ),
  GoRoute(
    path: ProfileScreen.routeName,
    pageBuilder: (context, state) => const NoTransitionPage(
      child: ProfileBody(),
    ),
  ),
]);
