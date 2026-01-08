/// Campo de texto para email
/// 
/// Widget reutilizable para entrada de email con validación

import 'package:flutter/material.dart';
import '../../../../core/utils/validators.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final String? hint;
  final ValueChanged<String>? onChanged;
  
  const EmailTextField({
    super.key,
    required this.controller,
    this.label,
    this.hint,
    this.onChanged,
  });
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      autocorrect: false,
      validator: Validators.validateEmail,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label ?? 'Email',
        hintText: hint ?? 'tu@email.com',
        prefixIcon: const Icon(Icons.email_outlined),
      ),
    );
  }
}

