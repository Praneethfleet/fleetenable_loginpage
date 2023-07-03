import 'dart:async';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_app/slide_animtion.dart';

import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:simple_icons/simple_icons.dart';


import 'base_route.dart';

import 'otp_view/tab_bar_widget.dart';

class LoginImage extends StatefulWidget {
  const LoginImage({super.key});

  @override
  State<LoginImage> createState() => _LoginImageState();
}

class _LoginImageState extends BaseRoute<LoginImage> {
  // LoginController loginController = Get.put(LoginController(), permanent: true);
  late PageController _pageController;
  var _currentPage = 0.obs;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // late Timer _timer;
  // int _start = 5;
  // bool isLoading = false;
  // void startTimer() {
  //   const oneSec = Duration(seconds: 1);
  //   _timer = Timer.periodic(
  //       oneSec,
  //   (Timer timer) {
  //     if (_start == 0) {
  //       setState(() {
  //         timer.cancel();
  //         isLoading = false;
  //       });
  //     } else {
  //       setState(() {
  //         _start--;
  //       });

  void _nextPage() {
    if (_currentPage < 2) {
      setState(() {
        _currentPage++;
        _pageController.animateToPage(
          _currentPage.toInt(),
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
        );
      });
    }
  }

  var backButton = Row(
    children: [
      IconButton(
        icon: const Icon(CupertinoIcons.chevron_left_circle,
            color: Colors.indigo, size: 40),
        onPressed: () {
          Get.back();
        },
      ),
    ],
  );

  Widget imageWidget() {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomRight:
                    Radius.circular(getMediaQueryWidth(context, 0.15))),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade500,
                spreadRadius: 0.5,
                blurRadius: 90,
                offset: const Offset(0, 5),
              ),
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(getMediaQueryWidth(context, 0.15))),
          child: Image.asset(
            'lib/images/fleet_truck.png',
            // Replace with your image file path
            width: getMediaQueryWidth(context, 1.0),
            height: getMediaQueryHeight(context, 0.40),
            fit: BoxFit.cover,
            alignment:
                Alignment.topCenter, // Adjust the fit as per your requirements
          ),
        ),
      ),
      // Container(
      //     padding: EdgeInsets.only(
      //         left: getMediaQueryWidth(context, 0.66),
      //         top: getMediaQueryHeight(context, 0.040)),
      //     child: SizedBox(
      //         child: Row(
      //       children: [
      //         Image.asset('lib/images/splash_logo.png',
      //             width: getMediaQueryWidth(context, 0.04)),
      //         SizedBox(
      //           width: getMediaQueryWidth(context, 0.01),
      //         ),
      //         Image.asset(
      //           'lib/images/logo.png',
      //           color: Colors.white70,
      //           width: getMediaQueryWidth(context, 0.26),
      //         )
      //       ],
      //     ))),

      Container(
        height: getMediaQueryHeight(context, 0.3),
        padding: const EdgeInsets.only(top: 40, left: 15),
        child: Text("login".capitalize ?? "",
            style: TextStyle(
                color: Colors.white60,
                fontSize: getMediaQueryWidth(context, 0.08),
                fontWeight: FontWeight.w400)),
      )
    ]);
  }

  Widget loginContainer() {
    return Column(children: [
      SizedBox(
        height: getMediaQueryHeight(context, 0.04),
      ),
      Expanded(
        child: Container(
          // width: getMediaQueryWidth(context, 1.0),
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                getMediaQueryWidth(context, 0.15),
              ),
            ),
          ),
          child: SizedBox(
            // width: getMediaQueryWidth(context, 1),
            // height: getMediaQueryHeight(context, 0.47),
            child: MyTabbedWidget(
                getOtpWidget: getOtpPageWidget(), verifyOtpWidget: verifyOtp()),
          ),
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      SlideToast(imageWidget(), -0.2, -0.2),
      SlideToast(
          SizedBox(
              width: getMediaQueryWidth(context, 1),
              height: getMediaQueryHeight(context, 0.60),
              child: loginContainer()),
          0.1,
          0.1)
    ])));
  }

  getOtpPageWidget() {
    return Column(children: [
      SizedBox(
        height: getMediaQueryWidth(context, 0.05),
      ),
      Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [_countryCodeWidget()]),
      Container(
        // margin: EdgeInsets.only(top: getMediaQueryHeight(context, 0)),
        padding: EdgeInsets.only(
            left: getMediaQueryWidth(context, 0.08),
            right: getMediaQueryWidth(context, 0.08)),
        child: Form(
          // key: loginController.numberTextFieldKey,
          child: _textFieldWidget(),
        ),
      ),
      SizedBox(
        height: getMediaQueryHeight(context, 0.06),
      ),
      ElevatedButton(
        style: ButtonStyle(
            animationDuration: const Duration(milliseconds: 100),
            // visualDensity: VisualDensity(vertical: 1,horizontal: 1),
            elevation: const MaterialStatePropertyAll<double>(5),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0))),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo)),
        onPressed: () {},
        // onPressed: () async {
        //   if (loginController.numberTextFieldKey.currentState!.validate()) {
        //     Utils.checkNetworkStatus().then((value) async {
        //       if (value) {
        //         loginController.sendOTP();
        //       } else {
        //         Utils.showAlertDialog(AppConstant.networkNotConnected);
        //       }
        //     });
        //   }
        // },
        child: const SizedBox(
            child: Text(
          'Generate OTP',
          style: TextStyle(fontSize: 20),
        )),
      )
    ]);
  }

  _countryCodeWidget() {
    return SizedBox(
      width: getMediaQueryWidth(context, 1.0),
      // height: getMediaQueryHeight(context, 0.04),
      child: CountryCodePicker(
        padding: EdgeInsets.only(left: getMediaQueryWidth(context, 0.04)),
        showOnlyCountryWhenClosed: false,
        showFlag: true,
        alignLeft: true,
        barrierColor: Colors.black38,
        // closeIcon: Icon(),
        flagWidth: 25,
        showCountryOnly: true,
        showDropDownButton: true,
        // dialogBackgroundColor: Colors.transparent,
        // onChanged: loginController.onCountryCodeChanged,
        initialSelection: 'US',
        countryFilter: ['IN', 'US'],
        textStyle: TextStyle(
            fontSize: getMediaQueryWidth(context, 0.04), color: Colors.black),
        dialogSize: Size(getMediaQueryWidth(context, 0.9),
            getMediaQueryHeight(context, 0.25)),
      ),
    );
  }

  _textFieldWidget() {
    return TextFormField(
        cursorColor: Colors.black,
        // controller: loginController.numberTextFieldController,
        validator: (String? value) {
          return getOtpPageWidget().validatePhone(value!);
        },
        autofocus: false,
        maxLines: 1,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        // textInputAction: TextInputAction.next,
        inputFormatters: [
          FilteringTextInputFormatter(RegExp("[0-9]"), allow: true),
          LengthLimitingTextInputFormatter(10),
        ],
        style: TextStyle(
            color: Colors.black, fontSize: getMediaQueryWidth(context, 0.041)),
        decoration: const InputDecoration(
          labelStyle: TextStyle(
            color: Colors.grey,
          ),
          hintStyle: TextStyle(color: Colors.grey),
          hintText: "enter mobile number",
          // contentPadding: EdgeInsets.only(bottom: getMediaQueryWidth(context, 0.5)
          // ),
        ));
  }

  verifyOtp() {
    return Container(
      child: Column(children: [
        Align(
            alignment: Alignment.topLeft,
            child:Padding(
          padding: EdgeInsets.only(left: getMediaQueryWidth(context, 0.07)),
          child: IconButton(
            icon: Icon(CupertinoIcons.chevron_left_circle,
                color: Colors.indigo[700],
                size: getMediaQueryHeight(context, 0.04)),
            onPressed: () {
              Get.back();
            },
          ),
        )),
        SizedBox(height: getMediaQueryHeight(context, 0.06),),
        RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 16, color: Colors.black87),
            children: <TextSpan>[
              TextSpan(
                  text:
                      "Enter the OTP sent ${Get.parameters["country_code"] ?? ""}"
                      "${Get.parameters["mobile_number"] ?? ""}to..Phone number",
                  style: const TextStyle(fontWeight: FontWeight.w500)),
              // TextSpan(text: data.exceptionMessage,),
            ],
          ),
        ),
        SizedBox(
          height: getMediaQueryHeight(context, 0.06),
        ),
        SizedBox(
            width: getMediaQueryWidth(context, 0.75),
            child: PinCodeTextField(
              enablePinAutofill: true,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              onChanged: (String value) {},
              onCompleted: (otp) {},
              appContext: this.context,
              length: 6,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.underline,
                activeColor: Colors.blue,
                inactiveColor: Colors.indigo,
                // selectedColor:
              ),
              textStyle: TextStyle(
                  fontSize: getMediaQueryWidth(context, 0.045),
                  fontWeight: FontWeight.normal),
            )),
        SizedBox(height: getMediaQueryHeight(context, 0.02)),
        ElevatedButton(
          style: ButtonStyle(
              animationDuration: const Duration(milliseconds: 100),
              // visualDensity: VisualDensity(vertical: 1,horizontal: 1),
              elevation: const MaterialStatePropertyAll<double>(5),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0))),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo)),
          onPressed: () {
            _nextPage();
          },
          child: const Text(
            'Login',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Column(
          children: [
            TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.indigo),
                ),
                child: const Text('Re-send verification code')),
            SizedBox(
                height: getMediaQueryHeight(context, 0.04),
                child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      splashFactory:
                          InkSparkle.constantTurbulenceSeedSplashFactory,
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.indigo),
                    ),
                    child: const Text('Re-enter mobile number'))),
          ],
        )
      ]),
    );
  }
}
