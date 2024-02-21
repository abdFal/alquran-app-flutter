import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_application/ui/tabs/hijb_tab.dart';
import 'package:quran_application/ui/tabs/page_tab.dart';
import 'package:quran_application/ui/tabs/para_tab.dart';
import 'package:quran_application/ui/tabs/surah_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      bottomNavigationBar: _bottomNavBar(),
      body: DefaultTabController(
        length: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) => [
              SliverToBoxAdapter(
                child: _salam(),
              ),
              SliverAppBar(
                pinned: true,
                elevation: 0,
                automaticallyImplyLeading: false,
                shape: Border(
                    bottom: BorderSide(
                        color: const Color(0xFFAAAAAA).withOpacity(0.1))),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(0),
                  child: _tab(),
                ),
              )
            ],
            body: const TabBarView(
              children: [SurahTab(), HijbTab(), PageTab(), ParaTab()],
            ),
          ),
        ),
      ),
    );
  }

  TabBar _tab() => TabBar(
        labelColor: Colors.purple,
        indicatorColor: Colors.purple,
        indicatorWeight: 2,
        tabs: [
          _tabItem('Surah'),
          _tabItem('Hijb'),
          _tabItem('Page'),
          _tabItem('Para'),
        ],
      );

  Tab _tabItem(String label) => Tab(
        child: Text(
          label,
          style:
              GoogleFonts.montserrat(fontSize: 15, fontWeight: FontWeight.w400),
        ),
      );

  Column _salam() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Text(
            'Assalamu\'alaikum,',
            style: GoogleFonts.montserrat(
                color: Colors.black, fontWeight: FontWeight.w400, fontSize: 18),
          ),
          Text(
            'Abraham',
            style: GoogleFonts.montserrat(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 29),
          ),
          const SizedBox(height: 14),
          _lastRead()
        ],
      );
  Stack _lastRead() => Stack(
        children: [
          Container(
            height: 131,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFDF98FA), Color(0xFF9055FF)])),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: SvgPicture.asset('images/svg/quran_banner.svg'),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Last Read',
                  style:
                      GoogleFonts.montserrat(color: Colors.white, fontSize: 14),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Al Fatihah',
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Ayat Ke-7',
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          )
        ],
      );
  BottomNavigationBar _bottomNavBar() => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: [
          _bottomNavBarItem(icon: 'images/svg/quran_icon.svg', label: 'Quran'),
          _bottomNavBarItem(icon: 'images/svg/doa_icon.svg', label: 'Doa'),
          _bottomNavBarItem(
              icon: 'images/svg/bookmark_icon.svg', label: 'Bookmark'),
        ],
      );

  BottomNavigationBarItem _bottomNavBarItem(
          {required String icon, required String label}) =>
      BottomNavigationBarItem(
          icon: SvgPicture.asset(icon),
          activeIcon: SvgPicture.asset(icon),
          label: label);

  AppBar _appBar() => AppBar(
        title: Row(
          children: [
            SvgPicture.asset('images/svg/quran_icon.svg'),
            const SizedBox(
              width: 16,
            ),
            Text(
              'Quran App',
              style: GoogleFonts.montserrat(
                  color: Colors.purple,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: (() => {}),
              icon: SvgPicture.asset('images/svg/search_icon.svg'))
        ],
        elevation: 10,
      );
}
