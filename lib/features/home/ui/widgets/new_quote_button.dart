import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quotely/core/theming/app_colors.dart';

class NewQuoteButton extends StatelessWidget {
  const NewQuoteButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: AppColors.accent,
          shape: const CircleBorder(),
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: onTap,
            child: SizedBox(
              width: 64.w,
              height: 64.w,
              child: Icon(
                Icons.refresh_rounded,
                size: 26.sp,
                color: AppColors.background,
              ),
            ),
          ),
        ),
        SizedBox(height: 14.h),
        Text(
          'Tap for a new quote',
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.hintText,
          ),
        ),
      ],
    );
  }
}
