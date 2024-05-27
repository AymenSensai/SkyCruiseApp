import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatElapsedTime(DateTime pastDate) {
  final Duration difference = DateTime.now().difference(pastDate);

  if (difference.inDays >= 365) {
    final int years = difference.inDays ~/ 365;
    return '${years}y';
  } else if (difference.inDays >= 7) {
    final int weeks = difference.inDays ~/ 7;
    return '${weeks}w';
  } else if (difference.inDays > 0) {
    return '${difference.inDays}d';
  } else if (difference.inHours > 0) {
    return '${difference.inHours}h';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes}m';
  } else {
    return '${difference.inSeconds}s';
  }
}

String formatDuration(Duration duration) {
  final days = duration.inDays;
  final hours = duration.inHours % 24;
  final minutes = duration.inMinutes % 60;
  final seconds = duration.inSeconds % 60;

  String date = '';

  if (days > 0) {
    date += '${days}d ';
  }
  if (hours > 0) {
    date += '${hours}h ';
    if (minutes > 0) date += '${minutes}m';
  }
  if (minutes > 0) {
    date += '${minutes}m ';
    if (seconds > 0) date += '${seconds}s';
  }
  return date;
}

DateTime formatDate(String date) {
  DateFormat inputFormat = DateFormat('MMMM d, yyyy');
  DateTime parsedDate = inputFormat.parse(date);
  return DateUtils.dateOnly(parsedDate);
}

String formatDateWithDay(String dateString) {
  DateTime dateTime = DateTime.parse(dateString);
  String formattedDate = DateFormat('EEEE, MMM d yyyy').format(dateTime);
  return formattedDate;
}
