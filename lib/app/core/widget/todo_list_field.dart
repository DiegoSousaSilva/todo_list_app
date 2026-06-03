import 'package:flutter/material.dart';

class TodoListField extends StatelessWidget {
  final String label;
  final IconButton? sulfixIconButton;
  final bool obscureText;
  final ValueNotifier<bool> obscureTextVN;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  TodoListField({
    super.key,
    required this.label,
    this.obscureText = false,
    this.sulfixIconButton,
    this.controller,
    this.validator,
  }) : assert(
         obscureText == true ? sulfixIconButton == null : true,
         "O obscureText não pode ser enviado em conjunto com sulfixIconButton",
       ),
       obscureTextVN = ValueNotifier(obscureText);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: obscureTextVN,
      builder: (_, obscureTextValue, child) {
        return TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obscureTextValue,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(fontSize: 15, color: Colors.black),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.red),
            ),
            isDense: true,
            suffixIcon:
                sulfixIconButton ??
                (obscureText == true
                    ? IconButton(
                        onPressed: () {
                          obscureTextVN.value = !obscureTextValue;
                        },
                        icon: Icon(
                          !obscureTextValue
                              ? Icons.close_outlined
                              : Icons.remove_red_eye_outlined,
                        ),
                      )
                    : null),
          ),
        );
      },
    );
  }
}
