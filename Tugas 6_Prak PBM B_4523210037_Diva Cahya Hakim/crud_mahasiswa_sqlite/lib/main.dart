import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

theme: ThemeData(
  scaffoldBackgroundColor: const Color(0xffFFF6FB),

  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xffF8AFCB),
    elevation: 0,
    centerTitle: true,
    foregroundColor: Colors.white,
  ),

  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(
    backgroundColor: Color(0xffF8AFCB),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,

    contentPadding: const EdgeInsets.symmetric(
      vertical: 18,
      horizontal: 18,
    ),

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide.none,
    ),

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide.none,
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(
        color: Color(0xffF8AFCB),
        width: 2,
      ),
    ),
  ),
),
      home: const HomePage(),
    );
  }
}