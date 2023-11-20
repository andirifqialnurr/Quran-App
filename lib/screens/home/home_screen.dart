import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quran_mobile_app/providers/surah_provider.dart';
import 'package:quran_mobile_app/routes/app_route.dart';
import 'package:quran_mobile_app/screens/home/widgets/surah_item.dart';

import '../../constants/color_palette.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SurahProvider>().getSurahs();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final surahProvider = Provider.of<SurahProvider>(context);
    final data = surahProvider.surahs;

    if (data == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Quran App',
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
                Text(
                  'Assalamualaikum',
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
                Text(
                  'Andi Rifqial Nur',
                  style: GoogleFonts.poppins(
                    color: ColorPalette.purple5,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                Stack(
                  children: [
                    Container(
                      width: width,
                      height: 180,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            ColorPalette.purple0,
                            ColorPalette.purple2,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    Positioned(
                      bottom: -50,
                      right: -80,
                      child: Image.asset('assets/images/illustration.png'),
                    ),
                    Positioned(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Last Read',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 60),
                            Text(
                              'Al-Fatihah',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Ayah No. 1',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                ...data
                    .map(
                      (e) => SurahItem(
                        title: e.name.transliteration.en,
                        subtitle:
                            '${e.revelation.en} - ${e.numberOfVerses} VERSES',
                        number: e.number.toString(),
                        arabic: e.name.short,
                      ),
                    )
                    .toList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
