import 'package:intl/intl.dart';

class UserEntity {
  final int? id;
  final String? username;
  final String? email;
  final String? phoneNumber;
  final String? dateOfBirth;
  final bool? gender;

  UserEntity({
    this.id,
    this.username,
    this.email,
    this.phoneNumber,
    this.dateOfBirth,
    this.gender,
  });

  String formatDateString(String? dateString) {
    if (dateString == null) return '';
    DateTime dateTime = DateTime.parse(dateString);
    return DateFormat.yMMMd().format(dateTime);
  }
}
