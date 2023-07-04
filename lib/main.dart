import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My App',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/my-page', page: () => LoginImage(),transition: Transition.noTransition),
      ],
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Home'),
      // ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed('/my-page',preventDuplicates: false,); // Navigate to MyPage
          },
          child: Text('Go to My Page'),
        ),
      ),
    );
  }
}
