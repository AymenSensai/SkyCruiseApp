import 'package:flutter/material.dart';

import '../networking/api_constants.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}

extension ScreenSize on BuildContext {
  double screenHeight() => MediaQuery.of(this).size.height;
  double screenWidth() => MediaQuery.of(this).size.width;
}

extension NetworkImage on Widget {
  Widget networkImage(String image, {double? width, double? height}) =>
      Image.network(
        "${ApiConstants.apiBaseUrl}$image",
        width: width,
        height: height,
        fit: BoxFit.contain,
      );
}
