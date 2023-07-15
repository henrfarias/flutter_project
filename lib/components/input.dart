import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  final TextEditingController controller;
  final Function(String)? validator;
  final String hintText;
  final bool obscureText;
  final TextInputType keyBoardType;
  final bool? autoFocus;

  const Input(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      required this.keyBoardType,
      this.validator,
      this.autoFocus});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  String? errorText;

  void _validateInput(String value) {
    setState(() {
      errorText = widget.validator != null ? widget.validator!(value) : null;
    });
  }

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      _validateInput(widget.controller.text);
    });
  }

  @override
  void dispose() {
    widget.controller.removeListener(() {
      _validateInput(widget.controller.text);
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        autofocus: widget.autoFocus ?? false,
        controller: widget.controller,
        validator: (value) => errorText,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
          errorText: errorText,
        ),
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}
