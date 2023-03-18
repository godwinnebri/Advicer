import 'package:adviser_app/2_application/core/services/theme_service.dart';
import 'package:adviser_app/2_application/core/theme/theme.dart';
import 'package:adviser_app/2_application/pages/advice/adviice_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: ((context) => ThemeService()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return MaterialApp(
        title: 'Flutter Demo',
        themeMode: themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: AdvicePage(),
      );
    });
  }
}