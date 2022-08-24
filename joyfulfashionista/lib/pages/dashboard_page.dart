import 'package:flutter/material.dart';
import '../config.dart';
import '../widgets/widget_home_products.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            //imageCarousel(context),
            // WidgetCategories(),
            WidgetHomeProducts(
              labelName: "Our Products",
              tagId: Config.todayOffersTagId,
            ),
            //  WidgetHomeProducts(
            //  labelName: "Top Selling Products",
            //  tagId: Config.topSellingProductsTagId,
            //)
          ],
        ),
      ),
    );
  }
}
