import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cart/datamodel.dart';
import 'package:cart/itemDesc.dart';
import 'package:cart/cart.dart';
import 'package:cart/cart_proivder.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static final List<String> itemNames = ['TV', 'Laptop', 'Computer', 'Mobile'];
  static final List<double> prices = [20000.0, 60000.0, 50000.0, 12000.0];
  static final List<String> descriptions = [
    'Display: 2K, Color: Black, Size: 32inch',
    'Display: 2K, Color: Black, Size: 19.2inch, RAM: 4GB',
    'Display: 2K, Color: Black, Size: 24inch, RAM: 4GB',
    'Color: Black, Camera: 48MP, RAM: 4GB, ROM: 64GB',
  ];
  static final List<String> images = [
    'assets/images/Tv.png',
    'assets/images/Laptop.png',
    'assets/images/computer.png',
    'assets/images/mobile.png',
  ];

  final List<ItemDataModel> itemData = List.generate(
    itemNames.length,
    (index) => ItemDataModel(
      name: itemNames[index],
      image: images[index],
      price: prices[index],
      desc: descriptions[index],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Cart()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: itemData.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(itemData[index].name),
              subtitle: Text('Rs. ${itemData[index].price.toStringAsFixed(2)}'),
              leading: SizedBox(
                width: 50,
                height: 50,
                child: Image.asset(itemData[index].image),
              ),
              trailing: IconButton(
                icon: Icon(Icons.add_shopping_cart),
                onPressed: () {
                  Provider.of<CartProvider>(context, listen: false).addToCart(itemData[index]);
                },
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ItemDetail(itemDataModel: itemData[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
