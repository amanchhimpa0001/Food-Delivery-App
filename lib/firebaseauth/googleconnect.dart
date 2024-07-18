// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// final FirebaseAuth _auth = FirebaseAuth.instance;

// final GoogleSignIn googleSignIn = GoogleSignIn();

// String name = "aman";
// String email= "aman@gmail.com";
// String imageurl="assets/images/cash.png";

// Future signInWithGoogle() async {
//    var googleSignInAccount =  googleSignIn.signIn();

//   var googleauth= GoogleSignInAuthentication googleSignInAuthentication =
//       await googleSignInAccount;

//   final AuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleSignInAuthentication.accessToken,
//       idToken: googleSignInAuthentication.idToken);

//   final  authResult = await _auth.signInWithCredential(credential);
//   final user = authResult.user;

//   assert(user!.email != null);
//   assert(user!.displayName != null);
//   assert(user!.photoURL != null);

//   name = user.displayName;
// }
