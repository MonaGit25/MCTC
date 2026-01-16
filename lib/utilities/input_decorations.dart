import 'package:flutter/material.dart';

InputDecoration appInputDecoration(String label) {
  return InputDecoration(
    hintText: label,
    filled: true,
    fillColor: const Color(0xF2F3F6FF),
    labelStyle: const TextStyle(color: Color(0xFF939393)),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0xF2E1E1E1)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Color(0xF2E1E1E1), width: 1),
    ),
  );
}