import 'package:corelabchallenge/src/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../core/ui/styles/colors_app.dart';

class SuggestionTile extends StatelessWidget {
  final String text;
  final GestureTapCallback? onTap;
  const SuggestionTile(this.text, {required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 2),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        child: Row(
          children: [
            Icon(
              Icons.history,
              size: 24,
              color: ColorsApp.i.secondary,
            ),
            const SizedBox(width: 14),
            Text(
              text,
              style: context.textStyles.textRegular
                  .copyWith(color: ColorsApp.i.textTernary, fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
