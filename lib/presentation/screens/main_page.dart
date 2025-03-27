import "package:classhub/presentation/screens/alerts_page.dart";
import "package:classhub/presentation/screens/user_profile_page.dart";
import "package:flutter/material.dart";

import "calendar_page.dart";
import "courses_page.dart";
import "home_page.dart";

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController();
  final List _pages = [
    HomePage(),
    CalendarPage(),
    CoursesPage(),
    AlertsPage(),
    UserProfilePage(),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        itemCount: _pages.length,
        itemBuilder: (context, index) {
          return _pages[currentPage];
        },
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
      ),

      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.purple.shade400,

        selectedIndex: currentPage,
        destinations: [
          NavigationDestination(
            selectedIcon: Icon(Icons.school, color: Colors.white),
            icon: Icon(Icons.school_outlined, color: Colors.grey),
            label: "Accueil",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.event_available, color: Colors.white),
            icon: Icon(Icons.event_available, color: Colors.grey),
            label: "Calendrier",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.menu_book_sharp, color: Colors.white),
            icon: Icon(Icons.menu_book_sharp, color: Colors.grey),
            label: "Cours",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.notifications_active, color: Colors.white),
            icon: Icon(Icons.notifications_active_outlined, color: Colors.grey),
            label: "Alert",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person_pin_rounded, color: Colors.white),
            icon: Icon(Icons.person_pin_outlined, color: Colors.grey),
            label: "Profil",
          ),
        ],

        onDestinationSelected: (index) {
          setState(() {
            currentPage = index;
          });
        },
      ),
    );
  }
}
