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
    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      SizedBox(
        // width: 82,
        child: TabBar(
          automaticIndicatorColorAdjustment: true,
          indicatorWeight: 0,
          onTap: (int index) {},
          labelColor: Colors.blueAccent,
          indicatorColor: Colors.black54,
          indicatorSize: TabBarIndicatorSize.label,
          isScrollable: false,
          // dragStartBehavior: ,
          unselectedLabelColor: Colors.black12,
          indicator: const ShapeDecoration(
            shape: CircleBorder(),
            color: Colors.black54,
          ),
          controller: _tabController,
          splashFactory: NoSplash.splashFactory,
          overlayColor: const MaterialStatePropertyAll(Colors.transparent),
          splashBorderRadius: BorderRadius.circular(30),
          tabs: const [
            Tab(
              icon: Icon(Icons.circle, size: 0, color: Colors.black26),
            ),
            Tab(
              icon: Icon(Icons.circle, size: 0, color: Colors.black26),
            ),
          ],
        ),
      ),
      Expanded(
        child: TabBarView(
          physics: BouncingScrollPhysics(),
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


