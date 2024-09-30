import 'package:flutter/material.dart';

import 'src/core/ui/theme/theme_config.dart';
import 'src/pages/base/base_page.dart';
import 'src/pages/categories/categories_page.dart';
import 'src/pages/home/home_page.dart';

class CorelabAppChallenge extends StatelessWidget {
  const CorelabAppChallenge({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Corelab',
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig.theme,
      home: BasePage(
        screens: [
          const HomePage(),
          const CategoriesPage(),
          Container(),
          Container(),
          Container(),
        ],
      ),
    );
  }
}
