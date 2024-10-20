import 'package:flutter/foundation.dart';

import '/utils/global.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthApi {
  static final _googleSignIn = GoogleSignIn(
    scopes: ["https://www.googleapis.com/auth/blogger"],
  );

  static Future<bool> refreshToken() async {
    try {
      await _googleSignIn.signInSilently();
      var account = _googleSignIn.currentUser;
      if (account != null) {
        await AuthApi._generateToken(account);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint("Failed to refresh token: $e");
      return false;
    }
  }

  static Future<bool> isSignedIn() async => await _googleSignIn.isSignedIn();

  static Future<void> logout() async {
    await _googleSignIn.signOut();
    Global.oAuthToken = null;
  }

  static Future<GoogleSignInAccount?> signIn() async {
    await signOut();
    var account = await _googleSignIn.signIn();
    if (account != null) {
      await AuthApi._generateToken(account);
    }
    return account;
  }

  static Future<void> _generateToken(GoogleSignInAccount account) async {
    var auth = await account.authentication;
    Global.oAuthToken = auth.accessToken!;
  }

  static Future<void> signOut() async => await _googleSignIn.signOut();
}
