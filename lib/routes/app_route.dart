import 'package:go_router/go_router.dart';
import 'package:quran_mobile_app/screens/bookmark/bookmark_screen.dart';
import 'package:quran_mobile_app/screens/home/home_screen.dart';
import 'package:quran_mobile_app/screens/prayer_time/prayer_time_screen.dart';
import 'package:quran_mobile_app/screens/splash/splash_screen.dart';
import 'package:quran_mobile_app/screens/surah_detail/surah_detail_screen.dart';

class AppRoute {
  static String splash = 'splash';
  static String home = 'home';
  static String detail = 'detail';
  static String bookmark = 'bookmark';
  static String prayerTime = 'prayerTime';
}

final goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.splash,
      builder: (context, state) => const SplashScreen(),
      routes: [
        GoRoute(
          path: 'home',
          name: AppRoute.home,
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
              path: 'detail',
              name: AppRoute.detail,
              builder: (context, state) => const SurahDetailScreen(),
            ),
            GoRoute(
              path: 'bookmark',
              name: AppRoute.bookmark,
              builder: (context, state) => const BookmarkScreen(),
            ),
            GoRoute(
              path: 'prayerTime',
              name: AppRoute.prayerTime,
              builder: (context, state) => const PrayerTimeScreen(),
            )
          ],
        ),
      ],
    ),
  ],
);
