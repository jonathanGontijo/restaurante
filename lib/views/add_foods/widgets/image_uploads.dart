import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurante/common/app_style.dart';
import 'package:restaurante/common/custom_button.dart';
import 'package:restaurante/common/reusable_text.dart';
import 'package:restaurante/constants/constants.dart';
import 'package:restaurante/controllers/uploader_controller.dart';

class ImageUploads extends StatelessWidget {
  const ImageUploads({super.key, required this.back, required this.next});

  final Function back;
  final Function next;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UploaderController());
    return SizedBox(
      height: height,
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.w, top: 12.h, bottom: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  text: "Upload Images",
                  style: appStyle(16, kGray, FontWeight.w600),
                ),
                ReusableText(
                  text:
                      "You are required to upload at least 2 images to proceed",
                  style: appStyle(11, kGray, FontWeight.normal),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.8,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.pickImage('one');
                        },
                        child: Container(
                          height: 120.h,
                          width: width / 2.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(color: kGrayLight),
                          ),
                          child: Center(
                            child: ReusableText(
                              text: 'Upload Image',
                              style: appStyle(16, kDark, FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 120.h,
                        width: width / 2.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: kGrayLight),
                        ),
                        child: Center(
                          child: ReusableText(
                            text: 'Upload Image',
                            style: appStyle(16, kDark, FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 120.h,
                        width: width / 2.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: kGrayLight),
                        ),
                        child: Center(
                          child: ReusableText(
                            text: 'Upload Image',
                            style: appStyle(16, kDark, FontWeight.w600),
                          ),
                        ),
                      ),
                      Container(
                        height: 120.h,
                        width: width / 2.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: kGrayLight),
                        ),
                        child: Center(
                          child: ReusableText(
                            text: 'Upload Image',
                            style: appStyle(16, kDark, FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        text: 'Back',
                        btnWidth: width / 2.5,
                        btnRadius: 9,
                        onTap: () {
                          back();
                        },
                      ),
                      CustomButton(
                        text: 'next',
                        btnWidth: width / 2.5,
                        btnRadius: 9,
                        onTap: () {
                          next();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
