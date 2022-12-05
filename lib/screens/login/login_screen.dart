
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/server/api_calls.dart';
import 'package:flutter_app/helper/toast.dart';

import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import '../../styles/app_theme.dart';
import '../../../main.dart';
import '../homescreens/HomeScreen.dart';
import '../../styles/app_images.dart';
import '../../styles/colors.dart';
import '../../helper/constants.dart';
import '../../models/loginResponseModel.dart';


class SignInOne extends StatefulWidget {
  SignInOne({Key? key}) : super(key: key);

  @override
  State<SignInOne> createState() => _SignInOneState();
}

class _SignInOneState extends State<SignInOne> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  bool isKeepMeSelected = true;

  @override
  Widget build(BuildContext context) {
    // HomeProvider productProvider = Provider.of<HomeProvider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Container(
              color: Colors.white.withOpacity(0.92),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      //logo section
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      Container(
                        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.4, maxHeight: MediaQuery.of(context).size.width * 0.4),
                        child: Image.asset(
                          AppImages.loginlogo,
                          color: primaryColor,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Container(
                      child: Text("Checkmate Store",style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold,fontSize: 22),),
                      ),
                      // logo(size.height / 8, size.height / 8),
                      SizedBox(
                        height: size.height * 0.03,
                      ),

                      //email & password section
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                            height: size.height * 0.35,
                            decoration: BoxDecoration(
                              color: background,
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(24.0)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.6),
                                  blurRadius: 8,
                                  offset: const Offset(4, 4),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  emailTextField(size),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  passwordTextField(size),

                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      // if(_emailController.text.trim().isNotEmpty){
                                      //   if (_validateUserData(true)){
                                      //
                                      //     RegExp regExpEmail = RegExp(kRegExpEmail);
                                      //
                                      //     if(regExpEmail.hasMatch(_emailController.text.trim())){
                                      //
                                      //
                                      //       Utils.show("Please verify your account");
                                      //       // Navigator.push(
                                      //       //     context,
                                      //       //     MaterialPageRoute(
                                      //       //         builder: (context) => OPTVerification(
                                      //       //           isoCode: isoCode,
                                      //       //           mobileNumber: _phoneController.text.trim(),
                                      //       //           userName: _nameController.text.trim(),
                                      //       //           userPassword: _passwordController.text.trim(),
                                      //       //         )));
                                      //
                                      //       // Navigator.push(
                                      //       //     context, MaterialPageRoute(builder: (context) => CreateNewPassword(_emailController.text.trim(), "email")));
                                      //     }else{
                                      //
                                      //       Utils.show("Please verify your account");
                                      //       Navigator.push(
                                      //           context, MaterialPageRoute(builder: (context) => OPTVerification()));
                                      //
                                      //       // Navigator.push(
                                      //       //     context, MaterialPageRoute(builder: (context) => CreateNewPassword(_emailController.text.trim(), "phone")));
                                      //     }
                                      //
                                      //   }
                                      // }else{
                                      //   Utils.show("Please enter email/phone");
                                      // }

                                      // Navigator.push(
                                      //     context, MaterialPageRoute(builder: (context) => GetEmailOrPassword()));
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        SizedBox(width: 8,),
                                        Text(
                                          "Forgot Password",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 12.0,color: primaryColor),
                                        ),
                                      ],
                                    ),
                                  ),


                                  // SizedBox(
                                  //   height: size.height * 0.03,
                                  // ),
                                  //
                                ],
                              ),
                            )),
                      ),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      //sign in button & sign in with text
                      // isLoading?CircularProgressIndicator():
                      signInButton(size, context),
                      SizedBox(
                        height: size.height * 0.04,
                      ),
                      Center(
                        child: GestureDetector(
                            onTap: (){

                              // Navigator.push(
                              //     context, MaterialPageRoute(builder: (context) => SignUpNewScreen()));
                            },
                            child: footerText()),
                      ),
                      Spacer(),
                      // SizedBox(
                      //   height: size.height * 0.1,
                      // ),
                      // SizedBox(
                      //   height: size.height * 0.02,
                      // ),
                      // signInWithText(),
                      // SizedBox(
                      //   height: size.height * 0.02,
                      // ),

                      //sign in with google & apple
                      // signInGoogleButton(size),
                      // SignInOneSocialButton(
                      //   iconPath: 'assets/apple_logo.svg',
                      //   text: 'Sign in with Apple',
                      //   size: size,
                      // ),
                      // SizedBox(
                      //   height: size.height * 0.02,
                      // ),
                      // SignInOneSocialButton(
                      //   iconPath: 'assets/google_logo.svg',
                      //   text: 'Sign in with Google',
                      //   size: size,
                      // ),
                      // signInAppleButton(size),
                      // SizedBox(
                      //   height: size.height * 0.03,
                      // ),
// Spacer(),
                      //sign up text here
                      // Center(
                      //   child: footerText(),
                      // )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget logo(double height_, double width_) {
  Widget richText(double fontSize) {
    return Text.rich(
      TextSpan(
        // style: GoogleFonts.inter(
        //   fontSize: fontSize,
        //   color: const Color(0xFF21899C),
        //   letterSpacing: 3,
        //   height: 1.03,
        // ),
        children:  [
          TextSpan(
            text: 'Clear',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          TextSpan(
            text: 'Spirit',
            style: TextStyle(
              fontSize: 20,
              color: primaryColor,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget emailTextField(Size size) {
    return Container(
      alignment: Alignment.center,
      height: size.height / 11,
      // padding: const EdgeInsets.symmetric(horizontal: 40),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(80.0),
      //   color: AppTheme.primaryColor.withOpacity(0.1),
      //   border: Border.all(
      //     width: 1.0,
      //     color: AppTheme.primaryColor.withOpacity(0.2),
      //   ),
      // ),
      child: TextField(
        // style: GoogleFonts.inter(
        //   fontSize: 16.0,
        //   color: const Color(0xFF15224F),
        // ),
        controller: _emailController,
        scrollPadding: EdgeInsets.only(
            bottom: 1000000),
        keyboardType: TextInputType.emailAddress,

        maxLines: 1,
        cursorColor: primaryColor,
        decoration: InputDecoration(
            labelText: 'Email',
            prefixIcon: Icon(Icons.person, color: primaryColor,),
            labelStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              letterSpacing: 0.2,
              color: spacer,
            ),
            border: UnderlineInputBorder()),
      ),
    );
  }
  bool isSelected = false;
  Widget passwordTextField(Size size) {
    return Container(
      alignment: Alignment.center,
      height: size.height / 11,
      // padding: const EdgeInsets.symmetric(horizontal: 40),
      // decoration: BoxDecoration(
      //   // borderRadius: BorderRadius.circular(80.0),
      //   // color: AppTheme.primaryColor.withOpacity(0.1),
      //   border: Border.all(
      //     width: 1.0,
      //     color: AppTheme.primaryColor.withOpacity(0.2),
      //   ),
      // ),
      child: TextField(
        // style: GoogleFonts.inter(
        //   fontSize: 16.0,
        //   color: const Color(0xFF15224F),
        // ),

        controller: _passwordController,
        maxLines: 1,
        obscureText: !isSelected?true:false,
        keyboardType: TextInputType.visiblePassword,
        cursorColor: primaryColor,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock_rounded, color: primaryColor,),
            suffixIcon: GestureDetector(
                onTap: (){
                  isSelected = !isSelected;
                  setState(() {

                  });
                },
                child: Icon(isSelected?CupertinoIcons.eye_slash:CupertinoIcons.eye, color: primaryColor,)),
            // suffixIconColor: AppTheme.primaryColor,

            labelStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              letterSpacing: 0.2,
              color: spacer,
            ),
            labelText: 'Password',
            // filled: true,
            // labelStyle: GoogleFonts.inter(
            //   fontSize: 12.0,
            //   color: const Color(0xFF969AA8),
            // ),
            border: UnderlineInputBorder()),
      ),
    );
  }



  Widget signInButton(Size size, BuildContext context) {
    return GestureDetector(
      onTap: () async{

        if (_validateUserData(false)){
          var pref = await SharedPreferences.getInstance();
          String? _ = await pref.getString("access_token");
          print("jkasjkkasjk ");

        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => HomeScreen()));
          _login(context,email: _emailController.text.trim(),password: _passwordController.text.trim(), );



        }
      },
      child: Container(
        alignment: Alignment.center,
        height: 60,
        width: size.width / 1.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.0),
          gradient: LinearGradient(
            colors: <Color>[primaryColor, primaryColor1],
          ),
          boxShadow: [
            BoxShadow(
              color: primaryColor.withOpacity(0.2),
              offset: const Offset(0, 14.0),
              blurRadius: 15.0,
            ),
          ],
        ),
        child: Text(
          'LOGIN',

          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget signInWithText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(child: Divider()),
        const SizedBox(
          width: 16,
        ),
        Text(
          'Or Sign in with',

          textAlign: TextAlign.center,
        ),
        const SizedBox(
          width: 16,
        ),
        const Expanded(child: Divider()),
      ],
    );
  }

  //sign up text here
  Widget footerText() {
    return Text.rich(
      TextSpan(
        // style: GoogleFonts.inter(
        //   fontSize: 12.0,
        //   color: const Color(0xFF3B4C68),
        // ),
        children:  [
          TextSpan(
            text: 'Don’t have an account ?',
            style: TextStyle(
              color: deactivatedText,
            ),
          ),
          TextSpan(
            text: ' ',
          ),
          TextSpan(
            text: 'Sign up',
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  bool _validateUserData(bool isForgot) {
    RegExp regExpEmail = RegExp(kRegExpEmail);
    RegExp regExpPhone = RegExp(kRegExpPhone);

    if (_emailController.text.trim().isEmpty || _passwordController.text.trim().isEmpty && !isForgot) {
      Utils.show("please enter both email and password");
      return false;
    } else if (!regExpEmail.hasMatch(_emailController.text.trim()) && !regExpPhone.hasMatch(_emailController.text.trim())) {
      Utils.show('please enter valid email/phone');
      return false;
    } else {
      return true;
    }
  }


  void _login(BuildContext context, {String email = '', String password = ''}) async {
    setState(() {
      isLoading = true;
    });
    try {
      await FirebaseMessaging.instance.getToken().then((String? deviceToken) async {
        print("jkasjkjkasjkas AAAA gyaaaa $deviceToken");





        if (deviceToken != null) {
          LoginSignupResponseModel? response = await NetworkHelper.on().userLogin(
              _emailController.text.trim(),_passwordController.text.trim(), deviceToken,
          );
          if (response != null&&
              response.data?.token != null) {
            var pref = await SharedPreferences.getInstance();
            await pref.setString("access_token", "${response.data?.token}");
            String? token = await pref.getString("access_token");
            print("tokennnn${token}");
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                    HomeScreen()), (Route<dynamic> route) => false);
                // HomeProvider homeProvider = Provider.of<HomeProvider>(context, listen: false);
                // homeProvider.loadCountries();
              }
               else{
            print("response is null");

            // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
            //           HomeScreen()), (Route<dynamic> route) => false);
                  // HomeProvider homeProvider = Provider.of<HomeProvider>(context, listen: false);
                  // homeProvider.loadCountries();
                }
              }



         else {
          Utils.show("Could not get Token");
        }
      });

      setState(() {
        isLoading = false;
      });
    }catch (e){

      setState(() {
        isLoading = false;
      });
      Utils.show(e.toString());
      print(e);
    }

    setState(() {
      isLoading = false;
    });
  }

}