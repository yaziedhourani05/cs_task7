import 'dart:async';

import 'package:cs_task7/pages/home_page.dart';
import 'package:cs_task7/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({Key? key}) : super(key: key);

  final PageController _pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                //keep indcator left and skip button right
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    //padding for page indicator
                    padding: const EdgeInsets.only(left: 10),
                    child: SmoothPageIndicator(
                      effect: CustomizableEffect(
                        activeDotDecoration: DotDecoration(
                          width: 32,
                          height: 5,
                          color: Colors.orange,
                          rotationAngle: 360,
                          verticalOffset: -10,
                          borderRadius: BorderRadius.circular(24),
                          dotBorder: const DotBorder(
                            padding: 2,
                            width: 2,
                            color: Colors.orange,
                          ),
                        ),
                        dotDecoration: const DotDecoration(
                          width: 24,
                          height: 5,
                          color: Colors.grey,
                          dotBorder: DotBorder(
                            padding: 2,
                            width: 2,
                            color: Colors.grey,
                          ),
                          verticalOffset: 0,
                        ),
                        spacing: 6.0,
                        // activeColorOverride: (i) => colors[i],
                        // inActiveColorOverride: (i) => Colors[1],
                      ),
                      controller: _pageViewController,
                      count: 3,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // skip onboarding process and naviagates to home page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const HomePage();
                          },
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'skip',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Stack(
              children: [
                PageView(
                  // non scrollable physics prevents user from going back
                  // in steps
                  physics: const NeverScrollableScrollPhysics(),
                  // maintains active pages
                  controller: _pageViewController,
                  children: [
                    //first onboarding step
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //display image from assets folder
                            Image.asset(
                              'images/page_view1.png',
                              width: 400,
                              height: 400,
                            ),
                          ],
                        ),
                        const Text(
                          'From paper to digital',
                          style: TextStyle(fontSize: 25, color: Colors.orange),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Efficently move your exercises from paper to your mobile phone.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    //second onboarding step
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'images/page_view2.png',
                              width: 400,
                              height: 400,
                            ),
                          ],
                        ),
                        const Text(
                          'Easy to use user interface',
                          style: TextStyle(fontSize: 30, color: Colors.orange),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Use our user interface features to create, modify or delete your exercises.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    //third onboarding step
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'images/page_view3.png',
                              width: 400,
                              height: 400,
                            ),
                          ],
                        ),
                        const Text(
                          'Access your exercises on the go',
                          style: TextStyle(fontSize: 30, color: Colors.orange),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'You can acess your exercises from anywhere and at any time.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // Next button wrapped in column for positioning
                Column(
                  //moves it to the bottom
                  mainAxisAlignment: MainAxisAlignment.end,

                  children: [
                    Padding(
                      // adds margins
                      padding: const EdgeInsets.fromLTRB(70, 0, 70, 0),
                      child: Row(
                        //moves it to bottom center
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: CustomElevatedButton(
                              label: 'next',
                              onPressed: () {
                                // if it is not on the last step of onboarding
                                // display next step
                                //else
                                // display home page
                                if (_pageViewController.page != 2) {
                                  _pageViewController.nextPage(
                                    duration: const Duration(milliseconds: 250),
                                    curve: Curves.easeIn,
                                  );
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return const HomePage();
                                      },
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
