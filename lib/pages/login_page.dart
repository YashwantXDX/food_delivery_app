import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_textfield.dart';
import 'package:gap/gap.dart';

class LoginPage extends StatefulWidget {

  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

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
              "Food Delivery App",
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

            //sign in button
            MyButton(onTap: () {}, text: "Sign In"),

            const Gap(25),

            //not a member? register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member? ",style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),),
                const Gap(4),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text("Register Now",style: TextStyle(
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
