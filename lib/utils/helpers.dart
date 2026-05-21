import 'dart:typed_data';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'constants.dart';

String encodeImageToBase64(Uint8List bytes) {
  return base64Encode(bytes);
}

void showAppSnackBar(BuildContext context, String message,
    {bool isError = false}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      backgroundColor: isError ? AppColors.error : AppColors.success,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(16),
    ),
  );
}
