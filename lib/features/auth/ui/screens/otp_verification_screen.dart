import 'dart:async';

import 'package:ecommerce_app/app/app_colors.dart';
import 'package:ecommerce_app/app/app_constants.dart';
import 'package:ecommerce_app/features/auth/ui/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:get/get.dart';

import 'complete_profile_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  static const String name = '/otp-verification';

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RxInt _remainingCountdown = AppConstants.resendOtpTimeOutInSecs.obs;
  final RxBool _canResend = false.obs;
  late Timer _timer;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_remainingCountdown.value > 0) {
        _remainingCountdown.value--;
      } else {
        _canResend.value = true;
        t.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                const AppLogoWidget(
                  width: 90,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text('Enter OTP Code',
                    style: Theme.of(context).textTheme.titleLarge),
                //const SizedBox(height: 5),
                Text(
                  'A 4 Digit OTP has been sent to your email',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey,
                      ),
                ),
                const SizedBox(height: 24),
                PinCodeTextField(
                  controller: _otpTEController,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    // fieldHeight: 50,
                    // fieldWidth: 40,
                    activeFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    selectedColor: Colors.green,
                    inactiveColor: AppColors.themeColor,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  appContext: context,
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    //if (_formKey.currentState!.validate()) {}
                    Navigator.pushNamed(context, CompleteProfileScreen.name);
                  },
                  child: const Text('Next'),
                ),
                const SizedBox(
                  height: 24,
                ),

                Obx(
                  () => Visibility(
                    visible: !_canResend.value,
                    child: RichText(
                      text: TextSpan(
                        text: 'This code will expire in ',
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                        children: [
                          TextSpan(
                            text: '$_remainingCountdown\s',
                            style: const TextStyle(
                              color: AppColors.themeColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Obx(
                  () => Visibility(
                    visible: _canResend.value,
                    child: TextButton(
                      onPressed: _canResend.value
                          ? () {
                              setState(() {
                                _remainingCountdown.value = AppConstants.resendOtpTimeOutInSecs;
                                _canResend.value = false;
                                startTimer();
                                // the api calling might happen here in future
                              });
                            }
                          : null,
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.themeColor,
                      ),
                      child: const Text('Resend Code'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
