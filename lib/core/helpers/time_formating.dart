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
