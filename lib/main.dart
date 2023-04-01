import 'package:flutter/material.dart';
import 'package:shivang1333/pages/home_page.dart';
import 'package:shivang1333/pages/login.dart';
import 'package:shivang1333/utils/routes.dart';
import 'package:shivang1333/widgets/themes.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: true,
      initialRoute: MyRoutes.homeRoute ,
     routes: {
      "/":(context)=>const LoginPage(),
      MyRoutes.homeRoute:(context)=>const HomePage(),
      MyRoutes.LoginRoute:(context)=>const LoginPage()
     },
    );

  }
}

