import 'package:anexa/services/google_sign_in_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignOutWidget extends StatelessWidget {
  final user;

  SignOutWidget({this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Center(
            child: ClipOval(
              child: Material(
                child: Image.network(user.photoURL),
              ),
            ),
          ),
        ),
        Text(
          "Name: " + user.displayName,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          "Email: " + user.email,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Spacer(),
        Container(
          width: double.infinity,
          child: FlatButton(
            color: Colors.red,
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInService>(context, listen: false);
              provider.signOut();
              Navigator.pop(context);
            },
            child: Text("Log out"),
          ),
        )
      ],
    );
  }
}
