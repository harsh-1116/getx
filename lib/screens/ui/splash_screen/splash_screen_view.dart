import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/constant/image_assets.dart';
import '../auth/login_screen/login_screen_view.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}


class SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    Timer(
      const Duration(seconds: 2),()async{
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const LoginScreen()));
      }

    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(ImageAssets.splashImage2,
        fit: BoxFit.cover);
  }
}

