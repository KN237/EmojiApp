import 'package:emoji/widgets/featured_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductPage extends StatefulWidget {
  final Color itemColor;
  final String itemName;
  final double itemPrice;
  final String itemImgPath;

  const ProductPage({
    super.key,
    required this.itemColor,
    required this.itemName,
    required this.itemPrice,
    required this.itemImgPath,
  });

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int quantity = 1;
  adjustQuantity(String exp) {
    if (exp == '-' && quantity != 0) {
      setState(() {
        quantity--;
      });
    } else {
      setState(() {
        quantity++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 60.0, 15.0, 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    'assets/menu-scale.svg',
                    width: 30,
                    height: 40,
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration:
                        BoxDecoration(shape: BoxShape.circle, boxShadow: [
                      BoxShadow(
                        color: Colors.redAccent.withOpacity(0.06),
                        offset: const Offset(10, 10),
                        blurRadius: 15,
                        spreadRadius: -5,
                      ),
                    ]),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                color: Colors.redAccent,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.shopping_cart,
                                color: white,
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                width: 15,
                                height: 15,
                                decoration: const BoxDecoration(
                                  color: white,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    '1',
                                    style: GoogleFonts.notoSans(
                                        fontSize: 10, color: Colors.redAccent),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SUPER',
                    style: GoogleFonts.notoSans(
                        fontSize: 30, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    widget.itemName,
                    style: GoogleFonts.notoSans(
                        fontSize: 30, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Hero(
                    tag: widget.itemName,
                    child: Image.asset(widget.itemImgPath),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration:
                            BoxDecoration(shape: BoxShape.circle, boxShadow: [
                          BoxShadow(
                            color: black.withOpacity(0.06),
                            offset: const Offset(10, 10),
                            blurRadius: 15,
                            spreadRadius: -5,
                          ),
                        ]),
                        child: Column(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                color: white,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.favorite_outline,
                                color: Colors.redAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration:
                            BoxDecoration(shape: BoxShape.circle, boxShadow: [
                          BoxShadow(
                            color: black.withOpacity(0.06),
                            offset: const Offset(10, 10),
                            blurRadius: 15,
                            spreadRadius: -5,
                          ),
                        ]),
                        child: Column(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                color: white,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.restore,
                                color: Colors.redAccent,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 3,
                    child: Center(
                        child: Text(
                      '\$${widget.itemPrice * quantity}',
                      style: GoogleFonts.notoSans(fontSize: 30),
                    )),
                  ),
                  Expanded(
                    child: Container(
                      height: 70,
                      decoration: const BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 4,
                            height: 40,
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(05)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    adjustQuantity('-');
                                    print(quantity);
                                  },
                                  child: Text(
                                    '-',
                                    style: GoogleFonts.notoSans(
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                                const SizedBox(),
                                Text(
                                  '$quantity',
                                  style: GoogleFonts.notoSans(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                const SizedBox(),
                                InkWell(
                                  onTap: () {
                                    adjustQuantity('+');
                                    print(quantity);
                                  },
                                  child: Text(
                                    '+',
                                    style: GoogleFonts.notoSans(
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'ADD TO CART',
                            style: GoogleFonts.notoSans(
                                color: white, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 20.0),
              child: Text(
                'FEATURED',
                style: GoogleFonts.notoSans(
                    fontSize: 17, fontWeight: FontWeight.w700, color: black),
              ),
            ),
            Container(
                height: 230, width: double.infinity, child: FeatureWidget()),
          ],
        ),
      ),
    );
  }
}
