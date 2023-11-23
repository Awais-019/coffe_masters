import 'package:coffe_masters/datamodel.dart';

class DataManager {
  List<Category>? _menu;
  List<ItemInCart> cart = [];

  cartAdd(Product p) {
    bool found = false;
    for (ItemInCart item in cart) {
      if (item.product.id == p.id) {
        item.quantity++;
        found = true;
        break;
      }

      if (!found) {
        cart.add(ItemInCart(product: p, quantity: 1));
      }
    }
  }

  cartRemove(Product p) {
    cart.removeWhere((item) => p.id == item.product.id);
  }

  cartClear() {
    cart.clear();
  }

  double cartTotal() {
    double total = 0.0;
    for (var item in cart) {
      total += item.product.price * item.quantity;
    }
    return total;
  }
}
