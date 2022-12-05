import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/styles/app_theme.dart';
import 'package:flutter_app/styles/colors.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart'as myProvider;

import 'controller/home_controller.dart';
import 'styles/app_images.dart';
import 'screens/login/introduction_animation_screen.dart';
bool isFirstTime = false;
bool checkUserData = false;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  var pref = await SharedPreferences.getInstance();
  if(pref.getBool("isFirstTime") != null){
    isFirstTime = pref.getBool("isFirstTime")!;
    if(pref.getString("access_token") != null || pref.getString("user") != null){
      String? _ = await pref.getString("access_token");
  print("jkasjkkasjk $_");
  checkUserData = true;
  }
  }
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(myProvider.MultiProvider(

      providers: [
        myProvider.ChangeNotifierProvider(create: (context) => HomeProvider()),
      ],
      child: MyApp())));
}
const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description: 'This channel is used for important notifications.', // description
  importance: Importance.high,
);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        title: 'Checkmate Store',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: AppTheme.textTheme,
        platform: TargetPlatform.iOS,
    ),
    home: AnimatedSplashScreen(
    duration: 2000,
    splash: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Image.asset(
        AppImages.splashImage2,
      fit: BoxFit.contain,
        color: primaryColor,
      ),
    ),
    splashIconSize: 100,
    nextScreen: IntroductionAnimationScreen(),
    splashTransition: SplashTransition.fadeTransition,
    // pageTransitionType: PageTransitionType.scale,
    // backgroundColor: Colors.blue
    ),
    // home: IntroductionAnimationScreen(),
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

}