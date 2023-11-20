import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:quran_mobile_app/providers/ayat_provider.dart';

import '../../../constants/color_palette.dart';
// import '../../../routes/app_route.dart';

class PrayerTimeTile extends StatelessWidget {
  const PrayerTimeTile({
    Key? key,
    this.fajr,
    this.dhuhr,
    this.asr,
    this.maghrib,
    this.isha,
    this.title,
  });

  final String? fajr;
  final String? dhuhr;
  final String? asr;
  final String? maghrib;
  final String? isha;
  final String? title;

  @override
  Widget build(BuildContext context) {
    String waktu;
    String zonaWaktu;

    final timeMap = {
      'Fajr': fajr,
      'Dhuhr': dhuhr,
      'Asr': asr,
      'Maghrib': maghrib,
      'Isha': isha,
    };

    String responseValue = timeMap[title] ?? '';

    int indexKurung = responseValue.indexOf(" (");
    if (indexKurung != -1) {
      waktu = responseValue.substring(0, indexKurung);
      zonaWaktu =
          responseValue.substring(indexKurung + 2, responseValue.length - 1);
    } else {
      waktu = responseValue;
      zonaWaktu = "";
    }

    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  waktu,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ColorPalette.purple5,
                  ),
                ),
                Text(
                  zonaWaktu,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              title!,
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: ColorPalette.purple3,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Divider(),
      ],
    );
  }
}
