import 'package:flutter/material.dart';
import 'package:trust_block/responsive/dimensions.dart';
import 'package:trust_block/responsive/mobileScreenLayout.dart';
import 'package:trust_block/responsive/responsive.dart';
import 'package:trust_block/responsive/webScreenLayout.dart';
import 'package:trust_block/screens/gpt_home_page.dart';
import 'package:trust_block/screens/homepage.dart';
import 'package:trust_block/screens/homepage2.dart';
import 'package:trust_block/screens/loginui.dart';
import 'package:trust_block/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Trust Block',
        theme: ThemeData.light()
            .copyWith(scaffoldBackgroundColor: mobileBackGroundColor),
        /*
        home: const ResponsiveLayout(
            webScreenLayout: WebScreenLayout(),
            mobileScreenLayout: MobileScreenLayout()));
            */
        home: HomePage2());
  }
}
