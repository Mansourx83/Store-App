import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class AllProductsServices {
  Future<List<ProductModel>> getAllProduct() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');

    List<ProductModel> proudctsList = [];
    for (int i = 0; i < data.length; i++) {
      proudctsList.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return proudctsList;
  }
}
