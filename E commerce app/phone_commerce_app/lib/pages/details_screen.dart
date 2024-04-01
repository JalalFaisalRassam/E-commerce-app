import 'package:phone_commerce_app/components/cart_details.dart';
import 'package:phone_commerce_app/models/product.dart';
import 'package:phone_commerce_app/providers/cart_provider.dart';
import 'package:phone_commerce_app/components/available_size.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  const DetailsScreen({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final provider = CartProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        centerTitle: true,
      ),
      body: Column(children: [
        const SizedBox(
          height: 36,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.green.shade100),
              child: Image.asset(
                product.image,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 36,
        ),
        Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          height: 400,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          ),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.name.toUpperCase(),
                  style: const TextStyle(
                      fontSize: 26, fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$' '${product.price}',
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              product.description,
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 14),
            )
          ]),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Availble Size",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),
        const Row(
          children: [
            AvailableSize(size: "US 6"),
            AvailableSize(size: "US 7"),
            AvailableSize(size: "US 8"),
            AvailableSize(size: "US 9"),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Availble Colors",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )
          ],
        ),
        const SizedBox(
          height: 8.0,
        ),
        const Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.blue,
            ),
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.green,
            ),
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.amber,
            ),
          ],
        )
      ]),
      bottomSheet: BottomAppBar(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 10,
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        child: Row(children: [
          Text(
            '\$' '${product.price}',
            style: const TextStyle(
                fontSize: 34, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          ElevatedButton.icon(
              onPressed: () {
                provider.toggleProduct(product);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartDetails()),
                );
              },
              icon: const Icon(Icons.send),
              label: const Text("Add to cart"))
        ]),
      )),
    );
  }
}
