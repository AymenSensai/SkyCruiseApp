bool isValidPassword(String password, {bool isRequired = false}) {
  if (password.isEmpty) {
    return !isRequired;
  }
  return true;
}
