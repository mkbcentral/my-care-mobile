class LocalData {
  static final appointements = ['Lundi', 'Mardi', 'Mercredi'];
  static final contries = ['R.D Congo', 'Zambie', 'Rwanda'];
  static final genders = ['M', 'F'];
  static final bloodGroup = ['O+', 'A+', 'B+'];

  static String getGenderName(String code) {
    switch (code) {
      case 'M':
        return 'Masculin';
      case 'F':
        return 'Féminin';
      default:
        return 'M';
    }
  }
}
