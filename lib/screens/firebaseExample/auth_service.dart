import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// Future<String?> googleSignIn() async {
//   final GoogleSignIn googleSignIn = GoogleSignIn();
//   try {
//     final GoogleSignInAccount? googleSignInAccount =
//         await googleSignIn.signIn();
//     if (googleSignInAccount != null) {
//       final GoogleSignInAuthentication googleSignInAuthentication =
//           await googleSignInAccount.authentication;
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleSignInAuthentication.accessToken,
//         idToken: googleSignInAuthentication.idToken,
//       );
//       await FirebaseAuth.instance.signInWithCredential(credential);
//       return null;
//     } else {
//       return "User cancelled the login";
//     }
//   } on FirebaseAuthException catch (ex) {
//     return "${ex.code}: ${ex.message}";
//   } catch (ex) {
//     return ex.toString();
//   }
// }

Future<String?> mailRegister(String mail, String pwd) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: mail, password: pwd);
    return null;
  } on FirebaseAuthException catch (ex) {
    return "${ex.code}: ${ex.message}";
  }
}

Future<String?> signOut() async {
  try {
    await FirebaseAuth.instance.signOut();
    return null;
  } on FirebaseAuthException catch (ex) {
    return "${ex.code}: ${ex.message}";
  }
}

Future<String?> mailSignIn(String mail, String pwd) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: mail, password: pwd);
    return null;
  } on FirebaseAuthException catch (ex) {
    return "${ex.code}: ${ex.message}";
  }
}

// Future<String?> googleSignIn() async {
//   try {
//     await FirebaseAuth.instance.signInWithPopup(GoogleAuthProvider());
//     return null;
//   } on FirebaseAuthException catch (ex) {
//     return "${ex.code}: ${ex.message}";
//   } on UnimplementedError catch (ex) {
//     return ex.message;
//   }
// }
Future<UserCredential> googleSignIn() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}