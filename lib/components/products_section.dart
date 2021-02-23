import 'package:anexa/components/product.dart';
import 'package:flutter/material.dart';

class ProductsSection extends StatelessWidget {
  final String sectionName;
  final List<Product> products;

  ProductsSection({this.sectionName, this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Container(
              child: Text(
                sectionName,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: products,
            ),
          ),
        ],
      ),
    );
  }
}
