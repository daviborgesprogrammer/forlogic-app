import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:corelabchallenge/src/core/ui/styles/text_styles.dart';
import 'package:corelabchallenge/src/pages/home/components/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import '../../../core/ui/styles/colors_app.dart';
import '../../../models/product_model.dart';
import 'search_result_tile.dart';

class SearchDateTile extends StatelessWidget {
  final DateTime title;
  final List items;
  const SearchDateTile({required this.title, required this.items, super.key});

  String get descriptionDay {
    var temp = DateTime.now();
    var today = DateTime.utc(temp.year, temp.month, temp.day);
    var date = DateTime.utc(title.year, title.month, title.day);
    if (date.isAtSameMomentAs(today)) {
      return 'Hoje';
    } else if (date.isAtSameMomentAs(today.subtract(const Duration(days: 1)))) {
      return 'Ontem';
    } else {
      initializeDateFormatting('pt-BR', '');
      return DateFormat('dd MMM', 'pt-BR').format(date);
    }
  }

  void _openModal(ProductModel product, BuildContext context) {
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
    return Column(
      children: [
        Column(
          children: [
            Container(
              color: ColorsApp.i.background,
              height: 38,
              padding: const EdgeInsets.only(left: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  descriptionDay,
                  style: context.textStyles.textMedium
                      .copyWith(color: ColorsApp.i.textTernary, fontSize: 14),
                ),
              ),
            ),
            const Divider(color: Color(0XFFEBF1F4), height: 1),
            ListView.separated(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) => SearchResultTile(items[index],
                  onTap: () => _openModal(items[index], context)),
              separatorBuilder: (_, index) =>
                  const Divider(color: Colors.grey, height: 1),
            ),
            const Divider(color: Color(0XFFEBF1F4), height: 1),
          ],
        ),
      ],
    );
  }
}
