import 'package:flutter/material.dart';
import 'package:news/ui/home/deails_screen.dart';
import 'package:news/ui/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 22),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ))),
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color(0xFF39A552), primary: Color(0xFF39A552))),
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        NewsDetailsScreen.routeName: (_) => const NewsDetailsScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
