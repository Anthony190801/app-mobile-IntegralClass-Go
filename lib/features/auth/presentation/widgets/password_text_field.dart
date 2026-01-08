/// Campo de texto para contraseña
/// 
/// Widget reutilizable para entrada de contraseña con opción de mostrar/ocultar

import 'package:flutter/material.dart';
import '../../../../core/utils/validators.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? label;
  final String? hint;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  
  const PasswordTextField({
    super.key,
    required this.controller,
    this.label,
    this.hint,
    this.validator,
    this.onChanged,
  });
  
  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.visiblePassword,
      validator: widget.validator ?? Validators.validatePassword,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelText: widget.label ?? 'Contraseña',
        hintText: widget.hint ?? 'Ingresa tu contraseña',
        prefixIcon: const Icon(Icons.lock_outlined),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
    );
  }
}

