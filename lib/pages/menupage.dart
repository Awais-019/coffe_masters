import 'package:coffe_masters/datamanager.dart';
import 'package:coffe_masters/datamodel.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  final DataManager dataManager;
  const MenuPage({super.key, required this.dataManager});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: dataManager.getMenu(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var categoires = snapshot.data as List<Category>;
            return ListView.builder(
              itemCount: categoires.length,
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(categoires[index].name),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount: categoires[index].products.length,
                        itemBuilder: (context, productIndex) {
                          var product =
                              categoires[index].products[productIndex];
                          return ProductItem(
                            product: product,
                            onAdd: () {
                              dataManager.cartAdd(product);
                            },
                          );
                        })
                  ],
                );
              }),
            );
          } else {
            if (snapshot.hasError) {
              return const Text("Error");
            }
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

class ProductItem extends StatelessWidget {
  final Product product;
  final Function onAdd;

  const ProductItem({super.key, required this.product, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product.imageUrl),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(product.name,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("\$$product.price"),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: ElevatedButton(
                      onPressed: () {
                        onAdd(product);
                      },
                      child: const Text("Add")),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
