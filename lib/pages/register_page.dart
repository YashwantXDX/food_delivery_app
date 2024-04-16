import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_textfield.dart';
import 'package:gap/gap.dart';

class RegisterPage extends StatefulWidget {

  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text editing controllers
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const Gap(25),

            //message, app slogan
            Text(
              "Create an Account",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            const Gap(25),

            //email textfield
            MyTextField(
              controller: emailController,
              hintText: "Email",
              obscureText: false,
            ),

            const Gap(25),

            // password textfield
            MyTextField(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
            ),

            const Gap(25),

            // confirm password textfield
            MyTextField(
              controller: confirmPasswordController,
              hintText: "Confirm Password",
              obscureText: false,
            ),

            const Gap(25),

            //sign up button
            MyButton(onTap: () {}, text: "Sign Up"),

            const Gap(25),

            //already have an account? Login Here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("already have an account? ",style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),),
                const Gap(4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text("Login Now",style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
