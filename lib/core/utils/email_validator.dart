bool isValidEmail(String email, {bool isRequired = false}) {
  if (email.isEmpty) {
    return !isRequired;
  }
  return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
}
