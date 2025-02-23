import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hwee_tawseel_driver/components/app_button.dart';
import 'package:hwee_tawseel_driver/components/app_colors.dart';
import 'package:hwee_tawseel_driver/components/app_text_styles.dart';
import 'package:hwee_tawseel_driver/generated/assets.dart';
import 'package:hwee_tawseel_driver/views/auth/edit_location_view.dart';
import 'package:hwee_tawseel_driver/views/auth/widgets/app_bar_from_auth.dart';
import 'package:image_picker/image_picker.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  XFile? _profileImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _profileImage = image;
    });
  }

  Widget _buildUploadCard(String title) {
    return Container(
      width: 260,
      height: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              title,
              style: AppTextStyles.style14W400(context).copyWith(
                color: AppColors.border,
                fontFamily: 'Noto Kufi Arabic',
              ),
            ),
            Spacer(), SvgPicture.asset(
              Assets.imagesPhoto,
              width: 32,
              height: 32,
            ),
            TextButton(
              onPressed: _pickImage,
              child: Text(
                "قم بإدراج الصورة هنا",
                style: AppTextStyles.style12W500(context).copyWith(
                  color: AppColors.accentColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: appBarFromAuth(context),
      body: Column(
        children: [
          SizedBox(
            height: 16,
          ),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    Assets.imagesShap1,
                  ),
                  Image.asset(
                    Assets.imagesShap2,
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 65,
                    backgroundColor: AppColors.border.withOpacity(0.5),
                    backgroundImage: _profileImage != null
                        ? FileImage(_profileImage as dynamic)
                        : null,
                    child: _profileImage == null
                        ? Icon(Icons.person, color: AppColors.black, size: 40)
                        : null,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: AppColors.white,
                      border: Border.all(
                        width: 1,
                        color: AppColors.border,
                      ),
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 40),
          _buildUploadCard("أدخل صورة رخصة السيارة"),
          _buildUploadCard("أدخل صورة رخصة القيادة"),
          SizedBox(height: 40),
          AppButton(text: "التالي", onPressed: () {
            Navigator.push(

              context,
              MaterialPageRoute(
                builder: (context) =>  EditLocationView(),
              ),
            );
          },

          ),
        ],
      ),
    );
  }
}
