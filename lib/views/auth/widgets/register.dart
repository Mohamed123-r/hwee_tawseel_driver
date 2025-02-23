import 'package:flutter/material.dart';
import 'package:hwee_tawseel_driver/components/app_button.dart';
import 'package:hwee_tawseel_driver/components/app_form_filed.dart';

import '../../../components/app_text_styles.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> formstate = GlobalKey();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formstate,
      autovalidateMode: _autovalidateMode,
      child: Column(
        children: [
          Text(
            "ادخل بياناتك لتبدأ",
            style: AppTextStyles.style16W400(context),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: AppInputTextFormField(
                  labelText: "الاسم الثاني",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'هذا الحقل مطلوب';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _autovalidateMode = AutovalidateMode.disabled;
                    });
                  },
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: AppInputTextFormField(
                  labelText: "الاسم الأول",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'هذا الحقل مطلوب';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _autovalidateMode = AutovalidateMode.disabled;
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          AppInputTextFormField(
            labelText: "رقم الهاتف",
            keyboardType: TextInputType.phone,
            suffixIcon: Icon(Icons.phone_outlined),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'هذا الحقل مطلوب';
              } else if (value.length != 11) {
                return 'رقم الهاتف يجب أن يتكون من 11 رقم';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                _autovalidateMode = AutovalidateMode.disabled;
              });
            },
          ),
          SizedBox(height: 16),
          AppPassInputTextFormField(
            controller: passwordController,
            labelText: "كلمة المرور",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'هذا الحقل مطلوب';
              } else if (value.length < 6) {
                return 'كلمة السر يجب أن تكون على الأقل 6 أحرف';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                _autovalidateMode = AutovalidateMode.disabled;
              });
            },
          ),
          SizedBox(height: 16),
          AppPassInputTextFormField(
            controller: confirmPasswordController,
            labelText: "تأكيد كلمة المرور",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'هذا الحقل مطلوب';
              } else if (value != passwordController.text) {
                return 'كلمة المرور غير متطابقة';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                _autovalidateMode = AutovalidateMode.disabled;
              });
            },
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 30,
          ),
          AppButton(
            text: 'إنشاء الحساب',
            onPressed: () {
              if (formstate.currentState!.validate()) {
                setState(() {
                  _autovalidateMode = AutovalidateMode.always;
                });
                // بعد التحقق من صحة البيانات يمكن إجراء أي عملية (مثل التسجيل)
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
