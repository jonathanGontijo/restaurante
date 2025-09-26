import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurante/common/background_container.dart';
import 'package:restaurante/common/custom_appbar.dart';
import 'package:restaurante/constants/constants.dart';
import 'package:restaurante/views/home/widgets/home_tabs.dart';
import 'package:restaurante/views/home/widgets/home_tiles.dart';
import 'package:restaurante/views/home/widgets/orders/cancelled_orders.dart';
import 'package:restaurante/views/home/widgets/orders/delivered_orders.dart';
import 'package:restaurante/views/home/widgets/orders/new_orders.dart';
import 'package:restaurante/views/home/widgets/orders/picked_up.dart';
import 'package:restaurante/views/home/widgets/orders/preparing.dart';
import 'package:restaurante/views/home/widgets/orders/ready_orders.dart';
import 'package:restaurante/views/home/widgets/orders/self_deliveries.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController = TabController(
    length: orderList.length,
    vsync: this,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kSecondary,
        flexibleSpace: const CustomAppBar(),
      ),
      body: BackGroundContainer(
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            SizedBox(height: 15.h),
            const HomeTiles(),
            SizedBox(height: 15.h),
            HomeTabs(tabController: _tabController),
            SizedBox(height: 15.h),
            ClipRRect(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 12.w),
                height: height * 0.7,
                color: Colors.transparent,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    NewOrders(),
                    Preparing(),
                    ReadyOrders(),
                    PickedUp(),
                    SelfDeliveries(),
                    DeliveredOrders(),
                    CancelledOrders(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
