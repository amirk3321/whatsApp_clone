import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_clone/presentation/screens/splash_screen.dart';
import 'package:flutter_whatsapp_clone/presentation/widgets/theme/style.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter WhatsApp Clone',
      theme: ThemeData(
        primaryColor: primaryColor
      ),
      home: SplashScreen(),
    );
  }
}
