import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_mobile_app/providers/ayat_provider.dart';
import 'package:quran_mobile_app/providers/prayer_time_provider.dart';
import 'package:quran_mobile_app/providers/surah_provider.dart';
import 'package:quran_mobile_app/routes/app_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SurahProvider()),
        ChangeNotifierProvider(create: (context) => AyatProvider()),
        ChangeNotifierProvider(create: (context) => PrayerTimeProvider()),
      ],
      child: MaterialApp.router(
        title: 'Quran App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: goRouter,
      ),
    );
  }
}
