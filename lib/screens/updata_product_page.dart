import 'package:flutter/material.dart';
import 'package:store_app/widgets/mybutton.dart';
import 'package:store_app/widgets/mytextfield.dart';

class UpdateProductPage extends StatelessWidget {
  static String id = 'Update Page';
  String? productName, description, image;
  int? price;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                price = int.parse(data);
              },
              typeOfText: TextInputType.number,
            ),
            MyTextField(
              hint: 'Image',
              onCahnged: (data) {
                image = data;
              },
            ),
            MyButton(text: 'Updata', function: () {}),
          ],
        ),
      ),
    );
  }
}
