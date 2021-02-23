import 'package:anexa/components/carousel_element.dart';
import 'package:anexa/components/product.dart';
import 'package:anexa/components/products_section.dart';
import 'package:anexa/components/sign_out_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignedInWidget extends StatefulWidget {
  @override
  _SignedInWidgetState createState() => _SignedInWidgetState();
}

class _SignedInWidgetState extends State<SignedInWidget> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Anexa",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
        ),
        actions: [
          ClipOval(
            child: Material(
              child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => Dialog(
                      child: Container(
                        height: 250,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15, left: 10, right: 10),
                          child: SignOutWidget(
                            user: user,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                child: Image.network(user.photoURL),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          padding: const EdgeInsets.only(top: 10),
          children: <Widget>[
            CarouselSlider(
              items: [
                CarouselElement(imagePath: "images/shirt.jpg"),
                CarouselElement(imagePath: "images/shoe.jpg"),
                CarouselElement(imagePath: "images/laptop.jpg"),
                CarouselElement(imagePath: "images/phone.jpg"),
              ],
              options: CarouselOptions(
                height: 280,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
            ProductsSection(
              sectionName: "Shirt",
              products: [
                Product(
                  productName: "Shirt1",
                  productCategory: "Shirt",
                  price: "150\$",
                  productImage: "images/shirt1.jpg",
                ),
                Product(
                  productName: "Shirt2",
                  productCategory: "Shirt",
                  price: "250\$",
                  productImage: "images/shirt2.jpg",
                ),
                Product(
                  productName: "Shirt3",
                  productCategory: "Shirt",
                  price: "350\$",
                  productImage: "images/shirt3.jpg",
                ),
                Product(
                  productName: "Shirt4",
                  productCategory: "Shirt",
                  price: "50\$",
                  productImage: "images/shirt4.jpg",
                ),
              ],
            ),
            ProductsSection(
              sectionName: "Shoe",
              products: [
                Product(
                  productName: "Shoe1",
                  productCategory: "Shoe",
                  price: "150\$",
                  productImage: "images/shoe1.jpg",
                ),
                Product(
                  productName: "Shoe2",
                  productCategory: "Shoe",
                  price: "450\$",
                  productImage: "images/shoe2.jpg",
                ),
                Product(
                  productName: "Shoe3",
                  productCategory: "Shoe",
                  price: "350\$",
                  productImage: "images/shoe3.jpg",
                ),
                Product(
                  productName: "Shoe4",
                  productCategory: "Shoe",
                  price: "550\$",
                  productImage: "images/shoe4.jpg",
                ),
              ],
            ),
            ProductsSection(
              sectionName: "Laptop",
              products: [
                Product(
                  productName: "Laptop1",
                  productCategory: "Laptop",
                  price: "150\$",
                  productImage: "images/laptop1.jpg",
                ),
                Product(
                  productName: "Laptop2",
                  productCategory: "Laptop",
                  price: "350\$",
                  productImage: "images/laptop2.jpg",
                ),
                Product(
                  productName: "Laptop3",
                  productCategory: "Laptop",
                  price: "550\$",
                  productImage: "images/laptop3.jpg",
                ),
                Product(
                  productName: "Laptop4",
                  productCategory: "Laptop",
                  price: "150\$",
                  productImage: "images/laptop4.jpg",
                ),
              ],
            ),
            ProductsSection(
              sectionName: "Phone",
              products: [
                Product(
                  productName: "Phone1",
                  productCategory: "Phone",
                  price: "150\$",
                  productImage: "images/phone1.jpg",
                ),
                Product(
                  productName: "Phone2",
                  productCategory: "Phone",
                  price: "450\$",
                  productImage: "images/phone2.jpg",
                ),
                Product(
                  productName: "Phone3",
                  productCategory: "Phone",
                  price: "650\$",
                  productImage: "images/phone3.jpg",
                ),
                Product(
                  productName: "Phone4",
                  productCategory: "Phone",
                  price: "850\$",
                  productImage: "images/phone4.jpg",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
