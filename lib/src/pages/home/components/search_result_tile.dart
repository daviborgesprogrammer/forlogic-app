import 'package:cached_network_image/cached_network_image.dart';
import 'package:corelabchallenge/src/core/extensions/formatter_extensions.dart';
import 'package:corelabchallenge/src/core/ui/helpers/size_extensions.dart';
import 'package:corelabchallenge/src/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../core/ui/styles/colors_app.dart';
import '../../../models/product_model.dart';

class SearchResultTile extends StatelessWidget {
  final ProductModel product;
  final GestureTapCallback? onTap;
  const SearchResultTile(this.product, {required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        color: Colors.white,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            width: 100,
            height: 100,
            child: CachedNetworkImage(
              imageUrl: product.urlImage,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          SizedBox(
            width: context.percentWidth(.56),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (product.discount != 0)
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                            color: ColorsApp.i.primary,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4))),
                        child: Text(
                          '${product.discount}% OFF',
                          style: context.textStyles.textBold
                              .copyWith(color: Colors.white, fontSize: 10),
                        ),
                      ),
                      const SizedBox(height: 6),
                    ],
                  ),
                Text(
                  product.name,
                  style: context.textStyles.textRegular.copyWith(
                    color: ColorsApp.i.textPrimary,
                    fontSize: 16,
                  ),
                ),
                if (product.priceOriginal != product.price)
                  Column(
                    children: [
                      const SizedBox(height: 6),
                      Text(
                        product.priceOriginal.currencyPTBR,
                        style: context.textStyles.textRegular.copyWith(
                            color: ColorsApp.i.textTernary,
                            fontSize: 14,
                            decoration: TextDecoration.lineThrough),
                      ),
                    ],
                  ),
                const SizedBox(height: 6),
                Text(
                  product.price.currencyPTBR,
                  style: context.textStyles.textMedium.copyWith(
                    color: ColorsApp.i.textPrimary,
                    fontSize: 20,
                  ),
                ),
                if (product.installments > 1)
                  Column(
                    children: [
                      const SizedBox(height: 6),
                      Text(
                        'Em até ${product.installments}x de ${product.installmentValue.currencyPTBR}',
                        style: context.textStyles.textRegular.copyWith(
                            color: ColorsApp.i.textSecondary, fontSize: 14),
                      ),
                    ],
                  ),
                if (product.status == 'N')
                  Column(
                    children: [
                      const SizedBox(height: 6),
                      Text(
                        'NOVO',
                        style: context.textStyles.textMedium.copyWith(
                            color: ColorsApp.i.textTernary, fontSize: 12),
                      )
                    ],
                  ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
