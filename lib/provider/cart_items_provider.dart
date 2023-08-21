import 'package:learning_riverpod/model/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_items_provider.g.dart';
@riverpod
class CartItemsHandler extends _$CartItemsHandler{
  @override
  List<Product> build()=>[];

  addItem({required Product product}){
    state=[...state,...[product]];
    // state.add(product);
  }

  removeProduct({required String id}){
   state = state.where((element) => element.id!=id).toList();
  }


}

@riverpod
Future<String> testHandler( ref) async {
  await Future.delayed(Duration(seconds: 3));
  return "Taufiq";
}

