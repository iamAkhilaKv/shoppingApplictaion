import 'package:flutter/foundation.dart';

class Products with ChangeNotifier {
  final String id;
  final String title;
  final String description;

  final double price;
  final String imageUrl;
  bool isFavourite;
  Products({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavourite = false,
  });
  void toggleFavouriteStatus() {
    isFavourite = !isFavourite;
    notifyListeners();
  }
}
