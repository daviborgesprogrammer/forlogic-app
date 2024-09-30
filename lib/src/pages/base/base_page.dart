import 'package:flutter/material.dart';

class BasePage extends StatefulWidget {
  final List<Widget> screens;
  const BasePage({required this.screens, super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _currentIndex = 0;
  final int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: widget.screens,
      ),
      // body: PageView(
      //   controller: _pageController,
      //   physics: const NeverScrollableScrollPhysics(),
      //   onPageChanged: (int index) {
      //     setState(
      //       () {
      //         _pageIndex = index;
      //       },
      //     );
      //   },
      //   children: _buildPageViewChildren(),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: _buildItems(),
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _pageIndex,
        fixedColor: Theme.of(context).primaryColor,
      ),
    );
  }

  List<BottomNavigationBarItem> _buildItems() {
    return const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
        backgroundColor: Colors.red,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.grid_view_outlined),
        activeIcon: Icon(Icons.grid_view_rounded),
        label: 'Categorias',
        backgroundColor: Colors.blue,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.add_box_outlined),
        label: 'Anunciar',
        backgroundColor: Colors.green,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite_outline),
        label: 'Favoritos',
        backgroundColor: Colors.yellow,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_outline_outlined),
        label: 'Conta',
        backgroundColor: Colors.yellow,
      ),
    ];
  }
}
