import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../theming/colors.dart';

class CustomQuickAlert extends StatelessWidget {
  final String message;
  final String text;
  final bool isLoading;
  final Color color;

  const CustomQuickAlert({
    super.key,
    required this.message,
    required this.text,
    this.isLoading = true,
    this.color = ColorsManager.primary500,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 15),
                Container(
                  width: 112.0,
                  height: 112.0,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 50,
                    color: ColorsManager.whiteBackground,
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  text,
                  style: const TextStyle(
                      fontSize: 14, color: ColorsManager.neutral900),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                if (isLoading)
                  SpinKitRing(
                    color: color,
                    size: 40.0,
                    lineWidth: 3.0,
                  ),
              ],
            ),
          ),
          Positioned(
            top: 55,
            right: 56,
            child: Container(
              width: 13,
              height: 13,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 19,
            right: 100,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 94,
            right: 75,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 125,
            right: 60,
            child: Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 145,
            right: 100,
            child: Container(
              width: 4,
              height: 4,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 153,
            right: 174,
            child: Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 120,
            right: 212,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 94,
            right: 226,
            child: Container(
              width: 2,
              height: 2,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 24,
            right: 200,
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
