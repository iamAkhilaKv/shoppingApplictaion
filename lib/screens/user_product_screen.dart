import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/app_drawer.dart';
import '../providers/product.dart';
import '../widgets/user_product.dart';
import './edit_product_screen.dart';

class UserProductScreen extends StatelessWidget {
  // const UserProductScreen({Key key}) : super(key: key);
  static const routeName = './user-products';

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Product>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Products'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EditProductScreen.routeName);
              },
              icon: Icon(Icons.add))
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemBuilder: (_, i) => Column(
            children: [
              UserProduct(productData.items[i].id, productData.items[i].title,
                  productData.items[i].imageUrl),
              Divider(),
            ],
          ),
          itemCount: productData.items.length,
        ),
      ),
    );
  }
}
