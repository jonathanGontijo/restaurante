import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:restaurante/common/home_tile.dart';
import 'package:restaurante/constants/constants.dart';
import 'package:restaurante/views/add_foods/add_foods.dart';
import 'package:restaurante/views/food/food_list.dart';

class HomeTiles extends StatelessWidget {
  const HomeTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      height: 65.h,
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 8.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HomeTile(
              text: "Add Foods",
              iconPath: "assets/icons/taco.svg",
              onTap: () {
                Get.to(
                  () => const AddFoods(),
                  transition: Transition.fadeIn,
                  duration: const Duration(milliseconds: 900),
                );
              },
            ),
            HomeTile(
              text: "Wallet",
              iconPath: "assets/icons/wallet.svg",
              onTap: () {},
            ),
            HomeTile(
              text: "Foods",
              iconPath: "assets/icons/french_fries.svg",
              onTap: () {
                Get.to(
                  () => const FoodList(),
                  transition: Transition.fadeIn,
                  duration: const Duration(milliseconds: 900),
                );
              },
            ),
            HomeTile(
              text: "Self Deliveries",
              iconPath: "assets/icons/deliver_food.svg",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
