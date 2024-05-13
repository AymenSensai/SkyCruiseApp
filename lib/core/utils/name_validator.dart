bool isValidName(String name, {bool isRequired = false}) {
  if (name.isEmpty) {
    return !isRequired;
  }
  return RegExp(r'^[a-zA-Z]+(?: [a-zA-Z]+)*$').hasMatch(name);
}
