import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const white = Colors.white;
const black = Colors.black;

class FeatureWidget extends StatefulWidget {
  FeatureWidget({super.key});

  @override
  State<FeatureWidget> createState() => _FeatureWidgetState();
}

class _FeatureWidgetState extends State<FeatureWidget> {
  final ScrollController scrollController = ScrollController();

  final List<Map<String, dynamic>> temp = [{}, {}, {}, {}, {}];

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int length = (temp.length / 2).round();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 1.3,
        height: MediaQuery.of(context).size.height / 3,
        child: Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              if (index < temp.length) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildListItem(
                      itemName: 'Cheese',
                      itemColor: Colors.redAccent,
                      itemPrice: 16,
                      itemImgPath: 'assets/cheese.png',
                    ),
                    buildListItem(
                      itemName: 'Hamburger',
                      itemColor: Colors.lightBlueAccent,
                      itemPrice: 21,
                      itemImgPath: 'assets/burger.png',
                    )
                  ],
                );
              }
            },
          ),
        ),
      ),
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
