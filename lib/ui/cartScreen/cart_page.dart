import 'package:flutter/material.dart';
import 'package:nftapp/ui/cartScreen/cart_provider.dart';
import 'package:provider/provider.dart';

import '../../components/notification_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartCardModel>(
      create: (context) => CartCardModel(),
      child: const CartBodyView(),
    );
  }
}

class CartBodyView extends StatefulWidget {
  const CartBodyView({Key? key}) : super(key: key);

  @override
  State<CartBodyView> createState() => _CartBodyViewState();
}

class _CartBodyViewState extends State<CartBodyView> {
  CartCardModel? cartCardProvider;

  @override
  Widget build(BuildContext context) {
    cartCardProvider = Provider.of<CartCardModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,

      //AppBar
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: const [
            Image(image: AssetImage("assets/images/logo.png")),
            SizedBox(
              width: 5,
            ),
            Text(
              "nftApp",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NotificationPage()));
            },
            child: Container(
              height: 23,
              width: 23,
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/noti2x.png"))),
            ),
          ),
          const SizedBox(
            width: 5,
          )
        ],
        bottom: const PreferredSize(
            child: Text(
              "Items",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            preferredSize: Size.fromHeight(20)),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: cartCardProvider!.cartCard.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 200,
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                cartCardProvider!.cartCard[index].image!)),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  Container(
                    height: 170,
                    width: MediaQuery.of(context).size.width * 0.49,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 5,
                              spreadRadius: 1,
                              color: Colors.black12,
                              offset: Offset(4, 4))
                        ],
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: const Text(
                            "The Unknow",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 7),
                          child: Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 20,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey[100],
                                ),
                                child: const Text(
                                  "iamjackrider",
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                alignment: Alignment.center,
                                height: 20,
                                width: 75,
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
                                  "ETH 2.25",
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          child: const Text(
                            "Top Bid is By You",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          child: const Text(
                            "Time Remaining",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                margin: const EdgeInsets.all(0),
                                height: 50,
                                width: 100,
                                child: const Image(
                                    image:
                                        AssetImage("assets/images/time.png"))),
                            Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                height: 30,
                                width: 30,
                                child: const Image(
                                    image:
                                        AssetImage("assets/images/delete.png")))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
