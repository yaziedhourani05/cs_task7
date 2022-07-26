import 'package:cs_task7/pages/onboarding_page.dart';
import 'package:flutter/material.dart';

// TODO: The splash screen i did is in the web/index.html folder because 
//i wanted the app to render before displaying it

//TODO: to show splash screen again press reload on chrome

//TODO: If it was hard coded i would have done it this way

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   State<SplashScreen> createState() => SplashScreenState();
// }

// class SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     Future.delayed(
//       const Duration(seconds: 3),
//       () {
//         return Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) {
//               return OnboardingPage();
//             },
//           ),
//         );
//       },
//     );

//     // TODO: implement initState
//     super.initState();
//   }

//   initialisation() {}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Image.asset(
//           'images/app_logo.png',
//           width: 400,
//           height: 400,
//         ),
//       ),
//     );
//   }
// }
