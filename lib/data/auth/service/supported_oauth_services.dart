enum SupportedOAuthServices { google }

extension SupportedOAuthServicesExtension on SupportedOAuthServices {
  String get name {
    switch (this) {
      case SupportedOAuthServices.google:
        return 'google';
    }
  }
}
