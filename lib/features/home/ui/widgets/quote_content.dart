import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quotely/core/theming/app_colors.dart';
import 'package:quotely/features/home/logic/quote_state.dart';
import 'package:shimmer/shimmer.dart';

class QuoteContent extends StatelessWidget {
  const QuoteContent({super.key, required this.state});

  final QuoteState state;

  @override
  Widget build(BuildContext context) {
    if (state is QuoteLoading || state is QuoteInitial) {
      return AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        child: Shimmer.fromColors(
          baseColor: AppColors.quoteText.withValues(alpha: 0.3),

          highlightColor: AppColors.accent,

          child: Text(
            'Loading Quote...',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w400),
          ),
        ),
      );
    }

    if (state is QuoteLoaded) {
      final model = (state as QuoteLoaded).quote;
      return AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        child: Column(
          key: ValueKey(model.quote),

          mainAxisSize: MainAxisSize.max,
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
            Container(width: 28.w, height: 2.h, color: AppColors.accent),
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

    return const SizedBox.shrink();
  }
}
