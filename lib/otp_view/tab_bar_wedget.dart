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
        width: 82,
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
              icon: Icon(Icons.circle, size: 10, color: Colors.black26),
            ),
            Tab(
              icon: Icon(Icons.circle, size: 10, color: Colors.black26),
            ),
          ],
        ),
      ),
      Expanded(
        child: TabBarView(
          physics:
              const PageScrollPhysics().applyTo(const ClampingScrollPhysics()),
          // viewportFraction: 0.3,
          controller: _tabController,
          children: [
            widget.getOtpWidget,
            widget.verifyOtpWidget,
          ],
        ),
      ),
      //     Container(
      //       // margin: EdgeInsets.only(top: getMediaQueryHeight(context, 0.30)),
      //       child: Column(
      //       children: [
      //         ElevatedButton(
      //           onPressed: () => widget.getOtpWidget, // Navigate to Tab 2
      //         child:Text('Re-enter Mobile Number',style: TextStyle(fontStyle: FontStyle.italic),),
      //     ),
      //         // ElevatedButton(
      //         //   onPressed: () => widget.getOtpWidget, // Navigate to Tab 2
      //         //   child:Text('Re-send OTP Number',style: TextStyle(fontStyle: FontStyle.italic),),
      //         // )
      //   ],
      // ),
      //     )
    ]);
  }
}
