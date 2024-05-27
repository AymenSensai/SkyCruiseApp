import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/widgets/app_bar.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  int _selectedLanguage = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackCenteredTitleAppBar(title: 'Language'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 12.h),
            child: Column(
              children: [
                _languageRow(Assets.arabic, 'Arabic', 0),
                _languageRow(Assets.english, 'English', 1),
                _languageRow(Assets.french, 'French', 2),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _languageRow(String image, String language, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedLanguage = index;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: _selectedLanguage == index
                ? ColorsManager.primary500
                : ColorsManager.neutral200,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Image.asset(
              image,
              height: 32.h,
              width: 32.w,
            ),
            horizontalSpace(16),
            Text(
              language,
              style: TextStyles.font14Neutral900Medium,
            ),
            const Spacer(),
            if (_selectedLanguage == index)
              const Icon(
                Icons.check_rounded,
                color: ColorsManager.primary500,
              )
          ],
        ),
      ),
    );
  }
}
