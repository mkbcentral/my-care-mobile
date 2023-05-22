import 'package:flutter/material.dart';
import 'package:my_care_mobile/L10n/i10n.dart';

class LocalProvider extends ChangeNotifier {
  Locale? _locale;
  Locale? get getLocal => _locale;
  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }

  void clearLocal() {
    _locale = null;
    notifyListeners();
  }
}
