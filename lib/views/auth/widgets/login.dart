import 'package:flutter/material.dart';
import 'package:hwee_tawseel_driver/components/app_button.dart';
import 'package:hwee_tawseel_driver/components/app_colors.dart';
import 'package:hwee_tawseel_driver/components/app_form_filed.dart';
import 'package:hwee_tawseel_driver/components/app_text_styles.dart';

import '../forget_password_view.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: Column(
        children: [
          SizedBox(height: 12),
          Text(
            "ادخل بياناتك لتبدأ",
            style: AppTextStyles.style16W400(context),
          ),
          SizedBox(height: 20),
          AppInputTextFormField(
            labelText: "رقم الهاتف",
            keyboardType: TextInputType.phone,
            suffixIcon: Icon(Icons.phone_outlined),
            onChanged: (value) {
              setState(() {
                _autovalidateMode = AutovalidateMode.disabled;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'هذا الحقل مطلوب';
              } else if (value.length != 11) {
                return 'رقم الهاتف يجب أن يتكون من 11 رقم';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          AppPassInputTextFormField(
            labelText: "كلمة المرور",
            onChanged: (value) {
              setState(() {
                _autovalidateMode = AutovalidateMode.disabled;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'هذا الحقل مطلوب';
              } else if (value.length < 6) {
                return 'كلمة السر يجب أن تكون على الأقل 6 أحرف';
              }
              return null;
            },
          ),
          SizedBox(height: 12),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ForgetPasswordView(),
                ),
              );
            },
            child: Text("هل نسيت كلمة المرور؟",
                style: AppTextStyles.style10W700(context).copyWith(
                  color: AppColors.accentColor,
                  fontFamily: "Noto Kufi Arabic",
                  decoration: TextDecoration.underline,
                )),
          ),
          SizedBox(
            height: 30,
          ),
          AppButton(
            text: "تسجيل الدخول",
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                setState(() {
                  _autovalidateMode = AutovalidateMode.always;
                });
              } else {
                setState(() {
                  _autovalidateMode = AutovalidateMode.always;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
