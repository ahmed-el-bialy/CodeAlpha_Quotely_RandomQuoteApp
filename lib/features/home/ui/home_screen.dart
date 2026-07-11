import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quotely/core/helpers/spacing.dart';
import 'package:quotely/core/theming/app_colors.dart';
import 'package:quotely/features/home/logic/quote_cubit.dart';
import 'package:quotely/features/home/logic/quote_state.dart';
import 'package:quotely/features/home/ui/widgets/new_quote_button.dart';
import 'package:quotely/features/home/ui/widgets/quote_content.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: 0.05.sh,
              left: -45.w,
              child: Text(
                '“',
                style: TextStyle(
                  color: AppColors.accent.withValues(alpha: 0.07),
                  fontSize: 320.sp,
                  height: 0.8,
                ),
              ),
            ),

            Positioned(
              bottom: 0.12.sh,
              right: -45.w,
              child: Text(
                '”',
                style: TextStyle(
                  color: AppColors.accent.withValues(alpha: 0.07),
                  fontSize: 320.sp,
                  fontFamily: 'Georgia',
                  height: 0.8,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  verticalSpacing(20),

                  Icon(
                    Icons.format_quote_rounded,
                    size: 34.sp,
                    color: AppColors.quoteIcon,
                  ),

                  const Spacer(),

                  BlocBuilder<QuoteCubit, QuoteState>(
                    builder: (context, state) {
                      if (state is QuoteError) {
                        return Text(
                          state.message,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.authorText,
                          ),
                        );
                      }
                      return QuoteContent(state: state);
                    },
                  ),

                  const Spacer(),

                  NewQuoteButton(
                    onTap: () => context.read<QuoteCubit>().getRandomQuote(),
                  ),
                  verticalSpacing(24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}