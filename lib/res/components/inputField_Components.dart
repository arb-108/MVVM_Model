import 'package:flutter/material.dart';

class InputTextField extends StatefulWidget {
  final String textHint;
  final IconData icon;
  final bool isPassword;
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function(String) onsubmitted;
  final TextInputType keyboardinput;

  const InputTextField({
    super.key,
    required this.textHint,
    required this.icon,
    required this.controller,
    this.isPassword = false,
    required this.focusNode,
    required this.onsubmitted,
    this.keyboardinput=TextInputType.text
  });

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      focusNode:widget.focusNode,
      keyboardType: widget.keyboardinput,
      onSubmitted: widget.onsubmitted,
      obscureText: widget.isPassword ? _obscureText : false,
      style: TextStyle(
        color: Theme.of(context).textTheme.bodyLarge?.color,
        decoration: TextDecoration.none,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(widget.icon),
        hintText: widget.textHint,
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        )
            : null,
      ),
    );
  }
}
