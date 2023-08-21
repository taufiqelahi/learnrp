import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_riverpod/model/product.dart';
import 'package:learning_riverpod/provider/cart_items_provider.dart';
import 'package:uuid/uuid.dart';

class AddCart extends ConsumerWidget {
  const AddCart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build

    List<Product> cartItems = ref.watch(cartItemsHandlerProvider);

    var data = ref.watch(testHandlerProvider);
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              Product product = Product(
                                  id: Uuid().v4(), title: "Magic", price: 30);
                              ref
                                  .read(cartItemsHandlerProvider.notifier)
                                  .addItem(product: product);
                            },
                            child: Text("add"),
                          ),
                        ),
                      );
                    },
                  );
                },
                icon: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Icon(Icons.add_shopping_cart),
                    Transform.translate(
                        offset: Offset(4, -7),
                        child: Text(ref
                            .watch(cartItemsHandlerProvider)
                            .length
                            .toString()))
                  ],
                ))
          ],
        ),
        body: Column(
          children: [
            data.when(
              data: (name) => Text(name),
              loading: () => const CircularProgressIndicator(),
              error: (err, stack) => Text('Error: $err'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (BuildContext context, int index) {
                  Product cartItem = cartItems[index];
                  return Row(
                    children: [
                      Text(cartItem.id),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            ref
                                .read(cartItemsHandlerProvider.notifier)
                                .removeProduct(id: cartItem.id);
                          },
                          icon: Icon(Icons.delete))
                    ],
                  );
                },
              ),
            ),
          ],
        ));
  }
}
