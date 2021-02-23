import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  bool _isSignedIn;

  GoogleSignInService() {
    _isSignedIn = false;
  }

  bool get isSignedIn => _isSignedIn;

  set isSignedIn(bool isSigningIn) {
    _isSignedIn = isSigningIn;
    notifyListeners();
  }

  Future signIn() async {
    isSignedIn = true;
    final user = await googleSignIn.signIn();

    if (user == null) {
      isSignedIn = false;
      return;
    } else {
      final googleAuth = await user.authentication;

      final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

      await FirebaseAuth.instance.signInWithCredential(credential);

      isSignedIn = false;
    }
  }

  void signOut() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
