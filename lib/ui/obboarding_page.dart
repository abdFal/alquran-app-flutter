import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_application/ui/home_screen.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Quran App',
              style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Learn Quran\nRecite Once a day',
              style: GoogleFonts.montserrat(
                color: Colors.grey,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 32,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 450,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.purple),
                  child: SvgPicture.asset('images/svg/splash.svg'),
                ),
                Positioned(
                    left: 0,
                    bottom: -30,
                    right: 0,
                    child: Center(
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 16),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.orange),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                              },
                              child: Text(
                                'Get Started',
                                style: GoogleFonts.montserrat(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            )),
                      ),
                    ))
              ],
            )
          ],
        )),
      ),
    );
  }
}
