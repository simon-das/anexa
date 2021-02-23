import "package:flutter/material.dart";

class Product extends StatelessWidget {
  final String productImage, productName, productCategory, price;

  Product(
      {this.productImage, this.productName, this.productCategory, this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Color(0xFFD6D9DC),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Image(
                image: AssetImage(productImage),
                height: 120,
                width: 120,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(productName),
            ),
            Text(productCategory),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(price),
            ),
          ],
        ),
      ),
    );
  }
}
