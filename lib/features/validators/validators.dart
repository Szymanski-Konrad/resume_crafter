import 'package:flutter/material.dart';
import 'package:resume_crafter/l10n/l10n.dart';

abstract class Validators {
  static ValidationResult validateEmail(String? email) {
    if (email == null || email.isEmpty) return ValidationResult.empty;
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final regex = RegExp(pattern);
    if (!regex.hasMatch(email)) {
      return ValidationResult.invalidEmail;
    }

    return ValidationResult.valid;
  }

  static ValidationResult validateNonEmpty(String? input) {
    if (input == null || input.isEmpty) return ValidationResult.empty;
    return ValidationResult.valid;
  }
}

enum ValidationResult {
  valid,
  invalidEmail,
  empty,
  emailIsAlreadyRegistered,
}

extension ValidationResultExtension on ValidationResult {
  String? validationResult(BuildContext context) {
    return switch (this) {
      ValidationResult.empty => context.l10n.appName,
      ValidationResult.invalidEmail => context.l10n.appName,
      ValidationResult.valid => null,
      ValidationResult.emailIsAlreadyRegistered => context.l10n.appName,
    };
  }
}
