import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_mobile_app/routes/app_route.dart';

import '../../../constants/color_palette.dart';

class AyatItem extends StatelessWidget {
  const AyatItem({
    super.key,
    required this.number,
    required this.tranlation,
    required this.arabic,
  });

  final String number;
  final String tranlation;
  final String arabic;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const SizedBox(width: 10),
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: ColorPalette.purple2,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Text(
                    number,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.play_arrow_outlined,
                  color: ColorPalette.purple3,
                  size: 36,
                ),
              ),
              IconButton(
                onPressed: () {
                  context.pushReplacementNamed(AppRoute.bookmark);
                },
                icon: Icon(
                  Icons.bookmark_border,
                  color: ColorPalette.purple3,
                  size: 28,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: width,
          margin: const EdgeInsets.all(20),
          child: Text(
            arabic,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: ColorPalette.purple5,
            ),
            textAlign: TextAlign.end,
          ),
        ),
        Container(
          width: width,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            tranlation,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: ColorPalette.purple5,
            ),
          ),
        ),
      ],
    );
  }
}
