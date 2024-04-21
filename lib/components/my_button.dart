import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final Function()? onTap;
  final String text;

  const MyButton({super.key, required this.onTap, required this.text});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {

  var _isLoading = false;

  void _onSubmit() {
    setState(() => _isLoading = true);

    Future.delayed(
      const Duration(seconds: 1),
          () => setState(() {
            widget.onTap?.call();
            _isLoading = false;
          }),

    );

  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _isLoading ? null : _onSubmit,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: _isLoading ? Container(height: 20,width: 20,child: const CircularProgressIndicator()) : Text(widget.text,style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.inversePrimary,
            fontSize: 16,
          ),),
        ),
      ),
    );
  }
}
