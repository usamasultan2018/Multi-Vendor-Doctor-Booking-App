import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mis_hospital/controller/app_provider.dart';
import 'package:mis_hospital/views/splash%20screen/splash_screen.dart';
import 'package:provider/provider.dart';

import 'constant/colors.dart';
import 'constant/styles.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppProvider()),
      ],
      child: GetMaterialApp(
        title: 'MIS hospital',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.transparent,
          appBarTheme: const AppBarTheme(
              elevation: 0,
              backgroundColor: Colors.transparent,
              iconTheme: IconThemeData(
                color: darkFontGrey,
              )
          ),
          fontFamily: regular,
        ),
        home:SplashScreen(),
      ),
    );
  }
}
