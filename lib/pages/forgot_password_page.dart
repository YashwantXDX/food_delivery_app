import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_textfield.dart';
import 'package:gap/gap.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final forgotPasswordController = TextEditingController();

  @override
  void dispose() {
    forgotPasswordController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: forgotPasswordController.text.trim());
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text("Password Reset link sent successfully. Check Email !!"),
        ),
      );
    } on FirebaseAuthException catch (e) {
      showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Enter your Email and we will send you a password reset link",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),
          const Gap(10),
          MyTextField(
            controller: forgotPasswordController,
            hintText: "Enter Email",
            obscureText: false,
          ),
          const Gap(10),
          MaterialButton(
            onPressed: passwordReset,
            child: Text(
              "Reset Password",
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ],
      ),
    );
  }
}
