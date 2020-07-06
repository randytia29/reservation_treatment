import 'package:flutter/material.dart';
import 'package:reservationtreatment/ui/pages/pages.dart';
import 'package:reservationtreatment/ui/pages/slider_page.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentPage = 0;
  PageController _pageController = PageController();
  List<Widget> pages = [
    SliderPage(
      title: "Keep Save",
      description:
          "Accept cryptocurrencies and digital assets, keep them here, or send to others",
      image: "assets/1.svg",
    ),
    SliderPage(
      title: "Buy & Invest",
      description:
          "Buy Bitcoin and cryptocurrencies with VISA and MasterCard right in the App",
      image: "assets/2.svg",
    ),
    SliderPage(
      title: "Sell & Exchange",
      description:
          "Sell your Bitcoin cryptocurrencies or change with others digital assets or flat",
      image: "assets/3.svg",
    )
  ];

  onChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              itemCount: pages.length,
              onPageChanged: onChanged,
              itemBuilder: (context, index) {
                return pages[index];
              }),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(pages.length, (index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: 10,
                    width: (index == currentPage) ? 30 : 10,
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: (index == currentPage)
                            ? Colors.blue
                            : Colors.blue.withOpacity(0.5)),
                  );
                }),
              ),
              InkWell(
                  onTap: () async {
                    await _pageController.nextPage(
                        duration: Duration(milliseconds: 800),
                        curve: Curves.easeInOutQuint);
                  },
                  child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: 70,
                      alignment: Alignment.center,
                      width: (currentPage == (pages.length - 1)) ? 200 : 70,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(35)),
                      child: (currentPage == (pages.length - 1))
                          ? InkWell(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => Wrapper()));
                              },
                              child: Text(
                                "Get Started",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            )
                          : Icon(
                              Icons.navigate_next,
                              color: Colors.white,
                              size: 50,
                            ))),
              SizedBox(
                height: 50,
              )
            ],
          )
        ],
      ),
    );
  }
}
