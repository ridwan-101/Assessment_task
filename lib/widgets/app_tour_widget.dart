import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      width:
          280.w, // Slightly smaller width to ensure it fits within screen bounds
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with close button
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
                    color: const Color(0xFF1E293B),
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              GestureDetector(
                onTap: onClose,
                child: Icon(
                  Icons.close,
                  size: 20.sp,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          // Content
          Text(
            content,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF64748B),
              height: 1.5,
              decoration: TextDecoration.none,
            ),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 16.h),
          // Action buttons
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
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text(
                      'Prev',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF64748B),
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              if (showPrevButton && showNextButton) SizedBox(width: 12.w),
              if (showNextButton)
                GestureDetector(
                  onTap: onNext,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF3B82F6),
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
