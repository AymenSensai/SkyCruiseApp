class ApiConstants {
  static const String apiBaseUrl = "http://192.168.1.6:8000/api/";

  static const String signIn = "auth/login";
  static const String signUp = "auth/register";
  static const String sendEmail = "auth/sendEmail";
  static const String passwordReset = "auth/passwordReset";
}

class ApiErrors {
  static const String badRequestError = "Bad request. Please try again.";
  static const String noContent = "No content available.";
  static const String forbiddenError =
      "Access denied. You do not have permission.";
  static const String unauthorizedError = "Unauthorized access. Please log in.";
  static const String notFoundError = "Requested resource not found.";
  static const String conflictError = "Conflict occurred. Please try again.";
  static const String internalServerError =
      "Internal server error. Please try again later.";
  static const String unknownError =
      "An unknown error occurred. Please try again.";
  static const String timeoutError =
      "Request timed out. Please check your connection and try again.";
  static const String defaultError = "An error occurred. Please try again.";
  static const String cacheError = "Failed to load data from cache.";
  static const String noInternetError =
      "No internet connection. Please check your network and try again.";
  static const String loadingMessage = "Loading... Please wait.";
  static const String retryAgainMessage =
      "Something went wrong. Please try again.";
  static const String ok = "OK";
}
