import "package:classhub/presentation/screens/alerts_page.dart";
import "package:classhub/presentation/screens/user_profile_page.dart";
import "package:classhub/providers/main_currentPage_provider.dart";
import "package:curved_navigation_bar/curved_navigation_bar.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "calendar_page.dart";
import "courses_page.dart";
import "home_page.dart";

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
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
    return SafeArea(
      top: false,
      child: Scaffold(
        body: PageView.builder(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          itemCount: _pages.length,
          itemBuilder: (context, index) {
            return Consumer<CurrentPageProvider>(
              builder: (context, currentPageProvider, child) {
                return _pages[currentPageProvider.currentPage];
              },
            );
          },
          onPageChanged: (index) {
            context.read<CurrentPageProvider>().setCurrentPage(index);
            /*setState(() {
              currentPage = index;
            });*/
          },
        ),

        /*bottomNavigationBar: NavigationBar(
          indicatorColor: Colors.deepPurple.shade500,

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
        ),*/
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: context.watch<CurrentPageProvider>().currentPage,
          items: <Widget>[
            Icon(Icons.school, color: Colors.white),
            Icon(Icons.event_available, color: Colors.white),
            Icon(Icons.menu_book_sharp, color: Colors.white),
            Icon(Icons.notifications_active, color: Colors.white),
            Icon(Icons.person_pin_rounded, color: Colors.white),
          ],
          color: Theme.of(context).colorScheme.shadow,
          buttonBackgroundColor: Colors.deepPurple,
          backgroundColor: Theme.of(context).colorScheme.surface,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 1000),
          onTap: (index) {
            context.read<CurrentPageProvider>().setCurrentPage(index);

            /*setState(() {
              currentPage = index;
            });*/
          },
          letIndexChange: (index) => true,
        ),
      ),
    );
  }
}
