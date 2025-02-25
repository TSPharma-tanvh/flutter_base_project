import 'package:fancy_bar/fancy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/grocerry_kit/home_page.dart';

class AnimatedBottomBar extends StatefulWidget {
  static String tag = 'animatedBottomBar';

  const AnimatedBottomBar({super.key});

  @override
  _AnimatedBottomBarState createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar> {
  int pos = 0;

  void setItem(int pos) {
    setState(() {
      pos = pos;
    });
  }

  int _currentIndex = 0;

  void _onItemSelected(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Define navigation based on index
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/grocerry/home');
        break;
      case 1:
        // Navigator.pushNamed(context,
        //     '/grocerry/trending'); // Add this route in your MaterialApp
        Navigator.pushNamed(context, '/grocerry/auth'); // A
        break;
      case 2:
        // Navigator.pushNamed(
        //     context, '/grocerry/search'); // Add this route in your MaterialApp
        Navigator.pushNamed(
            context, '/grocerry/cart'); // Add this route in your MaterialApp
        break;
      case 3:
        // Navigator.pushNamed(context,
        //     '/grocerry/settings'); // Add this route in your MaterialApp
        Navigator.pushNamed(
            context, '/grocerry/auth'); // Add this route in your MaterialApp
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text(''),
      ),
      bottomNavigationBar: FancyBottomBar(
        type: FancyType.FancyV2,
        items: [
          FancyItem(
            textColor: Colors.orange,
            title: 'Home',
            icon: const Icon(Icons.home),
          ),
          FancyItem(
            textColor: Colors.red,
            title: 'Trending',
            icon: const Icon(Icons.trending_up),
          ),
          FancyItem(
            textColor: Colors.green,
            title: 'Search',
            icon: const Icon(Icons.search),
          ),
          FancyItem(
            textColor: Colors.brown,
            title: 'Settings',
            icon: const Icon(Icons.settings),
          ),
        ],
        onItemSelected: _onItemSelected,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
