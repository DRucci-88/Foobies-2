import 'package:flutter/material.dart';
import 'package:foobies_app/data/repository/edamam_repository.dart';
import 'package:foobies_app/di/service_locator.dart';
import 'package:foobies_app/pages/navigations/health_page.dart';
import 'package:foobies_app/pages/navigations/home_page.dart';
import 'package:foobies_app/pages/navigations/cook_page.dart';
import 'package:foobies_app/pages/navigations/profile_page.dart';

class IndexNavigation extends StatefulWidget {
  const IndexNavigation({super.key});

  @override
  State<IndexNavigation> createState() => _IndexNavigationState();
}

class _IndexNavigationState extends State<IndexNavigation> {
  // final ValueNotifier<int> _currentIndexNavigation = ValueNotifier(0);
  int _currentIndexNavigation = 0;

  List<Widget> pages = const [
    HomePage(),
    CookPage(),
    HealthPage(),
    ProfilePage()
  ];

  EdamamRepository edamamRepository = getIt.get<EdamamRepository>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndexNavigation,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) => setState(() => _currentIndexNavigation = value),
        currentIndex: _currentIndexNavigation,
        selectedIconTheme: const IconThemeData(size: 28.0),
        // selectedFontSize: 18.0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.orange,
            tooltip: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.food_bank),
              label: 'Cook',
              backgroundColor: Colors.blue,
              tooltip: 'Cook'),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_repair_service),
            label: 'Health',
            backgroundColor: Colors.green,
            tooltip: 'Health',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.red,
            tooltip: 'Profile',
          ),
        ],
      ),
    );
  }
}
