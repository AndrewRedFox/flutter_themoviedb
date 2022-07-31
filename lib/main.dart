import 'package:flutter/material.dart';
import 'package:flutter_themoviedb/widgets/auth/auth_widget.dart';
import 'package:flutter_themoviedb/widgets/main_screen/main_screen_widger.dart';

import 'Theme/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.mainDartBlue
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.mainDartBlue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey
        ),
      ),
      routes: {//описываем страницы
        '/auth':(context) => AuthWidget(),
        '/main_screen' : (context) => MainScreenWidget(),
      },
      initialRoute: '/auth', //инициализируем главную страницу
    );
  }
}
