import 'package:coffe_masters/datamanager.dart';
import 'package:coffe_masters/datamodel.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  final DataManager dataManager;
  const OrderPage({super.key, required this.dataManager});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: dataManager.cart.length,
        itemBuilder: (context, index) {
          var item = dataManager.cart[index];
          return OrderItem(
              item: item,
              onRemove: () {
                dataManager.cartRemove(item.product);
              });
        });
  }
}

class OrderItem extends StatelessWidget {
  final ItemInCart item;
  final Function onRemove;

  const OrderItem({
    super.key,
    required this.item,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${item.quantity}x"),
              ),
            ),
            Expanded(
                flex: 6,
                child: Text(
                  item.product.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
            Expanded(
              flex: 2,
              child: Text("\$${item.product.price}"),
            ),
            Expanded(
                flex: 1,
                child: IconButton(
                    onPressed: () {
                      onRemove(item.product);
                    },
                    icon: const Icon(Icons.remove)))
          ],
        ),
      ),
    );
  }
}
