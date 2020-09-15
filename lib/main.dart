import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_clone/presentation/screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter WhatsApp Clone',
      home: SplashScreen(),
    );
  }
}
