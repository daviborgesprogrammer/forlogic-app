import 'package:corelabchallenge/src/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../core/ui/styles/colors_app.dart';

// ignore: must_be_immutable
class FilterDialog extends StatefulWidget {
  final List<bool> filters;
  const FilterDialog(this.filters, {super.key});

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  bool checkTitle = false;

  bool checkDescription = false;

  bool checkPrice = false;

  bool checkCategory = false;

  @override
  void initState() {
    if (widget.filters[0]) {
      checkTitle = true;
    }
    if (widget.filters[1]) {
      checkDescription = true;
    }
    if (widget.filters[2]) {
      checkPrice = true;
    }
    if (widget.filters[3]) {
      checkCategory = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Filtros',
              style: context.textStyles.textBlack
                  .copyWith(color: ColorsApp.i.textPrimary, fontSize: 20),
            ),
            const Divider(),
            CheckboxListTile(
              value: checkTitle,
              onChanged: (bool? value) {
                setState(() {
                  checkTitle = value!;
                });
              },
              title: const Text('Titulo'),
            ),
            CheckboxListTile(
              value: checkDescription,
              onChanged: (bool? value) {
                setState(() {
                  checkDescription = value!;
                });
              },
              title: const Text('Descrição'),
            ),
            CheckboxListTile(
              value: checkPrice,
              onChanged: (bool? value) {
                setState(() {
                  checkPrice = value!;
                });
              },
              title: const Text('Preço'),
            ),
            CheckboxListTile(
              value: checkCategory,
              onChanged: (bool? value) {
                setState(() {
                  checkCategory = value!;
                });
              },
              title: const Text('Categoria'),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'CANCELAR',
                    style: context.textStyles.textBold
                        .copyWith(color: ColorsApp.i.textTernary, fontSize: 18),
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, [
                    checkTitle,
                    checkDescription,
                    checkPrice,
                    checkCategory
                  ]),
                  child: Text(
                    'APLICAR',
                    style: context.textStyles.textBold.copyWith(
                        color: ColorsApp.i.textSecondary, fontSize: 18),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
