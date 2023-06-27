
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseRoute<T extends StatefulWidget> extends State<T>{

  @override
  void initState() {
    super.initState();
    _baseLifeCycle();
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

  _baseLifeCycle() {
    SystemChannels.lifecycle.setMessageHandler((msg) async {
      switch (msg) {
        case "AppLifecycleState.paused":
          break;
        case "AppLifecycleState.resumed":
          break;
        default:
      }
      return null;
    });
  }

  double getMediaQueryHeight(BuildContext context, double px) {
    return MediaQuery.of(context).size.height * px;
  }

  double getMediaQueryWidth(BuildContext context, double px) {
    return MediaQuery.of(context).size.width * px;
  }

  // Color setStopStatusColor(String stop){
  //   switch(stop){
  //     case RouteConstants.STATUS_COMPLETED:
  //       return Utils.hexColor(AppColor.success);
  //     case RouteConstants.STATUS_ARRIVED:
  //       return Utils.hexColor(AppColor.arrived);
  //     case RouteConstants.STATUS_IN_COMPLETE:
  //       return Utils.hexColor(AppColor.inComplete);
  //     default:
  //       return Colors.grey;
  //   }
  // }

}
