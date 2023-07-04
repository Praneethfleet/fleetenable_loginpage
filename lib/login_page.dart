import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:login_app/slide_animtion.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'base_route.dart';
import 'tab_bar_widget.dart';

class LoginImage extends StatefulWidget {
  const LoginImage({super.key});

  @override
  State<LoginImage> createState() => _LoginImageState();
}

class _LoginImageState extends BaseRoute<LoginImage> {
  late PageController _pageController;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Listener(
        onPointerDown: (_) {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.focusedChild?.unfocus();
          }
        },
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            SlideToast(imageWidget(), x: -0.2, y: -0.2),
            SizedBox(
              height: getMediaQueryHeight(context, 0.04),
            ),
            Flexible(child: SlideToast(loginContainer(), x: 0.1, y: 0.1))
          ],
        ),
      ),
    );
  }

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

      Container(
        height: getMediaQueryHeight(context, 0.3),
        padding: const EdgeInsets.only(top: 40, left: 15),
        child: Text("login".capitalize ?? "",
            style: const TextStyle(
                color: Colors.white60,
                fontSize: 30,
                fontWeight: FontWeight.w400)),
      )
    ]);
  }

  Widget loginContainer() {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white60,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              getMediaQueryWidth(context, 0.15),
            ),
          ),
        ),
        child: MyTabbedWidget(
            getOtpWidget: getOtpTab(), verifyOtpWidget: verifyOtpTab()));
  }

  getOtpTab() {
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(
          height: getMediaQueryWidth(context, 0.17),
        ),
        SizedBox(
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
            countryFilter: const ['IN', 'US'],
            textStyle: TextStyle(
                fontSize: getMediaQueryWidth(context, 0.04),
                color: Colors.black),
            dialogSize: Size(getMediaQueryWidth(context, 0.9),
                getMediaQueryHeight(context, 0.30)),
            // dialogTextStyle: TextStyle(fontSize: 20),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
              left: getMediaQueryWidth(context, 0.08),
              right: getMediaQueryWidth(context, 0.08)),
          child: Form(
            // key: loginController.numberTextFieldKey,
            child: TextFormField(
                cursorColor: Colors.black,
                // controller: loginController.numberTextFieldController,
                validator: (String? value) {
                  return getOtpTab().validatePhone(value!);
                },
                autofocus: false,
                maxLines: 1,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                // textInputAction: TextInputAction.next,
                inputFormatters: [
                  FilteringTextInputFormatter(RegExp("[0-9]"), allow: true),
                  LengthLimitingTextInputFormatter(10),
                ],
                style: TextStyle(
                    color: Colors.black,
                    fontSize: getMediaQueryWidth(context, 0.041)),
                decoration: const InputDecoration(
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  hintStyle: TextStyle(color: Colors.grey),
                  hintText: "enter mobile number",
                  // contentPadding: EdgeInsets.only(bottom: getMediaQueryWidth(context, 0.5)
                  // ),
                )),
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
            style: TextStyle(fontSize: 17),
          )),
        )
      ]),
    );
  }

  verifyOtpTab() {
    return SingleChildScrollView(
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          height: getMediaQueryHeight(context, 0.03),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(left: getMediaQueryWidth(context, 0.05)),
            child: TextButton(
                onPressed: () {},
                child: RichText(text: TextSpan(
                  children: [
                    WidgetSpan(child: Icon(CupertinoIcons.chevron_left_circle,
                            color: Colors.indigo,
                            size: getMediaQueryHeight(context, 0.04),
                    ),
                      alignment: PlaceholderAlignment.middle
                    ),

                    const TextSpan(text: " Go back",
                      style: TextStyle(color: Colors.indigo),)
                  ],
                ),
                )
            ),
          ),
        ),

        // Row(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     Icon(CupertinoIcons.chevron_left_circle,
        //         color: Colors.indigo,
        //         size: getMediaQueryHeight(context, 0.04)),
        //     SizedBox(
        //       width: getMediaQueryWidth(context, 0.01),
        //     ),
        //     const Text(
        //       "Go back",
        //       style: TextStyle(color: Colors.indigo, fontSize: 17),
        //     )
        //   ],
        // ),
        SizedBox(
          height: getMediaQueryHeight(context, 0.01),
        ),
        RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 13, color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                  text:
                      "Enter the OTP sent ${Get.parameters["country_code"] ?? ""}"
                      "${Get.parameters["mobile_number"] ?? ""}to ",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  children: const <TextSpan>[
                    TextSpan(
                        text: '"+1 9182371283"',
                        style: TextStyle(fontWeight: FontWeight.w500))
                  ]),
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
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onChanged: (String value) {},
              onCompleted: (otp) {},
              appContext: context,
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
          onPressed: () {},
          child: const Text(
            'Login',
            style: TextStyle(fontSize: 17),
          ),
        ),
        TextButton(
            onPressed: () {},
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.indigo),
            ),
            child: const Text(
              'Re-send verification code',
              style: TextStyle(
                fontSize: 15,
                // decoration: TextDecoration.underline,decorationThickness: 0.5,decorationColor: Colors.indigoAccent
              ),
            )),
        TextButton(
            onPressed: () {},
            style: ButtonStyle(
              splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
              foregroundColor: MaterialStateProperty.all<Color>(Colors.indigo),
            ),
            child: const Text('Re-enter mobile number',
                style: TextStyle(fontSize: 15)))
      ]),
    );
  }
}


