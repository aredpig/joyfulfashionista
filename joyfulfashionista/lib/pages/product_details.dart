import 'package:flutter/material.dart';

import '../model/product.dart';
import '../widgets/widget_product_details.dart';
import 'base_page.dart';


class ProductDetails extends BasePage {
  ProductDetails({Key key, this.product}) : super(key: key);
  Product product;

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends BasePageState<ProductDetails> {
  @override
  Widget PageUI() {
    return ProductDetailsWidget(
      data: this.widget.product,
    );
  }
}
