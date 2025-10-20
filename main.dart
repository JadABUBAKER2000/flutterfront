import 'package:flutter/material.dart';
import 'lang.dart';
import 'home_page.dart';
import 'sign_in_page.dart';
import 'sign_up_page.dart';

void main() {
  runApp(const UniBookApp());
}

class UniBookApp extends StatelessWidget {
  const UniBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isArabic,
      builder: (context, arabic, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'UniBook',
          theme: ThemeData(),
          home: Directionality(
            textDirection: arabic ? TextDirection.rtl : TextDirection.ltr,
            child: const HomePage(),
          ),
          routes: {
            '/signin': (context) => const SignInPage(),
            '/signup': (context) => const SignUpPage(),
            '/home': (context) => const HomePage(),
          },
        );
      },
    );
  }
}
