class AppRegex {
  static bool isUsernameValid(String username) {
    return RegExp(r'^[a-zA-Z0-9]+$').hasMatch(username);
  }

  static bool isEmailValid(String email) {
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email);
  }

  static bool isPasswordValid(String password) {
    return RegExp(
            r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$")
        .hasMatch(password);
  }

  static bool isPhoneNumberValid(String phoneNumber) {
    return RegExp(r'^(010|011|012|015)[0-9]{8}$').hasMatch(phoneNumber);
  }

  static bool hasLowerCase(String password) {
    return RegExp(r'^(?=.*[a-z])').hasMatch(password);
  }

  static bool hasUpperCase(String password) {
    return RegExp(r'^(?=.*[A-Z])').hasMatch(password);
  }

  static bool hasNumber(String password) {
    return RegExp(r'^(?=.*?[0-9])').hasMatch(password);
  }

  static bool hasSpecialCharacter(String password) {
    return RegExp(r'^(?=.*?[#?!@$%^&*-])').hasMatch(password);
  }

  static bool hasMinLength(String password) {
    return RegExp(r'^(?=.{8,})').hasMatch(password);
  }

  static String? passwordValidator(String password) {
    if (!hasLowerCase(password)) {
      return 'Password must contain at least one lowercase letter.';
    }
    if (!hasUpperCase(password)) {
      return 'Password must contain at least one uppercase letter.';
    }
    if (!hasSpecialCharacter(password)) {
      return 'Password must contain at least one special character.';
    }
    if (!hasNumber(password)) {
      return 'Password must contain at least one number.';
    }
    if (!hasMinLength(password)) {
      return 'Password must be at least 8 characters long.';
    }
    return null;
  }
}
