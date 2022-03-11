import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/notification_page.dart';
import '../homeScreen/home_provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TrendinCardModel>(
      create: (context) => TrendinCardModel(),
      child: const SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TrendinCardModel? trendingProvider;
  @override
  Widget build(BuildContext context) {
    trendingProvider = Provider.of<TrendinCardModel>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //AppBar
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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

              //Searchbar
              Container(
                height: 50,
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          offset: const Offset(0, 8),
                          blurRadius: 5,
                          spreadRadius: 1),
                    ]),
                child: TextFormField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search Here",
                      border: InputBorder.none),
                ),
              ),

              //Text
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  height: 30,
                  width: double.infinity,
                  child: const Text(
                    "0 Result",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  )),
              const SizedBox(
                height: 100,
              ),

              // Divider
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
              ),

              //Text
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  height: 30,
                  width: double.infinity,
                  child: const Text(
                    "Recommended",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  )),

              //Recomended NFT
              GridView.builder(
                itemCount: trendingProvider!.recentCard.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1, mainAxisSpacing: 2),
                itemBuilder: (context, index) => recomendedCards(index),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget recomendedCards(index) {
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
}
