import '/data/api/auth_api.dart';
import '/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Splash extends StatefulWidget {
  static const String route = "/";
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool isAuthenticated = true;

  _checkAuthenticate() async {
    var status = await AuthApi.isSignedIn();

    if (status) {
      var isOK = await AuthApi.refreshToken();
      if (isOK) {
        if (mounted) {
          Navigator.pushNamedAndRemoveUntil(context, Home.route, (_) => false);
        }
      } else {
        setState(() => isAuthenticated = false);
      }
    } else {
      setState(() => isAuthenticated = false);
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkAuthenticate();
    });
    super.initState();
  }

  _signIn() async {
    GoogleSignInAccount? account = await AuthApi.signIn();
    if (account != null) {
      if (mounted) {
        Navigator.pushNamedAndRemoveUntil(context, Home.route, (_) => false);
      }
    } else {
      debugPrint("GoogleSignIn Failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isAuthenticated
            ? const CircularProgressIndicator()
            : OutlinedButton(
                onPressed: _signIn,
                child: const Text("Login With Google"),
              ),
      ),
    );
  }
}
