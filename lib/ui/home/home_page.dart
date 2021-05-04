import 'package:carousel_pro/carousel_pro.dart';
import 'package:doctor_care/src/color.dart';
import 'package:doctor_care/ui/home/home_controller.dart';
import 'package:doctor_care/ui/home/lv_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  slideShow(),
                  Padding(padding: EdgeInsets.all(2.h)),
                  titleHomePage(),
                  Padding(padding: EdgeInsets.all(2.h)),
                  tabBar(homeController),
                  Divider(color: Colors.grey),
                  tabBarView(homeController)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget slideShow() {
  return SizedBox(
    height: 25.0.h,
    child: Carousel(
      dotSize: 0,
      dotBgColor: Colors.transparent,
      images: [
        Image.network(
          'https://www.w3schools.com/howto/img_forest.jpg',
          fit: BoxFit.cover,
        ),
        Image.network(
          'https://www.w3schools.com/howto/img_forest.jpg',
          fit: BoxFit.cover,
        ),
        Image.network(
          'https://www.w3schools.com/howto/img_forest.jpg',
          fit: BoxFit.cover,
        )
      ],
    ),
  );
}

Widget titleHomePage() {
  return Text(
    'DANH SÁCH PHÒNG KHÁM',
    style: TextStyle(
      fontSize: 18.0.sp,
      color: MyColors.PurpleTitle,
      shadows: <Shadow>[
        Shadow(
          offset: Offset(2, 2),
          blurRadius: 3.0,
          color: MyColors.PurpleTitle,
        ),
      ],
    ),
  );
}

Widget tabBar(HomeController homeController) {
  return TabBar(
    controller: homeController.tabController,
    indicatorColor: MyColors.PurpleSelectedTabBar,
    labelColor: MyColors.PurpleSelectedTabBar,
    unselectedLabelColor: Colors.grey,
    tabs: [
      Tab(
        child: Row(
          children: [
            Icon(
              Icons.location_pin,
              color: MyColors.PurpleIconTabBar,
              size: 6.w,
            ),
            Padding(padding: EdgeInsets.all(1.w)),
            Text(
              'Khám nhi',
              style: TextStyle(fontSize: 12.0.sp),
            ),
          ],
        ),
      ),
      Tab(
        child: Row(
          children: [
            Icon(
              Icons.location_pin,
              color: MyColors.YellowIconTabBar,
              size: 6.w,
            ),
            Padding(padding: EdgeInsets.all(1.w)),
            Text(
              'Thai sản',
              style: TextStyle(fontSize: 12.0.sp),
            ),
          ],
        ),
      ),
      Tab(
        child: Row(
          children: [
            Icon(
              Icons.star_half,
              color: MyColors.BlueIconTabBar,
              size: 6.w,
            ),
            Padding(padding: EdgeInsets.all(1.w)),
            Text(
              'Uy tín',
              style: TextStyle(fontSize: 12.0.sp),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget tabBarView(HomeController homeController) {
  return Expanded(
    child: TabBarView(
      controller: homeController.tabController,
      children: [
        pediatricClinic(homeController),
        pediatricClinic(homeController),
        pediatricClinic(homeController),
        /*gynecologicalClinic(homeController),
        reputableClinic(homeController)*/
      ],
    ),
  );
}

Widget pediatricClinic(HomeController homeController) {
  homeController.initTabBarView(1);
  if (homeController.isLoading) {
    return Center(
      child: CircularProgressIndicator(),
    );
  } else {
    return listViewClinic(homeController.clinicList);
  }
}

/*gynecologicalClinic(HomeController homeController) {
  homeController.initTabBarView(2);
  if (homeController.isLoading) {
    return Center(
      child: CircularProgressIndicator(),
    );
  } else {
    return listViewClinic(homeController.clinicList);
  }
}

reputableClinic(HomeController homeController) {
  homeController.initTabBarView(3);
  if (homeController.isLoading) {
    return Center(
      child: CircularProgressIndicator(),
    );
  } else {
    return listViewClinic(homeController.clinicList);
  }
}*/
