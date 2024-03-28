import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const white = Colors.white;
const black = Colors.black;

class FeatureWidget extends StatelessWidget {
  const FeatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      children: [
        buildColumnListItems(1),
        buildColumnListItems(2),
      ],
    );
  }
}

buildListItem({
  required Color itemColor,
  required String itemName,
  required double itemPrice,
  required String itemImgPath,
}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(15.0, 15.0, 5.0, 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 100,
          height: 80,
          decoration: BoxDecoration(
            color: itemColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Image.asset(
              itemImgPath,
              width: 50,
            ),
          ),
        ),
        const SizedBox(
          width: 40,
        ),
        Column(
          children: [
            Text(itemName),
            Row(
              children: [
                Text(
                  '\$$itemPrice',
                  style: GoogleFonts.notoSans(
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

buildColumnListItems(int number) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (number == 1)
        buildListItem(
          itemName: 'Hamburger',
          itemColor: Colors.lightBlueAccent,
          itemPrice: 21,
          itemImgPath: 'assets/burger.png',
        ),
      if (number == 1)
        buildListItem(
          itemName: 'Cheese',
          itemColor: Colors.redAccent,
          itemPrice: 16,
          itemImgPath: 'assets/cheese.png',
        ),
      if (number == 2)
        buildListItem(
          itemName: 'Fries',
          itemColor: Colors.greenAccent,
          itemPrice: 10,
          itemImgPath: 'assets/fries.png',
        ),
      if (number == 2)
        buildListItem(
          itemName: 'Pizza',
          itemColor: Colors.yellowAccent,
          itemPrice: 21,
          itemImgPath: 'assets/pizza.png',
        )
    ],
  );
}
