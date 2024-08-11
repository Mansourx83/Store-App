import 'dart:convert';

import 'package:http/http.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class CategoriesServices {
  Future<List<ProductModel>> getCategoriesProducts(
      {required String categorieyName}) async {
    List<dynamic> data = await Api()
        .get(url: 'https://fakestoreapi.com/products/category/$categorieyName');

    List<ProductModel> proudctsList = [];
    for (int i = 0; i < data.length; i++) {
      proudctsList.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return proudctsList;
  }
}
