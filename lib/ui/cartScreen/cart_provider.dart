import 'package:flutter/foundation.dart';

import 'cart_model.dart';

class CartCardModel extends ChangeNotifier {
  List<CartCard> cartCard = [
    CartCard(
      image: "assets/images/asset3.png",
      name: "The Unknow",
      eth: "2.25",
      creator: "iamjackrider",
    ),
    CartCard(
      image: "assets/images/asset2.png",
      name: "The Unknow",
      eth: "2.25",
      creator: "iamjackrider",
    ),
    CartCard(
      image: "assets/images/asset5.png",
      name: "The Unknow",
      eth: "2.25",
      creator: "iamjackrider",
    ),
    CartCard(
      image: "assets/images/asset1.png",
      name: "The Unknow",
      eth: "2.25",
      creator: "iamjackrider",
    ),
    CartCard(
      image: "assets/images/asset4.png",
      name: "The Unknow",
      eth: "2.25",
      creator: "iamjackrider",
    )
  ];
}
