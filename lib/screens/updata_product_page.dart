import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/mybar.dart';
import 'package:store_app/widgets/mybutton.dart';
import 'package:store_app/widgets/mytextfield.dart';

class UpdateProductPage extends StatefulWidget {
  static String id = 'Update Page';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, description, image, price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Update Product'),
          backgroundColor: Colors.transparent,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              MyTextField(
                hint: 'Product Name',
                onCahnged: (data) {
                  productName = data;
                },
              ),
              MyTextField(
                hint: 'Description',
                onCahnged: (data) {
                  description = data;
                },
              ),
              MyTextField(
                hint: 'Price',
                onCahnged: (data) {
                  price = data;
                },
                typeOfText: TextInputType.number,
              ),
              MyTextField(
                hint: 'Image',
                onCahnged: (data) {
                  image = data;
                },
              ),
              MyButton(
                  text: 'Update',
                  function: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                      await updateProduct(product);
                      showBar(context,
                          text: 'Success Update', color: Colors.green);
                    } catch (e) {
                      showBar(context,
                          text: 'Failed Update', color: Colors.red);
                      print('Error is : ${e.toString()}');
                    }
                    isLoading = false;
                    setState(() {});
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProduct().updateProduct(
      title: productName == null ? product.title : productName!,
      price: price == null ? product.price.toString() : price!,
      description: description == null ? product.description : description!,
      image: image == null ? product.image : image!,
      category: product.category,
      id: product.id,
    );
  }
}
