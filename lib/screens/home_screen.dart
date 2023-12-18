import 'package:flutter/material.dart';
import 'package:news_world_app/screens/screens.dart';
import 'package:news_world_app/services/news_service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    final List<Widget> screens = [
      const NewspaperScreen(),
      const HeaderNewsScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home screen',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: screens[selectedIndex],
      backgroundColor: Colors.indigo,
      bottomNavigationBar: BottomNavigationBar(
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
              activeIcon: Icon(Icons.public_rounded)),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper_outlined),
            label: 'Headers',
            activeIcon: Icon(Icons.newspaper_rounded),
          ),
        ],
        selectedItemColor: Colors.red,
      ),
    );
  }
}
