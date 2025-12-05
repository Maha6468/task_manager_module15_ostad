import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/asset_paths.dart';
import '../widgets/screen_background.dart';
import 'get_started_with_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(Duration(seconds: 15));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Get_Started_With()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:ScreenBackground(child: Center(
          child: SvgPicture.asset(AssetPaths.logoSVG,
            height: 50,
          ),
        )));
  }
}