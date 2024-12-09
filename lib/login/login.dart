import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ratingmoviesapp/services/auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;

  void toggleLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future<void> handleSignInAnonymously() async {
    toggleLoading();
    try {
      await AuthServices().signInAnonymously();
    } catch (e) {
      print(e);
    } finally {
      toggleLoading();
    }
  }

  Future<void> handleSignInWithGoogle() async {
    toggleLoading();
    try {
      await AuthServices().signInWithGoogle();
    } catch (e) {
      print(e);
    } finally {
      toggleLoading();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                     LoginButton(
                        color: Colors.deepPurple,
                        text: 'Sign in Anonymously',
                        loginMethod: handleSignInAnonymously,
                        icon: FontAwesomeIcons.userNinja,
                      ),
                    LoginButton(
                        color: Colors.blue,
                        text: 'Sign in with Google',
                        loginMethod: handleSignInWithGoogle,
                        icon: FontAwesomeIcons.google,
                      ),
              ],
            ),
          ),
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final Color color;
  final String text;
  final Function loginMethod;
  final IconData icon;

  const LoginButton({
    super.key,
    required this.color,
    required this.text,
    required this.loginMethod,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(
        icon,
        color: Colors.white,
        size: 24.0,
      ),
      label: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
      ),
      onPressed: () => loginMethod(),
    );
  }
}
