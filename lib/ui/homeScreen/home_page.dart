import 'package:flutter/material.dart';
import 'package:nftapp/ui/homeScreen/home_detail_page.dart';
import 'package:nftapp/ui/homeScreen/home_provider.dart';
import 'package:provider/provider.dart';

import '../../components/notification_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TrendinCardModel>(
      create: (context) => TrendinCardModel(),
      child: const HomeBodyView(),
    );
  }
}

class HomeBodyView extends StatefulWidget {
  const HomeBodyView({Key? key}) : super(key: key);

  @override
  State<HomeBodyView> createState() => _HomeBodyViewState();
}

class _HomeBodyViewState extends State<HomeBodyView> {
  TrendinCardModel? trendingProvider;

  @override
  Widget build(BuildContext context) {
    trendingProvider = Provider.of<TrendinCardModel>(context);

    return Scaffold(
      body: Scaffold(
        //backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //AppBar
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 30,
                        width: 100,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/logo4x.png"))),
                      ),
                      SizedBox(
                          height: 25,
                          width: 25,
                          child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const NotificationPage()));
                              },
                              child: const Image(
                                  image: AssetImage("assets/images/noti.png"))))
                    ],
                  ),
                ),

                //Trending Text
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: const Text(
                    "Trending",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                //Trending Card
                Container(
                  height: 335,
                  padding: const EdgeInsets.all(0),
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: trendingProvider!.trendingcard.length,
                    itemBuilder: (context, index) => allCards(context, index),
                  ),
                ),

                //Top Seller Text
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: const Text(
                    "Top Seller",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                //Top Seller Card
                Container(
                  height: 125,
                  width: double.infinity,
                  padding: const EdgeInsets.all(0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) => Container(
                      height: 120,
                      width: 200,
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Stack(
                        children: [
                          Container(
                            height: 120,
                            width: 200,
                            margin: const EdgeInsets.symmetric(horizontal: 0),
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/topsub.png"))),
                          ),
                          Positioned(
                            right: 20,
                            top: 35,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  "iamjackrider",
                                  style: TextStyle(
                                    fontSize: 17,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 20,
                                  width:
                                      MediaQuery.of(context).size.width * 0.30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: const LinearGradient(
                                      begin: Alignment.centerLeft,
                                      colors: [
                                        Color(0xff320D6D),
                                        Color(0xff8A4CED)
                                      ],
                                    ),
                                  ),
                                  child: const Text(
                                    "ETH 22.05225",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 20,
                            child: Container(
                              height: 40,
                              width: 40,
                              margin: const EdgeInsets.symmetric(horizontal: 0),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black12, blurRadius: 5)
                                  ],
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "assets/images/pro1.png"))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                //Recent Text
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                  child: const Text(
                    "Recent",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                //Recent Card
                GridView.builder(
                  itemCount: trendingProvider!.recentCard.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 2),
                  itemBuilder: (context, index) => recentCards(index),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget recentCards(index) {
    return Container(
      alignment: Alignment.center,
      child: Stack(
        children: [
          Container(
            margin:
                const EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        trendingProvider!.recentCard[index].image!))),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                height: 55,
                width: MediaQuery.of(context).size.width * 0.48,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/recwhite.png"))),
                child: Container(
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 20,
                        width: MediaQuery.of(context).size.width * 0.18,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            colors: [Color(0xff320D6D), Color(0xff8A4CED)],
                          ),
                        ),
                        child: Text(
                          trendingProvider!.recentCard[index].eth!,
                          style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            trendingProvider!.recentCard[index].name!,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 12),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 20,
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey[100],
                            ),
                            child: Text(
                              trendingProvider!.recentCard[index].creator!,
                              style: const TextStyle(
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }

  Widget allCards(context, int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DetailPage(data: trendingProvider!.trendingcard[index])));
      },
      child: Container(
        height: 330,
        width: 260,
        padding: const EdgeInsets.symmetric(vertical: 7),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                padding: const EdgeInsets.all(0),
                height: 266,
                width: 203,
                child: Image.asset(
                  trendingProvider!.trendingcard[index].image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 140,
                width: 210,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffF1F1F1), width: 8),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        spreadRadius: 1,
                        offset: Offset(4, 4)),
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      child: Row(
                        children: [
                          Text(
                            trendingProvider!.trendingcard[index].name!,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                          const Spacer(),
                          Container(
                            alignment: Alignment.center,
                            height: 20,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                colors: [Color(0xff320D6D), Color(0xff8A4CED)],
                              ),
                            ),
                            child: Text(
                              trendingProvider!.trendingcard[index].eth!,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Creator",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 20,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey[100],
                                ),
                                child: Text(
                                  trendingProvider!
                                      .trendingcard[index].creator!,
                                  style: const TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Owner",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: 20,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey[100],
                                ),
                                child: Text(
                                  trendingProvider!.trendingcard[index].owner!,
                                  style: const TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 27,
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                colors: [Color(0xff1BEDFF), Color(0xff14BDEB)],
                              ),
                            ),
                            child: const Text(
                              "Place Bid",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/fav.png"))),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
