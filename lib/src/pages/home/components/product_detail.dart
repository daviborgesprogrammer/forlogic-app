import 'package:cached_network_image/cached_network_image.dart';
import 'package:corelabchallenge/src/core/extensions/formatter_extensions.dart';
import 'package:corelabchallenge/src/core/ui/helpers/size_extensions.dart';
import 'package:corelabchallenge/src/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

import '../../../core/ui/styles/colors_app.dart';
import '../../../models/product_model.dart';

class ProductDetail extends StatelessWidget {
  final ProductModel product;
  const ProductDetail(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.i.background,
        iconTheme: IconThemeData(color: ColorsApp.i.primary),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              width: context.percentWidth(.9),
              child: RichText(
                text: TextSpan(
                    text: product.category,
                    style: context.textStyles.textBlack
                        .copyWith(color: ColorsApp.i.textSecondary),
                    children: [
                      TextSpan(
                          text: ' > ${product.name}',
                          style: context.textStyles.textRegular
                              .copyWith(color: ColorsApp.i.textPrimary))
                    ]),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              width: context.screenWidth,
              color: Colors.white,
              child: CachedNetworkImage(
                imageUrl: product.urlImage,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Container(
              width: context.percentWidth(.9),
              padding: const EdgeInsets.all(16),
              child: Text(
                product.name,
                style: context.textStyles.textBold
                    .copyWith(color: ColorsApp.i.textPrimary, fontSize: 18),
              ),
            ),
            Container(
              width: context.percentWidth(.9),
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Text(
                product.description,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    product.priceOriginal.currencyPTBR,
                    style: context.textStyles.textSemiBold.copyWith(
                        color: ColorsApp.i.textTernary,
                        fontSize: 14,
                        decoration: TextDecoration.lineThrough),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 8),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
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
                ],
              ),
            ),
            Container(
              width: context.percentWidth(.9),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Text(
                product.price.currencyPTBR,
                style: context.textStyles.textBold.copyWith(
                  color: ColorsApp.i.textSecondary,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
