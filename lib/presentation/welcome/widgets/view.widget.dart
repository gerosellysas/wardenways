import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wander_ways/infrastructure/theme/theme.dart';

import 'logo.widget.dart';

class WelcomeView extends StatelessWidget {
  final int? selectedLanguage;
  final Widget? languageButton;
  final Widget? signInNav;
  final Widget? signUpNav;

  const WelcomeView({
    super.key,
    this.selectedLanguage,
    this.languageButton,
    this.signInNav,
    this.signUpNav,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Hues.primary,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 120.h),
            const Center(child: WelcomeLogo()),
            SizedBox(height: 60.h),
            Text(
              selectedLanguage == 0
                  ? "Selamat datang di Wander Ways"
                  : "Welcome to Wander Ways",
              textAlign: TextAlign.center,
              style: Fonts.bold(
                color: Hues.accent,
                size: 18,
              ),
            ),
            Text(
              selectedLanguage == 0
                  ? "Kemudahan perjalanan, dalam genggaman Anda"
                  : "The ease of travel, in the palm of your hand",
              textAlign: TextAlign.center,
              style: Fonts.regular(
                color: Hues.greyLight,
                size: 13,
              ),
            ),
            SizedBox(height: 60.h),
            languageButton!,
            const Expanded(child: SizedBox()),
            signInNav!,
            SizedBox(height: 12.h),
            signUpNav!,
            SizedBox(height: 48.h),
          ],
        ),
      ),
    );
  }
}
