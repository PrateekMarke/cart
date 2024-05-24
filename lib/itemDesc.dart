import 'package:flutter/material.dart';
import 'package:cart/datamodel.dart';

class ItemDetail extends StatelessWidget {
  final ItemDataModel itemDataModel;

  const ItemDetail({Key? key, required this.itemDataModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(itemDataModel.name),),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset(
                itemDataModel.image,
                width: 350,
                height: 300,
              ),
              SizedBox(height: 10),
              Text(
                'Price: Rs. ${itemDataModel.price.toStringAsFixed(2)}', // Formatting the double price
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                itemDataModel.desc,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )
            ],                                  
          ),
        ),
      ),
    );
  }
}