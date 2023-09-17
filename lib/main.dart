import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

final lightTheme = ThemeData(
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 24)
  )
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 24)
  )
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI widgets',
      theme: lightTheme.copyWith(
        platform: TargetPlatform.android,
        colorScheme: lightTheme.colorScheme.copyWith(
          primary: Colors.red,
          secondary: Colors.green
        )
      ),
      darkTheme:darkTheme,
      home: const MainPage(),
    );
  }
}

