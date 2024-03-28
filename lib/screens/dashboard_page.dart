import 'package:emoji/widgets/food_tab.dart';
import 'package:emoji/widgets/recommended_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

const white = Colors.white;
const black = Colors.black;

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
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
                        color: const Color(0xFF000000).withOpacity(0.06),
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
                          decoration: BoxDecoration(
                              color: Colors.lightBlueAccent.withOpacity(0.3),
                              shape: BoxShape.circle,
                              image: const DecorationImage(
                                  image: AssetImage('assets/tuxedo.png'),
                                  fit: BoxFit.cover)),
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
                    'SEARCH FOR',
                    style: GoogleFonts.notoSans(
                        fontSize: 30, fontWeight: FontWeight.w800),
                  ),
                  Text(
                    'RECIPES',
                    style: GoogleFonts.notoSans(
                        fontSize: 30, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  cursorColor: black,
                  decoration: InputDecoration(
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Icon(Icons.search),
                    ),
                    hintText: 'Search',
                    hintStyle: GoogleFonts.notoSans(fontSize: 16),
                    border: InputBorder.none,
                    contentPadding:
                        const EdgeInsets.only(left: 15.0, top: 20.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Recommended",
                style: GoogleFonts.notoSans(
                    fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 0, 15),
              child: SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      RecommendedItem(
                        itemName: 'Hamburger',
                        itemColor: Colors.lightBlueAccent,
                        itemPrice: 21,
                        itemImgPath: 'assets/burger.png',
                      ),
                      RecommendedItem(
                        itemName: 'Cheese',
                        itemColor: Colors.redAccent,
                        itemPrice: 16,
                        itemImgPath: 'assets/cheese.png',
                      ),
                      RecommendedItem(
                        itemName: 'Fries',
                        itemColor: Colors.greenAccent,
                        itemPrice: 10,
                        itemImgPath: 'assets/fries.png',
                      ),
                      RecommendedItem(
                        itemName: 'Pizza',
                        itemColor: Colors.yellowAccent,
                        itemPrice: 21,
                        itemImgPath: 'assets/pizza.png',
                      )
                    ],
                  )),
            ),
            TabBar(
                controller: tabController,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                dividerColor: Colors.transparent,
                indicatorColor: Colors.transparent,
                labelPadding: const EdgeInsets.only(left: 15.0),
                labelStyle: GoogleFonts.notoSans(
                    fontSize: 17, fontWeight: FontWeight.w700, color: black),
                unselectedLabelColor: black.withOpacity(0.5),
                overlayColor: MaterialStateProperty.resolveWith(
                    (states) => Colors.transparent),
                tabs: const [
                  Tab(
                    child: Text('FEATURED'),
                  ),
                  Tab(
                    child: Text('COMBOS'),
                  ),
                  Tab(
                    child: Text('FAVORITES'),
                  ),
                  Tab(
                    child: Text('RECOMMENDED'),
                  ),
                ]),
            SizedBox(
                width: double.infinity,
                height: 200,
                child: TabBarView(
                  controller: tabController,
                  children: const [FoodTab(), FoodTab(), FoodTab(), FoodTab()],
                )),
          ],
        ),
      ),
    );
  }
}
