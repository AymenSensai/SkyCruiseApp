import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ScreenUtilExtension on num {
  double get v => ScreenUtil().setHeight(this);
  double get h => ScreenUtil().setWidth(this);
}
