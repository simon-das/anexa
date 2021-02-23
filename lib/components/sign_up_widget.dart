import 'package:anexa/components/rounded_corner_button.dart';
import 'package:anexa/services/google_sign_in_service.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: TypewriterAnimatedTextKit(
                speed: Duration(milliseconds: 500),
                text: ["Anexa"],
                textAlign: TextAlign.center,
                textStyle: TextStyle(
                  fontSize: 45,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            RoundedCornerButton(
              title: 'Sign in with Google',
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInService>(context, listen: false);
                provider.signIn();
              },
            ),
          ],
        ),
      ),
    );
  }
}
