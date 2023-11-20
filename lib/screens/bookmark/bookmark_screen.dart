import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quran_mobile_app/constants/color_palette.dart';
import 'package:quran_mobile_app/providers/surah_provider.dart';
import 'package:quran_mobile_app/routes/app_route.dart';
import 'package:quran_mobile_app/screens/bookmark/widget/bookmark_tile.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final surahProvider = Provider.of<SurahProvider>(context);
    final data = surahProvider.surahs;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bookmark',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: ColorPalette.purple3,
          ),
        ),
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              ListTile(
                title: Text(
                  'Home',
                  style: GoogleFonts.poppins(
                    color: ColorPalette.purple5,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () {
                  context.pushReplacementNamed(AppRoute.home);
                },
              ),
              ListTile(
                title: Text(
                  'Bookmarks',
                  style: GoogleFonts.poppins(
                    color: ColorPalette.purple5,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () {
                  context.pushReplacementNamed(AppRoute.bookmark);
                },
              ),
              ListTile(
                title: Text(
                  'Prayer Times',
                  style: GoogleFonts.poppins(
                    color: ColorPalette.purple5,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onTap: () {
                  context.pushReplacementNamed(AppRoute.prayerTime);
                },
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...data!
                  .map(
                    (e) => BookmarkTile(
                      title: e.name.transliteration.en,
                      verses: 'AYAH NUMBER ${e.verses.toString()}',
                    ),
                  )
                  .toList()
            ],
          ),
        ),
      )),
    );
  }
}
