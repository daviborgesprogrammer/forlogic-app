import 'package:corelabchallenge/src/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../core/ui/helpers/loader.dart';
import '../../core/ui/helpers/message.dart';
import '../../core/ui/styles/colors_app.dart';
import 'categories_controller.dart';
import 'components/category_tile.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> with Loader, Messages {
  final CategoriesController controller = CategoriesController();
  late final ReactionDisposer statusDisposer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) async {
        switch (status) {
          case CategoriesStateStatus.initial:
            break;
          case CategoriesStateStatus.loading:
            showLoader();
            break;
          case CategoriesStateStatus.loaded:
            hideLoader();
            break;
          case CategoriesStateStatus.error:
            hideLoader();
            showError(controller.errorMessage ?? 'Erro');
            break;
        }
      });
      controller.getCategories();
    });
    super.initState();
  }

  @override
  void dispose() {
    statusDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.i.background,
        title: Text(
          'Categorias',
          style: context.textStyles.textMedium
              .copyWith(color: ColorsApp.i.textPrimary, fontSize: 24),
        ),
        centerTitle: false,
      ),
      body: Observer(
        builder: (_) => ListView.separated(
            padding: const EdgeInsets.only(bottom: 20),
            itemBuilder: (_, index) =>
                CategoryTile(category: controller.categories[index]),
            separatorBuilder: (_, index) =>
                const Divider(color: Colors.grey, height: 1),
            itemCount: controller.categories.length),
      ),
    );
  }
}
