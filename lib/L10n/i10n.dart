import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('fr'),
    const Locale('en'),
    const Locale('sw'),
  ];

  static String getFlag(String code) {
    switch (code) {
      case 'fr':
        return '🇫🇷 Français';
      case 'sw':
        return '🇨🇩 Swahili';
      case 'en':
        return '🇺🇸 Anglais';
      default:
        return '🇫🇷 Français';
    }
  }
}
