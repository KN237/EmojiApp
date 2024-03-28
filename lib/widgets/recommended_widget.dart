import 'package:emoji/screens/product_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const white = Colors.white;
const black = Colors.black;

class RecommendedItem extends StatelessWidget {
  final Color itemColor;
  final String itemName;
  final double itemPrice;
  final String itemImgPath;

  const RecommendedItem({
    super.key,
    required this.itemColor,
    required this.itemName,
    required this.itemPrice,
    required this.itemImgPath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(
              itemColor: itemColor,
              itemName: itemName,
              itemPrice: itemPrice,
              itemImgPath: itemImgPath,
            ),
          ),
        );
      },
      child: Container(
        width: 150,
        height: 70,
        margin: const EdgeInsets.only(right: 15.0),
        decoration: BoxDecoration(
            color: itemColor.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                color: white,
                shape: BoxShape.circle,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: itemName,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(itemImgPath), fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Text(
                  itemName,
                  style: GoogleFonts.notoSans(fontSize: 14, color: itemColor),
                ),
                Text(
                  '\$$itemPrice',
                  style: GoogleFonts.notoSans(fontSize: 14, color: itemColor),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
