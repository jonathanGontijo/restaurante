import 'package:flutter/material.dart';
import 'package:restaurante/common/app_style.dart';
import 'package:restaurante/common/background_container.dart';
import 'package:restaurante/common/reusable_text.dart';
import 'package:restaurante/constants/constants.dart';
import 'package:restaurante/views/add_foods/widgets/all_categories.dart';
import 'package:restaurante/views/add_foods/widgets/image_uploads.dart';

class AddFoods extends StatefulWidget {
  const AddFoods({super.key});

  @override
  State<AddFoods> createState() => _AddFoodsState();
}

class _AddFoodsState extends State<AddFoods> {
  final PageController _pageController = PageController();
  // int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: kSecondary,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableText(
              text: 'Wellcome to Restaurant Panel',
              style: appStyle(14, kLightWhite, FontWeight.w600),
            ),
            ReusableText(
              text: 'Fill all the required info to add food itens',
              style: appStyle(12, kLightWhite, FontWeight.normal),
            ),
          ],
        ),
      ),
      body: BackGroundContainer(
        child: ListView(
          children: [
            SizedBox(
              height: height,
              width: width,
              child: PageView(
                controller: _pageController,
                physics: NeverScrollableScrollPhysics(),
                pageSnapping: false,
                children: [
                  ChooseCategory(
                    next: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    },
                  ),
                  ImageUploads(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
