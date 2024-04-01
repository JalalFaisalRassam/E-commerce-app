import 'package:phone_commerce_app/models/my_product.dart';
import 'package:phone_commerce_app/pages/details_screen.dart';
import 'package:phone_commerce_app/components/product_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            "Our Products",
            style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildProductCategory(index: 0, name: "All Products"),
                _buildProductCategory(index: 1, name: "galaxy"),
                _buildProductCategory(index: 2, name: "iphone"),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: isSelected == 0
                ? _buidAllProducts()
                : isSelected == 1
                    ? _buildGalaxy()
                    : _buildIphone(),
          )
        ],
      ),
    );
  }

  Widget _buildProductCategory({required int index, required String name}) {
    return GestureDetector(
      onTap: () => setState(() => isSelected = index),
      child: Container(
        width: 100,
        height: 40,
        margin: const EdgeInsets.only(top: 10, right: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected == index ? Colors.green : Colors.green.shade300,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          name,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

Widget _buidAllProducts() => GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (100 / 140),
        crossAxisSpacing: 10,
        mainAxisSpacing: 12,
      ),
      scrollDirection: Axis.vertical,
      itemCount: MyProducts.allProducts.length,
      itemBuilder: (context, index) {
        final allProducts = MyProducts.allProducts[index];
        return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(product: allProducts),
                )),
            child: ProductCard(product: allProducts));
      },
    );

Widget _buildGalaxy() => GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (100 / 140),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      scrollDirection: Axis.vertical,
      itemCount: MyProducts.galaxy.length,
      itemBuilder: (context, index) {
        final galaxy = MyProducts.galaxy[index];
        return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(product: galaxy),
                )),
            child: ProductCard(product: galaxy));
      },
    );

Widget _buildIphone() => GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: (100 / 140),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      scrollDirection: Axis.vertical,
      itemCount: MyProducts.iphone.length,
      itemBuilder: (context, index) {
        final iphone = MyProducts.iphone[index];
        return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(product: iphone),
                )),
            child: ProductCard(product: iphone));
      },
    );
