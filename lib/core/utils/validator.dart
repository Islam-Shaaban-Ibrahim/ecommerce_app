class Validator {
  static bool isValidEmail(String? value) {
    if (value == null) return false;
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(value);
  }

  static bool isValidPassword(String? value) {
    if (value == null) return false;
    return value.trim().length >= 6 && value.trim().length <= 20;
  }

  static bool isValidEgPhone(String? value) {
    if (value == null) return false;
    return RegExp(r'^(010|011|012|015[0-9]{8})$').hasMatch(value);
  }
}
