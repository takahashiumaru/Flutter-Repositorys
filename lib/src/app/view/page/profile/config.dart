// ignore_for_file: lines_longer_than_80_chars

// import 'package:flutter_repository/src/app/view/page/product_category_list/product_category_list_page.dart';
// import 'package:flutter_repository/src/app/view/page/product_company_list/product_company_list_page.dart';
// import 'package:flutter_repository/src/app/view/page/product_list/product_list_page.dart';
import 'package:flutter_repository/src/app/view/widget/container_profile.dart';
import 'package:flutter/material.dart';

class Config extends StatelessWidget {
  const Config({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        leading: Transform.translate(
          offset: const Offset(7, 0),
          child: IconButton(
            padding: const EdgeInsets.only(right: 18),
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
            iconSize: 24,
          ),
        ),
        title: const Text('Config'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          children: [
            InkWell(
              onTap: () {
                // Navigator.push(context, ProductListPage.route());
              },
              child: ContainerProfile(
                label: 'Product',
                icon: Icons.production_quantity_limits_rounded,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                // Navigator.push(context, ProductCompanyListPage.route());
              },
              child: ContainerProfile(label: 'Company', icon: Icons.local_post_office),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                // Navigator.push(context, ProductCategoryListPage.route());
              },
              child: ContainerProfile(label: 'Category', icon: Icons.card_travel),
            ),
          ],
        ),
      ),
    );
  }
}
