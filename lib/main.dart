import 'package:cx_payment_app/dashboard_screen.dart';
import 'package:cx_payment_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bitcoin Wallet',
      theme: AppTheme.darkTheme,
      home: const DashboardScreen(),
    );
  }
}
