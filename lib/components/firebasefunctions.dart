import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:plant_pulse/utils/bottom_navabr.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

class FirebaseFunctions {
  //SignIn Function
  static Future<void> signUserInWithGoogle(BuildContext context) async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser == null) {
      return; // User cancelled the sign-in flow
    }
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    try {
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNav(),
          ),
        );
      } else {
        print('An unexpected error occurred during sign-in.');
      }
    } on FirebaseAuthException catch (e) {
      print('Error signing in with Google: ${e.code}');
    } catch (e) {
      print('An unexpected error occurred: ${e}');
    }
  }

  // read data from firebase
}
