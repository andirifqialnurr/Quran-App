import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_mobile_app/constants/color_palette.dart';
import 'package:quran_mobile_app/routes/app_route.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    Future.delayed(const Duration(seconds: 3), () {
      context.pushReplacementNamed(AppRoute.home);
    });

    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Quran App',
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: ColorPalette.purple3,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Learn Quran and',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              Text(
                'Recite once everyday',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 40),
              Image.asset('assets/images/splash.png'),
            ],
          ),
        ),
      ),
    );
  }
}
