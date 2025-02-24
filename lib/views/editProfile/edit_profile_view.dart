import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hwee_tawseel_driver/components/app_button.dart';
import 'package:hwee_tawseel_driver/components/app_colors.dart';
import 'package:hwee_tawseel_driver/components/app_form_filed.dart';
import 'package:hwee_tawseel_driver/components/app_text_styles.dart';
import 'package:hwee_tawseel_driver/generated/assets.dart';
import 'package:hwee_tawseel_driver/views/auth/widgets/app_bar_from_auth.dart';
import 'package:hwee_tawseel_driver/views/editProfile/edit_data.dart';
import 'package:hwee_tawseel_driver/views/editProfile/edit_location_view.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final TextEditingController nameController =
      TextEditingController(text: "محمد علي");
  final TextEditingController phoneController =
      TextEditingController(text: "+20 0108376546221");
  final TextEditingController locationController =
      TextEditingController(text: "المملكة العربية السعودية - الرياض");
  final TextEditingController oldPasswordController =
      TextEditingController(text: "111111");
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarFromAuth(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            children: [
              const Text(
                "تعديل بيانات الحساب",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              AppInputTextFormField(
                labelText: "الاسم:",
                controller: nameController,
                keyboardType: TextInputType.name,
              ),
              InkWell(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    18,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditLocationView(),
                    ),
                  );
                },
                child: IgnorePointer(
                  ignoring: true, // يمنع التفاعل
                  child: AppInputTextFormField(
                    labelText: "الموقع:",
                    controller: locationController,
                    keyboardType: TextInputType.phone,
                  ),
                ),
              ),
              AppInputTextFormField(
                labelText: "رقم الهاتف:",
                controller: phoneController,
                keyboardType: TextInputType.phone,
              ),
              AppPassInputTextFormField(
                labelText: "كلمة المرور السابقة:",
                controller: oldPasswordController,
              ),
              AppPassInputTextFormField(
                labelText: "كلمة المرور الجديدة:",
                controller: newPasswordController,
              ),
              AppPassInputTextFormField(
                labelText: "تأكيد كلمة المرور:",
                controller: confirmPasswordController,
              ),
              const SizedBox(height: 50),
              AppButton(text: "التالي", onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditDataView(),
                  ),
                );
              }),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
