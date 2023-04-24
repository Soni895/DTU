import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login_backend/navigation.dart';

class auth extends StatelessWidget {
  const auth({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String useremail = "";
    return Scaffold(
      body: Center(
        child: Container(
          height: 50,
          width: 200,
          child: ElevatedButton(
              onPressed: () async {
                await signInWithGoogle();

                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Navigation()));
              },
              child: Text("Login with google")),
        ),
      ),
    );
  }

  // signInWithGoogle() async {
  //   GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //   GoogleSignInAuthentication? googleauth = await googleUser?.authentication;

  //   AuthCredential credential = GoogleAuthProvider.credential(
  //     accessToken: googleauth?.accessToken,
  //     idToken: googleauth?.idToken,
  //   );
  //   UserCredential? userCredential =
  //       await FirebaseAuth.instance.signInWithCredential(credential);
  //   print(userCredential.user?.displayName);
  // }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
