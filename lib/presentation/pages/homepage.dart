import 'package:cart/data/providers/cart_proivder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cart/data/model/datamodel.dart';
import 'package:cart/presentation/pages/itemDesc.dart';
import 'package:cart/presentation/pages/cart.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static final List<ItemDataModel> itemData = [
    ItemDataModel(
      name: 'TV',
      image: 'assets/images/Tv.png',
      price: 20000.0,
      desc: 'Display: 2K, Color: Black, Size: 32inch',
    ),
    ItemDataModel(
      name: 'Laptop',
      image: 'assets/images/Laptop.png',
      price: 60000.0,
      desc: 'Display: 2K, Color: Black, Size: 19.2inch, RAM: 4GB',
    ),
    ItemDataModel(
      name: 'Computer',
      image: 'assets/images/computer.png',
      price: 50000.0,
      desc: 'Display: 2K, Color: Black, Size: 24inch, RAM: 4GB',
    ),
    ItemDataModel(
      name: 'Mobile',
      image: 'assets/images/mobile.png',
      price: 12000.0,
      desc: 'Color: Black, Camera: 48MP, RAM: 4GB, ROM: 64GB',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Cart()),
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
                icon: const Icon(Icons.add_shopping_cart),
                onPressed: () {
                  Provider.of<CartProvider>(context, listen: false)
                      .addToCart(itemData[index]);
                },
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        ItemDetail(itemDataModel: itemData[index]),
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
