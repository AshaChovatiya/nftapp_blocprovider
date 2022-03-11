import 'package:flutter/cupertino.dart';

import 'home_model.dart';

class TrendinCardModel extends ChangeNotifier {
  //TrendingCard Model
  List<TrendingCard> trendingcard = [
    TrendingCard(
        creator: "iamjackrider",
        eth: "2.25",
        image: "assets/images/asset5.png",
        name: "The Unknow",
        owner: "iamjackrider"),
    TrendingCard(
        creator: "iamjackrider",
        eth: "2.25",
        image: "assets/images/asset4.png",
        name: "The Unknow",
        owner: "iamjackrider"),
    TrendingCard(
        creator: "iamjackrider",
        eth: "2.25",
        image: "assets/images/asset3.png",
        name: "The Unknow",
        owner: "iamjackrider"),
    TrendingCard(
        creator: "iamjackrider",
        eth: "2.25",
        image: "assets/images/asset2.png",
        name: "The Unknow",
        owner: "iamjackrider"),
    TrendingCard(
        creator: "iamjackrider",
        eth: "2.25",
        image: "assets/images/asset1.png",
        name: "The Unknow",
        owner: "iamjackrider")
  ];

  //RecentCard Model
  List<RecentCard> recentCard = [
    RecentCard(
      image: "assets/images/asset1.png",
      name: "The Unknow",
      eth: "2.25",
      creator: "iamjackrider",
    ),
    RecentCard(
      image: "assets/images/asset2.png",
      name: "The Unknow",
      eth: "3.25",
      creator: "iamjackrider",
    ),
    RecentCard(
      image: "assets/images/asset3.png",
      name: "The Unknow",
      eth: "5.00",
      creator: "iamjackrider",
    ),
    RecentCard(
      image: "assets/images/asset4.png",
      name: "The Unknow",
      eth: "6.25",
      creator: "iamjackrider",
    ),
    RecentCard(
      image: "assets/images/asset5.png",
      name: "The Unknow",
      eth: "4.90",
      creator: "iamjackrider",
    ),
    RecentCard(
      image: "assets/images/asset1.png",
      name: "The Unknow",
      eth: "3.00",
      creator: "iamjackrider",
    ),
  ];
}
