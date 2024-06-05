import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_textfield.dart';
import 'package:food_delivery_app/services/auth/auth_service.dart';
import 'package:food_delivery_app/services/database/firestore.dart';
import 'package:gap/gap.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  FirestoreService database = FirestoreService();

  
  //text editing controllers
  final TextEditingController nameController = TextEditingController();

  final TextEditingController mobileController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController = TextEditingController();

  // register method
  void register() async {
    //get auth service
    final _authService = AuthService();

    // check is passwords match -> create user
    if (passwordController.text == confirmPasswordController.text) {
      //try creating user
      try {
        await _authService.signUpWithEmailPassword(
            emailController.text, passwordController.text);
      }

      //display any errors
      catch (e) {
        String message = e.toString().replaceFirst("Exception: ", "");
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(message),
          ),
        );
      }
    }

    //check is passwords don't match -> show error
    else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Passwords don't match!"),
        ),
      );
    }
  }

  bool checkMobile(String mobile){
    if(mobile.length != 10){
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("invalid-mobile-number"),
        ),
      );
      return false;
    }

    for(int i = 0; i < 10; i++){
      if(mobile[i].contains('0') || mobile[i].contains('1') || mobile[i].contains('2') || mobile[i].contains('3') || mobile[i].contains('4') || mobile[i].contains('5') || mobile[i].contains('6') || mobile[i].contains('7') || mobile[i].contains('8') || mobile[i].contains('9')){
        continue;
      }
      else{
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("invalid-mobile-number"),
          ),
        );
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Gap(25),
              //logo
              Icon(
                Icons.lock_open_rounded,
                size: 80,
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

              //name textfield
              MyTextField(
                controller: nameController,
                hintText: "Name",
                obscureText: false,
              ),

              const Gap(25),

              //mobile textfield
              MyTextField(
                controller: mobileController,
                hintText: "Mobile",
                obscureText: false,
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
              MyButton(onTap: () {

                if( checkMobile(mobileController.text)) {
                  register();
                  database.saveCustomerInfo(
                      nameController.text, mobileController.text,
                      emailController.text);
                }
                }, text: "Sign Up"),
          
              const Gap(25),
          
              //already have an account? Login Here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "already have an account? ",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  const Gap(4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Login Now",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            const Gap(25),
            ],
          ),
        ),
      ),
    );
  }
}
