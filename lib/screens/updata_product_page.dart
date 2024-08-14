import 'package:flutter/material.dart';
import 'package:store_app/widgets/mybutton.dart';
import 'package:store_app/widgets/mytextfield.dart';

class UpdateProductPage extends StatelessWidget {
  const UpdateProductPage({super.key});
  static String id = 'Update Page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Update Proudct'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Column(
        children: [
          MyFormTextField(
            hint: 'Proudct Name',
          ),
          MyFormTextField(
            hint: 'Description',
          ),
          MyFormTextField(
            hint: 'Price',
          ),
          MyFormTextField(
            hint: 'Image',
          ),
          MyButton(text: 'Updata', function: () {}),
        ],
      ),
    );
  }
}
