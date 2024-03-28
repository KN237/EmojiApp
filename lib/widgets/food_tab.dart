import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

const white = Colors.white;
const black = Colors.black;

class FoodTab extends StatelessWidget {
  const FoodTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        buildListItem(
          itemName: 'Hamburger',
          oldItemPrice: 46,
          itemPrice: 21,
          itemImgPath: 'assets/burger.png',
        ),
        buildListItem(
          itemName: 'Cheese',
          oldItemPrice: 32,
          itemPrice: 16,
          itemImgPath: 'assets/cheese.png',
        ),
        buildListItem(
          itemName: 'Fries',
          oldItemPrice: 24,
          itemPrice: 10,
          itemImgPath: 'assets/fries.png',
        ),
        buildListItem(
          itemName: 'Pizza',
          oldItemPrice: 26,
          itemPrice: 21,
          itemImgPath: 'assets/pizza.png',
        )
      ],
    );
  }
}

buildListItem({
  required double oldItemPrice,
  required String itemName,
  required double itemPrice,
  required String itemImgPath,
}) {
  return Padding(
    padding:
        const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0, top: 0.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.redAccent.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Image.asset(
              itemImgPath,
              width: 50,
            ),
          ),
        ),
        Column(
          children: [
            Text(itemName),
            SmoothStarRating(
                allowHalfRating: true,
                onRatingChanged: (v) {},
                starCount: 5,
                rating: 4.5,
                size: 20.0,
                filledIconData: Icons.star,
                halfFilledIconData: Icons.star_half,
                color: Colors.yellow.withOpacity(0.6),
                borderColor: Colors.yellow.withOpacity(0.6),
                spacing: 0.0),
            Row(
              children: [
                Text(
                  '\$$itemPrice',
                  style: GoogleFonts.notoSans(
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
                const SizedBox(
                  width: 02,
                ),
                Text(
                  '\$$oldItemPrice',
                  style: GoogleFonts.notoSans(
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                ),
              ],
            ),
          ],
        ),
        FloatingActionButton(
          heroTag: '$itemName-float',
          onPressed: () {},
          backgroundColor: Colors.redAccent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: const Icon(
            Icons.add,
            color: white,
          ),
        )
      ],
    ),
  );
}
