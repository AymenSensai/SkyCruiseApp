import 'package:barcode/barcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BarcodeGenerator {
  final String data;

  BarcodeGenerator(this.data);

  Future<Widget> generateBarcode() async {
    final bc = Barcode.code128();
    final svg = bc.toSvg(
      data,
      width: 200,
      height: 80,
      fontHeight: 0,
    );

    return SvgPicture.string(svg);
  }
}
