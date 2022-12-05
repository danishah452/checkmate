// import 'package:clearspirit/design_course/home_design_course.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/home_controller.dart';
import '../homescreens/HomeScreen.dart';
import '../../styles/app_theme.dart';
import '../../styles/colors.dart';

import 'login_screen.dart';

class IntroductionAnimationScreen extends StatefulWidget {
  const IntroductionAnimationScreen({Key? key}) : super(key: key);

  @override
  _IntroductionAnimationScreenState createState() =>
      _IntroductionAnimationScreenState();
}

class _IntroductionAnimationScreenState
    extends State<IntroductionAnimationScreen> with TickerProviderStateMixin {
  AnimationController? _animationController;

  var pref;
  bool isFirstTime = false;


  @override
  void initState() {
    checkFirst();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  checkFirst() async{

    var prefs = await SharedPreferences.getInstance();
    String? _ = await prefs.getString("access_token");
    print("tokeennn $_");

    if (_!= null) {
      print("1234566 ");

      HomeProvider homeProvider =
      Provider.of<HomeProvider>(context, listen: false);

     await homeProvider.getorders();
      Navigator.pushReplacement(

          context,
          MaterialPageRoute(
              builder: (context) => const HomeScreen()));

      }else if(!isFirstTime){
      print("98754s ");

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignInOne()));
    }
  }
  @override
  Widget build(BuildContext context) {
    print(_animationController?.value);
    return Scaffold(
      backgroundColor: background,
      // body:
    );
  }

}
