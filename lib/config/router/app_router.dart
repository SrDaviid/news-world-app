import 'package:go_router/go_router.dart';
import 'package:news_world_app/screens/auth/login_screen.dart';
import 'package:news_world_app/screens/pages/headers_news_screen.dart';
import 'package:news_world_app/screens/home_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: <GoRoute>[
    GoRoute(
      path: '/login',
      name: LoginScreen.name,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
     GoRoute(
      path: '/headers',
      name: HeaderNewsScreen.name,
      builder: (context, state) => const HeaderNewsScreen(),
    ),
  ],
);
