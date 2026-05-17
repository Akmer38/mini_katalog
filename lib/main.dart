import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'theme/app_theme.dart';
import 'screens/home_screen.dart';

//flutter --version
//Flutter 3.32.8 • channel stable • https://github.com/flutter/flutter.git
//Framework • revision edada7c56e (10 months ago) • 2025-07-25 14:08:03 +0000
//Engine • revision ef0cd00091 (10 months ago) • 2025-07-24 12:23:50 -0700
//Tools • Dart 3.8.1 • DevTools 2.45.1

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MiniKatalogApp());
}

class MiniKatalogApp extends StatelessWidget {
  const MiniKatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Katalog',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
