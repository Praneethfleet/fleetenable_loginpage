import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:simple_icons/simple_icons.dart';

import 'base_route.dart';
import 'otp_view/tab_bar_wedget.dart';

// import 'base_route.dart';
//
// class MyPage extends StatelessWidget {
//   const MyPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Page'),
//       ),
//       body: Center(
//         child: Image.asset(
//         '/home/vpraneeth/Downloads/imaginnovate/fleet_truck.png', // Replace with your image file path
//           width: 420,
//           height: 500,
//           fit: BoxFit.cover,
//           alignment: Alignment.topCenter,// Adjust the fit as per your requirements
//         ),
//       ),
//     );
//   }
// }

class LoginImage extends StatefulWidget {
  const LoginImage({super.key});

  @override
  State<LoginImage> createState() => _LoginImageState();
}

class _LoginImageState extends BaseRoute<LoginImage> {
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
        icon: const Icon(CupertinoIcons.chevron_left_circle, color: Colors.indigo),
        onPressed: () {
          Get.back();
        },
      ),
    ],
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Stack(children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight:
                      Radius.circular(getMediaQueryWidth(context, 0.25))),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade600,
                  spreadRadius: 0.5,
                  blurRadius: 90,
                  offset: const Offset(0, 5),
                ),
              ]),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                bottomRight:
                    Radius.circular(getMediaQueryWidth(context, 0.20))),
            child: Image.asset(
              'lib/images/fleet_truck.png',
              // Replace with your image file path
              width: getMediaQueryWidth(context, 1.0),
              height: getMediaQueryHeight(context, 0.5),
              fit: BoxFit.cover,
              alignment: Alignment
                  .topCenter, // Adjust the fit as per your requirements
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: getMediaQueryWidth(context, 0.67),top: getMediaQueryHeight(context, 0.040)),
            child:SizedBox(
            child:Row(
          children: [
            Image.asset('lib/images/splash_logo.png',width: getMediaQueryWidth(context, 0.04)),
            SizedBox(
              width: getMediaQueryWidth(context, 0.01),
            ),
            Image.asset('lib/images/logo.png',color: Colors.white60,width:getMediaQueryWidth(context, 0.25),)
          ],
            ))),
        Container(
          height: getMediaQueryHeight(context, 0.3),
          padding: const EdgeInsets.only(top: 70, left: 20),
          child: Text("Status".capitalize ?? "",
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: getMediaQueryWidth(context, 0.13))),
        )
      ]),
      SizedBox(
        height: getMediaQueryHeight(context, 0.03),
      ),
      Expanded(
        child: SingleChildScrollView(
            child: Container(
          width: getMediaQueryWidth(context, 1.0),
          decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(getMediaQueryWidth(context, 0.20))),
          ),
          child: Container(
              child: SizedBox(
            width: getMediaQueryWidth(context, 1),
            height: getMediaQueryHeight(context, 0.47),
            child: MyTabbedWidget(
                getOtpWidget: getOtpPageWidget(), verifyOtpWidget: verifyOtp()),
          )),
        )),
      ),
    ]));
  }

  verifyOtp() {
    return Container(
      // color: Colors.white,
      child: Column(children: [
        // SizedBox(height: getMediaQueryHeight(context,0.002),),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          backButton,
          SizedBox(width: getMediaQueryWidth(context, 0.07)),
          Text(
            "Enter the OTP sent ${Get.parameters["country_code"] ?? ""} "
            "${Get.parameters["mobile_number"] ?? ""}to..Phone number",
            textAlign: TextAlign.start,
            style: TextStyle(
              // decoration: TextDecoration.underline,
              color: Colors.indigo,
              fontWeight: FontWeight.w500,
              textBaseline: TextBaseline.alphabetic,
              fontSize: getMediaQueryWidth(context, 0.037),
            ),
          )
        ]),
        SizedBox(
            width: getMediaQueryWidth(context, 0.7),
            child: PinCodeTextField(
              enablePinAutofill: true,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
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
        ElevatedButton(
          style: ButtonStyle(
              animationDuration: Duration(milliseconds: 100),
              // visualDensity: VisualDensity(vertical: 1,horizontal: 1),
              elevation: MaterialStatePropertyAll<double>(5),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0))),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo)),
          onPressed: () {
            _nextPage();
          },
          child: Text('Login'),
        ),

        Column(
          children: [
            TextButton(
                onPressed: () {},
                child: const Text('Re-send verification code'),
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.indigo),
                )),
            SizedBox(
                height: getMediaQueryHeight(context, 0.04),
                child: TextButton(
                    onPressed: () {},
                    child: const Text('Re-enter mobile number'),
                    style: ButtonStyle(
                      splashFactory:
                          InkSparkle.constantTurbulenceSeedSplashFactory,
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.indigo),
                    ))),
          ],
        )
      ]),
    );
  }

  getOtpPageWidget() {
    return Column(
      children: [
        SizedBox(
          height: getMediaQueryWidth(context, 0.03),
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
          height: getMediaQueryHeight(context, 0.040),
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
          onPressed: () => otpVerifyPageWidget(),
          child: const Text('Generate OTP'),
        ),
      ],
    );
  }

  _countryCodeWidget() {
    return Container(
      width: getMediaQueryWidth(context, 0.45),
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
          // return loginController.validatePhone(value!);
        },
        autofocus: false,
        maxLines: 1,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        textInputAction: TextInputAction.next,
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

  otpVerifyPageWidget() {
    return Padding(
      padding: EdgeInsets.all(getMediaQueryHeight(context, 0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: getMediaQueryWidth(context, 0.10),
            width: getMediaQueryWidth(context, 0.40),
          ),
          Container(
            // margin: EdgeInsets.only(top: getMediaQueryHeight(context, 0)),
            padding: EdgeInsets.only(
                left: getMediaQueryWidth(context, 0.08),
                right: getMediaQueryWidth(context, 0.08)),
            // child: Form(
            //   // key: loginController.numberTextFieldKey,
            //   child: _textFieldWidget(),
            // ),
          ),
          SizedBox(
            height: getMediaQueryHeight(context, 0.040),
          ),
          Container(
            padding: EdgeInsets.only(left: getMediaQueryWidth(context, 0.35)),
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.all(Radius.circular(getMediaQueryWidth(context, 0.05)))
            // ),
            margin: EdgeInsets.only(top: getMediaQueryHeight(context, 0)),
            child: ElevatedButton(
              style: ButtonStyle(
                animationDuration: Duration(milliseconds: 100),
                // visualDensity: VisualDensity(vertical: 1,horizontal: 1),
                elevation: MaterialStatePropertyAll<double>(5),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0))),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {
                _nextPage();
              },
              child: Text('Login'),
            ),
          ),
        ],
      ),
    );
  }

// Widget widgetOtpVerify(){
//   return Stack(
//     children: <Widget>[
//       Positioned(
//         left: getMediaQueryWidth(context, 0.06),
//         child: Align(
//             alignment: Alignment.topLeft,
//             child: Row(
//               children: [
//                 IconButton(
//                   icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: getMediaQueryWidth(context, 0.07),),
//                   onPressed: () {
//                     Get.back();
//                   },
//                 ),
//                 Text(
//                   "Verification Code",
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.normal,
//                     textBaseline: TextBaseline.alphabetic,
//                     fontSize: getMediaQueryWidth(context, 0.05),
//                   ),
//                 )
//               ],
//             )
//         ),
//       ),
//       Positioned(
//         top: getMediaQueryHeight(context, 0.12),
//         right: getMediaQueryWidth(context, 0.15),
//         left: getMediaQueryWidth(context, 0.15),
//         bottom: getMediaQueryWidth(context, 0.15),
//         // child: Align(
//         //     alignment: Alignment.topCenter,
//             child: Text(
//               "OTP has been sent to ${Get.parameters["country_code"] ?? ""} "
//                   "${Get.parameters["mobile_number"] ?? ""} via text message",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 decoration: TextDecoration.none,
//                 color: Colors.black,
//                 fontWeight: FontWeight.w500,
//                 textBaseline: TextBaseline.alphabetic,
//                 fontSize: getMediaQueryWidth(context, 0.037),
//               ),
//             )
//         ),
//
//       Positioned(
//         top: getMediaQueryHeight(context, 0.17),
//         right: getMediaQueryWidth(context, 0.03),
//         left: getMediaQueryWidth(context, 0.03),
//         bottom: 15,
//          child: null,
//       ),
//       Positioned(
//         child: Container(
//           margin: EdgeInsets.only(bottom: getMediaQueryHeight(context, 0.03)),
//           alignment: Alignment.bottomCenter,
//           // child:_widgetBottom(),
//         ),
//       )
//     ],
//   );
// }

// Widget _buildPinEnterTextField(){
//   return Padding(
//     padding: EdgeInsets.only(top: 20, left: 10, right: 10),
//     child: Column(
//       children: <Widget>[
//         Theme(
//           data: ThemeData(primaryColor: Color(0xFF0D5589), primarySwatch: Colors.blueGrey),
//             child: PinCodeTextField(
//             enablePinAutofill: true,
//             keyboardType: TextInputType.numberWithOptions(decimal: true),
//             onChanged: (String value) {  },
//             onCompleted: (otp) {
//               // otpController.otpNumber = otp;
//               // otpController.verifyOtp();
//             },
//             appContext: this.context,
//             length: 6,
//             // pinTheme: PinTheme(
//                 // shape: PinCodeFieldShape.underline,
//                 activeColor: Colors.grey,
//                 inactiveColor: Colors.grey,
//                 // selectedColor: Utils.hexColor(AppColor.appPrimaryColor)
//             ),
//             textStyle: TextStyle(fontSize: getMediaQueryWidth(context, 0.045), fontWeight: FontWeight.normal),
//           ),
//         ),
//         SizedBox(height: 10),
//         Align(
//             alignment: Alignment.bottomRight,
//             // child: Obx(() => Text('00:${otpController.isBelow10Sec.value ?
//             // '0'+otpController.start.value.toString():
//             // otpController.start.value.toString()}',style: TextStyle(color: Colors.grey,)),)
//         )
//       ],
//     ),
//   );
// }
}
