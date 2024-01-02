import 'package:flutter/material.dart';
import 'package:news_world_app/screens/screens.dart';

class HomeScreen extends StatefulWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final List<Widget> screens = [
      const NewspaperScreen(),
      const HeaderNewsScreen(),
    ];

    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 4.3,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(
            () {
              selectedIndex = index;
            },
          );
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.public_sharp),
            label: 'News',
            activeIcon: Icon(Icons.public_rounded),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper_outlined),
            label: 'Headers',
            activeIcon: Icon(Icons.newspaper_rounded),
          ),
        ],
        selectedItemColor: Colors.indigo,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
