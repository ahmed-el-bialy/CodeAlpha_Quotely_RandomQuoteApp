import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quotely/core/theming/app_colors.dart';
import 'package:quotely/features/home/data/models/quote_model.dart';

class QuoteContent extends StatelessWidget {
  const QuoteContent({super.key, required this.model});

  final QuoteModel model;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 350),
      child: Column(
        key: ValueKey(model.quote),
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            model.quote,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.sp,
              height: 1.5,
              color: AppColors.quoteText,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 22.h),
          Container(
            width: 28.w,
            height: 2.h,
            color: AppColors.accent,
          ),
          SizedBox(height: 18.h),
          Text(
            model.author,
            style: TextStyle(
              fontSize: 14.sp,
              letterSpacing: 0.3,
              color: AppColors.authorText,
            ),
          ),
        ],
      ),
    );
  }
}
