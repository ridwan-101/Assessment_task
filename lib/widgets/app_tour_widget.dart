import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hellomoney/theme/app_theme.dart';
import 'package:hellomoney/widgets/extension.dart';

class AppTourWidget extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback? onNext;
  final VoidCallback? onPrev;
  final VoidCallback? onClose;
  final bool showPrevButton;
  final bool showNextButton;
  final bool isLastStep;

  const AppTourWidget({
    Key? key,
    required this.title,
    required this.content,
    this.onNext,
    this.onPrev,
    this.onClose,
    this.showPrevButton = true,
    this.showNextButton = true,
    this.isLastStep = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.w,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppTheme.shadowColor,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.slateDarkColor,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              GestureDetector(
                onTap: onClose,
                child: Icon(
                  Icons.close,
                  size: 20.sp,
                  color: AppTheme.greyDarkColor,
                ),
              ),
            ],
          ),
          12.toColumnSpace(),
          Text(
            content,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppTheme.slateLightColor,
              height: 1.5,
              decoration: TextDecoration.none,
            ),
            textAlign: TextAlign.left,
          ),
          16.toColumnSpace(),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (showPrevButton)
                GestureDetector(
                  onTap: onPrev,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.greyLightColor,
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text(
                      'Prev',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.slateLightColor,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              if (showPrevButton && showNextButton) 12.toRowSpace(),
              if (showNextButton)
                GestureDetector(
                  onTap: onNext,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.blueLightColor,
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text(
                      isLastStep ? 'Finish' : 'Next',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
