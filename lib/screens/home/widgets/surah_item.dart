import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quran_mobile_app/providers/ayat_provider.dart';

import '../../../constants/color_palette.dart';
import '../../../routes/app_route.dart';

class SurahItem extends StatelessWidget {
  const SurahItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.number,
    required this.arabic,
  });

  final String title;
  final String subtitle;
  final String number;
  final String arabic;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            context.read<AyatProvider>().getDetailSurah(number);
            context.pushNamed(AppRoute.detail);
          },
          child: Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/images/border.png'),
                  Text(
                    number,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: ColorPalette.purple5,
                    ),
                  )
                ],
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: ColorPalette.purple5,
                    ),
                  ),
                  Text(
                    subtitle.toUpperCase(),
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                arabic,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: ColorPalette.purple3,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const Divider(),
      ],
    );
  }
}
