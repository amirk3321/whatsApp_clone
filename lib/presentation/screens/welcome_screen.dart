import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_whatsapp_clone/presentation/screens/registration_screen.dart';
import 'package:flutter_whatsapp_clone/presentation/widgets/theme/style.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Welcome to WhatsApp Clone",
              style: TextStyle(
                fontSize: 20,
                color: primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: 290,
              width: 290,
              child: Image.asset("assets/brand.png"),
            ),
            Column(
              children: <Widget>[
                Text(
                  "Read our Privacy Policy Tap, 'Agree and continue' to accept the Terms of Service",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  color: greenColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => RegistrationScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "AGREE AND CONTINUE",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
