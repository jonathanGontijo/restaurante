import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/instance_manager.dart';
import 'package:get/utils.dart';
import 'package:restaurante/common/app_style.dart';
import 'package:restaurante/common/reusable_text.dart';
import 'package:restaurante/constants/constants.dart';
import 'package:restaurante/constants/uidata.dart';
import 'package:restaurante/controllers/food_controller.dart';

class ChooseCategory extends HookWidget {
  const ChooseCategory({required this.next, super.key});
  final Function() next;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FoodController());
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
                  text: "Pick Category",
                  style: appStyle(16, kGray, FontWeight.w600),
                ),
                ReusableText(
                  text:
                      "You are to pick a category to continue adding a food item",
                  style: appStyle(11, kGray, FontWeight.normal),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height,
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, i) {
                final category = categories[i];
                return ListTile(
                  onTap: () {
                    controller.setCategory = category['_id'];
                    next();
                  },
                  leading: CircleAvatar(
                    radius: 18.r,
                    backgroundColor: kPrimary,
                  ),
                  title: ReusableText(
                    text: category['title'],
                    style: appStyle(12, kGray, FontWeight.normal),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: kGray,
                    size: 15.sp,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
