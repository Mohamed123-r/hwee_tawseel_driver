import 'package:flutter/material.dart';
import 'package:hwee_tawseel_driver/components/app_button.dart';
import 'package:hwee_tawseel_driver/components/app_form_filed.dart';
import 'package:hwee_tawseel_driver/components/app_alert_dialog.dart';

import '../../../components/app_colors.dart';
import '../../../components/app_text_styles.dart';
import 'widgets/app_bar_from_auth.dart';
import 'widgets/pinput.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  int step =
      1; // To track the steps (1: Enter Email, 2: Enter Code, 3: Change Password)
  final TextEditingController emailController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'يرجى إدخال رقم الهاتف';
    } else if (!RegExp(r"^[0-9]{10}$").hasMatch(value)) {
      return 'يرجى إدخال رقم هاتف صالح';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'يرجى إدخال كلمة المرور';
    } else if (value.length < 6) {
      return 'يجب أن تكون كلمة المرور على الأقل 6 أحرف';
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'يرجى تأكيد كلمة المرور';
    } else if (value != passwordController.text) {
      return 'كلمتا المرور غير متطابقتين';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: appBarFromAuth(context),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Text(
              "إعادة تعيين كلمة المرور",
              style: AppTextStyles.style16W400(context)
                  .copyWith(color: AppColors.accentColor),
            ),
            const SizedBox(height: 5),
            Divider(
              indent: 150,
              endIndent: 150,
            ),
            const SizedBox(height: 40),
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (step == 1) ...[
                          Text('قم بإدخال رقم الهاتف',
                              style: AppTextStyles.style12W500(context)),
                          const SizedBox(height: 24),
                          AppInputTextFormField(
                            labelText: 'رقم الهاتف',
                            suffixIcon: Icon(Icons.phone_outlined),
                            keyboardType: TextInputType.phone,
                            // validator: validatePhone,
                            controller: emailController,
                          ),
                        ],
                        if (step == 2) ...[
                          Text('تم إرسال رقم تأكيد للحساب علي رقم الهاتف',
                              style: AppTextStyles.style12W500(context)),
                          const SizedBox(height: 24),
                          PinInputStyles.buildPinInput(
                            onCompleted: (pin) {
                              print("User entered PIN: $pin");
                            },
                          ),
                          SizedBox(height: 12),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgetPasswordView(),
                                ),
                              );
                            },
                            child: Text("إعادة إرسال الكود !",
                                style:
                                    AppTextStyles.style10W700(context).copyWith(
                                  color: AppColors.accentColor,
                                  fontFamily: "Noto Kufi Arabic",
                                  decoration: TextDecoration.underline,
                                )),
                          ),
                        ],
                        if (step == 3) ...[
                          Text('قم بإدخال كلمة المرور الجديدة',
                              style: AppTextStyles.style12W500(context)),
                          const SizedBox(height: 24),
                          AppPassInputTextFormField(
                            labelText: "كلمة المرور",
                            controller: passwordController,
                           // validator: validatePassword,
                          ),
                          const SizedBox(height: 24),
                          AppPassInputTextFormField(
                            labelText: "كلمة المرور",
                            controller: confirmPasswordController,
                           // validator: validateConfirmPassword,
                          ),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  AppButton(
                    text: 'التالي',
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        setState(() {
                          if (step == 1) {
                            step = 2;
                          } else if (step == 2) {
                            step = 3;
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) => AppAlertDialog(
                                title: 'تمت العملية بنجاح'
                                , isSuccess: true,
                              ),
                            );
                          }
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
