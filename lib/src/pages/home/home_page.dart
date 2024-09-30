import 'package:corelabchallenge/src/core/ui/helpers/size_extensions.dart';
import 'package:corelabchallenge/src/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';

import '../../core/ui/helpers/debouncer.dart';
import '../../core/ui/helpers/loader.dart';
import '../../core/ui/helpers/message.dart';
import '../../core/ui/styles/colors_app.dart';
import '../../models/product_model.dart';
import '../../services/suggestion/suggestion_service.dart';
import 'components/appbar/appbar_no_search.dart';
import 'components/appbar/appbar_searchable.dart';
import 'components/filter_dialog.dart';
import 'components/product_detail.dart';
import 'components/result_not_found.dart';
import 'components/search_date_tile.dart';
import 'components/search_result_tile.dart';
import 'components/suggestion_tile.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Loader, Messages {
  final HomeController controller = HomeController();
  late final ReactionDisposer statusDisposer;
  final debouncer = Debouncer(milliseconds: 500);
  final focusSearch = FocusNode();
  bool enableSearch = false;
  final searchEC = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      statusDisposer = reaction((_) => controller.status, (status) async {
        switch (status) {
          case HomeStateStatus.initial:
            break;
          case HomeStateStatus.loading:
            showLoader();
            break;
          case HomeStateStatus.loadingSuggestion:
            showLoader();
            break;
          case HomeStateStatus.loaded:
            hideLoader();
            break;
          case HomeStateStatus.error:
            hideLoader();
            showError(controller.errorMessage ?? 'Erro');
            break;
        }
      });
      controller.loadProducts();
    });
    super.initState();
  }

  @override
  void dispose() {
    statusDisposer();
    focusSearch.dispose();
    searchEC.dispose();
    super.dispose();
  }

  void showFilters(BuildContext context) async {
    var filters = await showDialog(
        context: context,
        builder: (_) {
          return FilterDialog(controller.filterType);
        });
    if (filters != null) {
      controller.filter(controller.filterQuery, filters);
    }
  }

  void _findProducts(String filter) {
    controller.filter(filter, [false, false, false, false]);
  }

  void _openModal(ProductModel product) {
    showAdaptiveActionSheet(
      context: context,
      title: Text(
        product.name,
        style: context.textStyles.textBold.copyWith(fontSize: 20),
      ),
      androidBorderRadius: 30,
      actions: <BottomSheetAction>[
        BottomSheetAction(
          title: Text(
            'DETALHE',
            style: context.textStyles.textMedium
                .copyWith(color: ColorsApp.i.primary),
          ),
          onPressed: (context) => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => ProductDetail(product),
            ),
          ),
        ),
      ],
      cancelAction: CancelAction(
          title: Text(
        'CANCELAR',
        style: context.textStyles.textMedium.copyWith(color: Colors.red),
      )), // onPressed parameter is optional by default will dismiss the ActionSheet
    );
  }

  @override
  Widget build(BuildContext context) {
    double appBarSize =
        context.appbarHeight < 80.0 ? 80.0 : context.appbarHeight;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: appBarSize,
        title: Observer(
          builder: (_) => controller.searchable
              ? AppbarSearchable(
                  controller,
                  appBarSize,
                  backButton: () {
                    controller.setSearchable(false);
                    controller.setFilterQuery('');
                    searchEC.text = '';
                  },
                  searchSubmitted: (value) async {
                    controller.filter(value, controller.filterType);
                    await SuggestionService().saveSuggestion(value);
                  },
                  textController: searchEC,
                )
              : AppbarNoSearch(
                  appBarSize,
                  onTap: () async {
                    controller.setSearchable(true);
                    await controller.loadSuggestions();
                  },
                ),
        ),
        actions: [
          Observer(
              builder: (_) => controller.filterQuery.isNotEmpty
                  ? TextButton(
                      onPressed: () {
                        showFilters(context);
                      },
                      child: Text(
                        'Filtros',
                        style: context.textStyles.textBold
                            .copyWith(color: Colors.white, fontSize: 14),
                      ),
                    )
                  : const SizedBox())
        ],
      ),
      body: Observer(builder: (_) {
        return Container(
          child: controller.searchable
              ? (controller.filterQuery.isEmpty
                  ? ListView.builder(
                      itemCount: controller.suggestions.length,
                      itemBuilder: (_, index) {
                        if (index == 0) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 24, 20, 6),
                                child: Text(
                                  'Pesquisas recentes',
                                  style: context.textStyles.textMedium.copyWith(
                                      fontSize: 16,
                                      color: ColorsApp.i.textPrimary),
                                ),
                              ),
                              SuggestionTile(controller.suggestions[index],
                                  onTap: () {
                                _findProducts(controller.suggestions[index]);
                                searchEC.text = controller.suggestions[index];
                              }),
                            ],
                          );
                        }
                        return SuggestionTile(
                          controller.suggestions[index],
                          onTap: () {
                            _findProducts(controller.suggestions[index]);
                            searchEC.text = controller.suggestions[index];
                          },
                        );
                      },
                    )
                  : (controller.products.isEmpty
                      ? const ResultNotFound()
                      : ListView.builder(
                          itemCount: controller.products.length,
                          itemBuilder: (_, index) {
                            return index == 0
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 24, bottom: 14),
                                        color: ColorsApp.i.background,
                                        child: Text(
                                          '${controller.products.length} ${controller.products.length == 1 ? 'resultado encontrado' : 'resultados encontrados'}',
                                          style: context.textStyles.textMedium
                                              .copyWith(
                                                  color:
                                                      ColorsApp.i.textPrimary,
                                                  fontSize: 16),
                                        ),
                                      ),
                                      SearchResultTile(
                                        controller.products[index],
                                        onTap: () => _openModal(
                                            controller.products[index]),
                                      ),
                                    ],
                                  )
                                : SearchResultTile(controller.products[index],
                                    onTap: () =>
                                        _openModal(controller.products[index]));
                          },
                        )))
              : ListView.builder(
                  itemBuilder: (context, index) {
                    DateTime date =
                        controller.groupProducts.keys.elementAt(index);
                    List itemsInDate = controller.groupProducts[date]!;
                    if (index == 0) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 24),
                            color: ColorsApp.i.background,
                            child: Text(
                              'Últimos anúncios',
                              style: context.textStyles.textMedium.copyWith(
                                  color: ColorsApp.i.textPrimary, fontSize: 20),
                            ),
                          ),
                          SearchDateTile(title: date, items: itemsInDate)
                        ],
                      );
                    }
                    return SearchDateTile(title: date, items: itemsInDate);
                  },
                  itemCount: controller.groupProducts.length,
                ),
        );
      }),
    );
  }
}
