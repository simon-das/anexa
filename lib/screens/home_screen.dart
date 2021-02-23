import 'package:anexa/components/build_loading.dart';
import 'package:anexa/components/sign_up_widget.dart';
import 'package:anexa/components/signed_in_widget.dart';
import 'package:anexa/services/google_sign_in_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GoogleSignInService>(context);
    final user = FirebaseAuth.instance.currentUser;
    if (provider.isSignedIn) {
      return buildLoading();
    } else if (user != null) {
      return SignedInWidget();
    } else {
      return SignUpWidget();
    }
  }
}
