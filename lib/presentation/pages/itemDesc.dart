import 'package:flutter/material.dart';
import 'package:cart/data/model/datamodel.dart';

class ItemDetail extends StatelessWidget {
  final ItemDataModel itemDataModel;

  const ItemDetail({super.key, required this.itemDataModel});

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
              const SizedBox(height: 10),
              Text(
                'Price: Rs. ${itemDataModel.price.toStringAsFixed(2)}', 
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 10),
              Text(
                itemDataModel.desc,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              )
            ],                                  
          ),
        ),
      ),
    );
  }
}
