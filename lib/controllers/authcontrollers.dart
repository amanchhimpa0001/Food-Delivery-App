import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:food_delivery_new_project/authentication/Verify_phone_number.dart';

import 'package:food_delivery_new_project/authentication/login.dart';
import 'package:food_delivery_new_project/authentication/sign_upwith_phonum.dart';
import 'package:food_delivery_new_project/componants/navbar.dart';
import 'package:food_delivery_new_project/helpers/app_services.dart';
import 'package:food_delivery_new_project/home_screen/home_page.dart';

import 'package:food_delivery_new_project/main.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends ChangeNotifier {
  Map<String, dynamic> _user = {};
  Map<String, dynamic> get user => _user;

  setUser(Map<String, dynamic> data) {
    _user = data;
    notifyListeners();
  }

  // sign up text editing controllers
  TextEditingController phn_controllers = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final firestore = FirebaseFirestore.instance;
  // login text editing controllers
  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> createAccount(BuildContext context) async {
    final user = await _auth.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    firestore.collection('users').doc(user.user!.uid).set(
        {"email": emailController.text, "password": passwordController.text});
    // ignore: unnecessary_null_comparison
    if (user != null) {
      Appservices.pushto(context, signup_withphonenumber());
    } else {
      print('====================================');
    }
  }

  // getUser(String id) async {
  //   final snapshot = await firestore.collection('users').doc(id).get();
  //   setUser(snapshot.data() as Map<String, dynamic>);
  // }

  Future<void> loginUser(BuildContext context) async {
    final user = await _auth.signInWithEmailAndPassword(
        email: loginEmailController.text,
        password: loginPasswordController.text);
    // ignore: unnecessary_null_comparison
    if (user != null) {
      prefs.setString("userID", user.user!.uid);
      prefs.setString(
          "user",
          jsonEncode({
            'id': user.user!.uid,
            'email': user.user!.email,
          }));
      print(user.user!.uid);
      Appservices.pushto(context, Navbar());
    } else {
      print('error=======================================');
    }
  }

  // function for logout

  Future<void> logoutUser(BuildContext context) async {
    await _auth.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Appservices.pushto(context, Login_Page());
  }

  Future<void> otpsend(BuildContext context, String phone) async {
    print(phone);
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91${phone.trim()}",
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {
          Appservices.pushto(
              context, Verifyphonenumber(verificationId: verificationId));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } on FirebaseAuth catch (e) {
      print(e.toString());
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> googleLogin(BuildContext context) async {
    print("googleLogin method Called");
    GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      var reslut = await _googleSignIn.signIn();
      if (reslut == null) {
        return Appservices.pushto(context, Home_page());
      }

      final userData = await reslut.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: userData.accessToken, idToken: userData.idToken);
      var finalResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      print("Result $reslut");
      print(reslut.displayName);
      print(reslut.email);
      print(reslut.photoUrl);
    } catch (error) {
      print(error);
    }
  }
}
