import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurante/common/app_style.dart';
import 'package:restaurante/common/tab_widget.dart';
import 'package:restaurante/constants/constants.dart';

class HomeTabs extends StatelessWidget {
  const HomeTabs({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 12.w),
      child: Container(
        height: 25.h,
        width: width,
        decoration: BoxDecoration(
          color: kLightWhite,
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicator: BoxDecoration(
            color: kPrimary,
            borderRadius: BorderRadius.circular(25.r),
          ),
          labelColor: kWhite,
          unselectedLabelColor: kGray,
          dividerColor: Colors.transparent,
          tabAlignment: TabAlignment.start,
           unselectedLabelStyle: appStyle(12, kGrayLight, FontWeight.w500),
          labelStyle: appStyle(12, kLightWhite, FontWeight.w600),
          labelPadding: EdgeInsets.zero,
          tabs: List.generate(orderList.length, (i) {
            return TabWidget(text: orderList[i]);
          }),
        ),
      ),
    );
  }
}
