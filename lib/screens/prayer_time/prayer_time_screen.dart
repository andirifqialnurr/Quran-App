import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quran_mobile_app/constants/color_palette.dart';
import 'package:quran_mobile_app/providers/prayer_time_provider.dart';
import 'package:quran_mobile_app/routes/app_route.dart';
import 'package:quran_mobile_app/screens/prayer_time/widget/prayer_time_tile.dart';

class PrayerTimeScreen extends StatefulWidget {
  const PrayerTimeScreen({super.key});

  @override
  State<PrayerTimeScreen> createState() => _PrayerTimeScreenState();
}

class _PrayerTimeScreenState extends State<PrayerTimeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PrayerTimeProvider>().getPrayerTimes();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final prayerTimeProvider = Provider.of<PrayerTimeProvider>(context);
    final prayerTimes = prayerTimeProvider.prayerTimes;
    final isLoading = prayerTimeProvider.isLoading;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Prayer Time',
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
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: width,
                      height: 200,
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
                          'Saturday',
                          style: GoogleFonts.poppins(
                            fontSize: 26,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'September 23, 2023',
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
                          'MAKASSAR (GMT+8)',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                if (isLoading)
                  const Center(
                    child: CircularProgressIndicator(),
                  )
                else ...[
                  PrayerTimeTile(fajr: prayerTimes?.fajr, title: 'Fajr'),
                  PrayerTimeTile(dhuhr: prayerTimes?.dhuhr, title: 'Dhuhr'),
                  PrayerTimeTile(asr: prayerTimes?.asr, title: 'Asr'),
                  PrayerTimeTile(
                      maghrib: prayerTimes?.maghrib, title: 'Maghrib'),
                  PrayerTimeTile(isha: prayerTimes?.isha, title: 'Isha'),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
