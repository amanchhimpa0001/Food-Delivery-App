import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:food_delivery_new_project/Utils/routs/routs.dart';
import 'package:food_delivery_new_project/Utils/routs/routs_name.dart';
import 'package:food_delivery_new_project/authentication/login.dart';
import 'package:food_delivery_new_project/componants/navbar.dart';
import 'package:food_delivery_new_project/controllers/authcontrollers.dart';
import 'package:food_delivery_new_project/firebase_options.dart';

import 'package:food_delivery_new_project/helpers/app_config.dart';
import 'package:food_delivery_new_project/helpers/app_services.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;
Future<void> main(context) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

// ignore: unused_element
_init(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = prefs.getString("userID");
  if (token != null) {
    print('Token: $token');
    Appservices.pushto(context, Navbar());
  } else {
    Appservices.pushto(context, Login_Page());
  }
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key}) {
    final user = prefs.getString('user') ?? '';
    isLogin = user.isNotEmpty;
  }

  bool isLogin = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthController(),
        )
      ],
      child: ScreenUtilInit(
        child: MaterialApp(
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          // home: AnimatedSizeExample(),
          initialRoute: isLogin ? Routsname.Navbar : Routsname.Sliders_page,
          onGenerateRoute: Routes.generateRoutes,
          debugShowCheckedModeBanner: false,
        ),
        designSize: const Size(AppConfig.screenWidth, AppConfig.screenHeight),
      ),
    );
  }
}
