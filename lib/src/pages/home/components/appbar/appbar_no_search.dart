import 'package:corelabchallenge/src/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/ui/styles/colors_app.dart';

class AppbarNoSearch extends StatelessWidget {
  final GestureTapCallback? onTap;
  final double appbarHeight;
  const AppbarNoSearch(this.appbarHeight, {required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        height: appbarHeight - 24,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'Buscar',
              style: context.textStyles.textRegular
                  .copyWith(color: ColorsApp.i.textTernary, fontSize: 16),
            ),
            Icon(
              Icons.search,
              color: ColorsApp.i.textSecondary,
              size: 24,
            )
          ]),
        ),
      ),
    );
  }
}
