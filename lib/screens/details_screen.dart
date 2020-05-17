import 'package:daily_exercise_ui/constant.dart';
import 'package:daily_exercise_ui/widgets/bottom_nav_bar.dart';
import 'package:daily_exercise_ui/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottonNavBar(),
      body: Stack(children: <Widget>[
        Container(
          height: size.height * .45,
          decoration: BoxDecoration(
            color: kBlueLightColor,
          ),
        ),
        Image.asset(
          'assets/images/undraw.png',
          height: 300.0,
          width: 300.0,
          alignment: Alignment.bottomLeft,
          color: Color(0xFF4056C6).withOpacity(.10),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(220, 80, 0, 0),
          child: Image.asset(
            'assets/images/meditation.png',
            height: 200,
            width: 200,
            fit: BoxFit.fitWidth,
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Text(
                    "Meditation",
                    style: Theme.of(context)
                        .textTheme
                        .display1
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                  Text(
                    "3-10 Min Course",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: size.width * .6, // it just take 60% of total width
                    child: Text(
                        "Live Happier and Be Happiest by learning the fundamentals of meditation."),
                  ),
                  SizedBox(
                    child: SearchBar(),
                    width: size.width * .45,
                  ),
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: <Widget>[
                      SessionCard(
                        sessionNum: 1,
                        isDone: true,
                        press: () {},
                      ),
                      SessionCard(
                        sessionNum: 2,
                        isDone: true,
                        press: () {},
                      ),
                      SessionCard(
                        sessionNum: 3,
                        isDone: true,
                        press: () {},
                      ),
                      SessionCard(
                        sessionNum: 4,
                        isDone: true,
                        press: () {},
                      ),
                      SessionCard(
                        sessionNum: 5,
                        isDone: true,
                        press: () {},
                      ),
                      SessionCard(
                        sessionNum: 6,
                        isDone: true,
                        press: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Meditation",
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 17),
                          blurRadius: 23,
                          spreadRadius: -13,
                          color: kShadowColor,
                        ),
                      ],
                    ),
                    child: Row(
                      children: <Widget>[
                         Image.asset(
                            'assets/images/meditation.png',
                            height: 100,
                            width: 100,
                            fit: BoxFit.fitWidth,
                          ),
                        
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Basic 2",
                                style: Theme.of(context).textTheme.subtitle,
                              ),
                              Text("Start your deepen you practice"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: SvgPicture.asset(
                            "assets/icons/lock.svg",
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class SessionCard extends StatelessWidget {
  final int sessionNum;
  final bool isDone;
  final Function press;
  const SessionCard({
    Key key,
    this.sessionNum,
    this.isDone = false,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 -
              10, // contraint.maxWidth provide us the available with for this widget
          // padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: kShadowColor,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 42,
                      width: 43,
                      decoration: BoxDecoration(
                        color: isDone ? kBlueColor : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: kBlueColor,
                        ),
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        color: isDone ? Colors.white : kBlueColor,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text("Session $sessionNum",
                        style: Theme.of(context).textTheme.subtitle)
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
