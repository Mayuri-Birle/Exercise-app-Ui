import 'package:daily_exercise_ui/constant.dart';
import 'package:daily_exercise_ui/screens/details_screen.dart';
import 'package:daily_exercise_ui/widgets/bottom_nav_bar.dart';
import 'package:daily_exercise_ui/widgets/category_card.dart';
import 'package:daily_exercise_ui/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and width of our device
    return Scaffold(
      bottomNavigationBar: BottonNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            //here the height of the container is 45% of our total height
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(0xfff5ceb8),
            ),
          ),
          Image.asset(
            'assets/images/undraw.png',
            height: 300.0,
            width: 300.0,
            alignment: Alignment.bottomLeft,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Color(0xfff2bea1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/list.svg',
                        height: 25.0,
                        width: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    'Good Morning \nCristen',
                    style: Theme.of(context)
                        .textTheme
                        .display1
                        .copyWith(fontWeight: FontWeight.w900),
                    textAlign: TextAlign.start,
                  ),
                  SearchBar(),
                  Expanded(
                      child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: .85,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children: <Widget>[
                      CategoryCard(
                        svgSrc: 'assets/images/diet.jpg',
                        title: 'Diet Recommendation',
                        press: () {},
                      ),
                      CategoryCard(
                        svgSrc: 'assets/images/3621760.jpg',
                        title: 'Exercise',
                        press: () {},
                      ),
                      CategoryCard(
                        svgSrc: 'assets/images/meditation.png',
                        title: 'Meditation',
                        press: () {Navigator.push(context, MaterialPageRoute(builder: (context){return DetailsScreen();}));},
                      ),
                      CategoryCard(
                        svgSrc: 'assets/images/yoga.png',
                        title: 'Yoga',
                        press: () {},
                      ),
                    ],
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

