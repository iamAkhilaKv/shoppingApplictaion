import 'package:flutter/material.dart';
import '../providers/product.dart';
import '../screens/edit_product_screen.dart';
import 'package:provider/provider.dart';

class UserProduct extends StatelessWidget {
  @override
  final String id;
  final String title;
  final String imageUrl;
  UserProduct(this.id, this.title, this.imageUrl);
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(EditProductScreen.routeName, arguments: id);
              },
              icon: Icon(Icons.edit),
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              onPressed: () {
                Provider.of<Product>(context, listen: false).deleteProduct(id);
              },
              icon: Icon(Icons.delete),
              color: Theme.of(context).primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
