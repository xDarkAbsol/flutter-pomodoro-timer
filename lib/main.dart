import 'package:flutter/material.dart';
import 'package:pomodoro/controller.dart';
import 'package:pomodoro/page/home_page.dart';
import 'package:pomodoro/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Controller controller = Controller();
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          home: HomePage(controller: controller),
        );
      },
    );
  }
}
