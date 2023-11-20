import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quran_mobile_app/providers/ayat_provider.dart';

import '../../../constants/color_palette.dart';
import '../../../routes/app_route.dart';

class BookmarkTile extends StatelessWidget {
  const BookmarkTile({
    super.key,
    required this.title,
    required this.verses,
  });

  final String title;
  final String verses;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            context.read<AyatProvider>().getDetailSurah(title);
            context.pushNamed(AppRoute.detail);
          },
          child: Row(
            children: [
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
                    verses.toUpperCase(),
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Image.asset(
                'assets/images/more_vert.png',
                width: 4,
                height: 16,
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
