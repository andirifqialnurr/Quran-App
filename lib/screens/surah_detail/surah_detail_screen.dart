import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quran_mobile_app/providers/ayat_provider.dart';
import 'package:quran_mobile_app/screens/surah_detail/widgets/ayat_item.dart';

import '../../constants/color_palette.dart';

class SurahDetailScreen extends StatefulWidget {
  const SurahDetailScreen({super.key});

  @override
  State<SurahDetailScreen> createState() => _SurahDetailScreenState();
}

class _SurahDetailScreenState extends State<SurahDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final ayatProvider = Provider.of<AyatProvider>(context);
    final data = ayatProvider.surah;

    if (data == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          data.name.transliteration.en,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: ColorPalette.purple3,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 40),
                      color: ColorPalette.purple4.withOpacity(0.5),
                      spreadRadius: -20,
                      blurRadius: 40,
                    ),
                  ],
                ),
                width: width,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: width,
                      height: 280,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            ColorPalette.purple0,
                            ColorPalette.purple2,
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -90,
                      right: -100,
                      child: Opacity(
                        opacity: 0.1,
                        child: Container(
                          width: width,
                          height: 280,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/illustration.png',
                              ),
                              scale: .8,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          data.name.transliteration.en,
                          style: GoogleFonts.poppins(
                            fontSize: 26,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          data.name.translation.en,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: width / 1.5,
                          child: const Divider(
                            color: Colors.white54,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '${data.revelation.en.toUpperCase()} - ${data.numberOfVerses.toString()} VERSES',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Image.asset('assets/images/basmalah.png'),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ...data.verses!
                  .map(
                    (e) => AyatItem(
                      number: e.number.inSurah.toString(),
                      tranlation: e.translation.id,
                      arabic: e.text.arab,
                    ),
                  )
                  .toList(),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
