import 'package:flutter/cupertino.dart';

class TextFormField extends StatelessWidget {
  const TextFormField({super.key, required this.label, required this.icon, required this.isPassword});

  final String label;
  final Icon icon;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(label: label, icon: icon, isPassword: isPassword,);
  }
}
