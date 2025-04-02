import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSpace {
  AppSpace._();
  static final vertical = _VerticalSpace();
  static final horizontal = _HorizontalSpace();
}

class _VerticalSpace {
  final SizedBox space5 = SizedBox(
    height: 5.h,
  );
  final SizedBox space8 = SizedBox(
    height: 8.h,
  );
  final SizedBox space10 = SizedBox(
    height: 10.h,
  );
  final SizedBox space16 = SizedBox(
    height: 16.h,
  );
  final SizedBox space20 = SizedBox(
    height: 20.h,
  );

    final SizedBox space24 =  SizedBox(
    height: 24.h,
  );
    final SizedBox space30 =  SizedBox(

    height: 30.h,
  );
  final SizedBox space32 = SizedBox(
    height: 32.h,
  );
  final SizedBox space40 = SizedBox(
    height: 40.h,
  );
  final SizedBox space50 = SizedBox(
    height: 50.h,
  );
}

class _HorizontalSpace {
  final SizedBox space5 = SizedBox(
    width: 5.h,
  );
  final SizedBox space8 = SizedBox(
    width: 8.h,
  );
  final SizedBox space10 = SizedBox(
    width: 10.h,
  );
  final SizedBox space16 = SizedBox(
    width: 16.h,
  );
  final SizedBox space20 = SizedBox(
    width: 20.h,
  );
  final SizedBox space24 = SizedBox(
    width: 24.h,
  );
  final SizedBox space30 = SizedBox(
    width: 30.h,
  );
  final SizedBox space40 = SizedBox(
    width: 40.h,
  );
  final SizedBox space50 = SizedBox(
    width: 50.h,
  );
   final SizedBox space80 =  SizedBox(
    width: 80.h,
  );

  EdgeInsets defaultPagePadding = const EdgeInsets.symmetric(horizontal: 25);
}