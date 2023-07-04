import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:login_app/base_route.dart';

class MyTabbedWidget extends StatefulWidget {
  Widget getOtpWidget = Container();
  Widget verifyOtpWidget = Container();

  MyTabbedWidget({required this.getOtpWidget, required this.verifyOtpWidget});

  @override
  _MyTabbedWidgetState createState() => _MyTabbedWidgetState();
}

class _MyTabbedWidgetState extends BaseRoute<MyTabbedWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _goToTab(int index) {
    _tabController.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    return Column( children: [
      // SizedBox(
      //   child: TabBar(
      //     automaticIndicatorColorAdjustment: true,
      //     onTap: (int index) {},
      //     indicatorSize: TabBarIndicatorSize.label,
      //     isScrollable: false,
      //     // dragStartBehavior: ,
      //     unselectedLabelColor: Colors.black12,
      //     indicator: const BoxDecoration(),
      //     indicatorColor: Colors.transparent,
      //     indicatorPadding: EdgeInsets.zero,
      //     indicatorWeight: double.minPositive,
      //     controller: _tabController,
      //     overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      //     tabs: const [
      //       Tab(
      //         icon: Icon(Icons.circle, size: 0, color: Colors.black26),
      //       ),
      //       Tab(
      //         icon: Icon(Icons.circle, size: 0, color: Colors.black26),
      //       ),
      //     ],
      //   ),
      // ),
      Expanded(
        child: TabBarView(
          physics: const BouncingScrollPhysics(),
          controller: _tabController,
          children: [
            widget.getOtpWidget,
            widget.verifyOtpWidget,
          ],
        ),
      ),
    ]);
  }
}


