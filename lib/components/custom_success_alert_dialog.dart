// import 'package:confetti/confetti.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
//
// import 'app_text_styles.dart';
// import 'custom_button.dart';
// import '../generated/assets.dart';
//
// class CustomSuccessAlertDialog extends StatefulWidget {
//   const CustomSuccessAlertDialog({
//     super.key,
//     required this.title,
//   });
//
//   final String title;
//
//   @override
//   State<CustomSuccessAlertDialog> createState() => _SaveState();
// }
//
// class _SaveState extends State<CustomSuccessAlertDialog> {
//   late ConfettiController _confettiController;
//
//   @override
//   void initState() {
//     super.initState();
//     _confettiController =
//         ConfettiController(duration: const Duration(seconds: 2));
//   }
//
//   @override
//   void dispose() {
//     _confettiController.dispose();
//     super.dispose();
//   }
//
//   void showConfetti() {
//     _confettiController.play();
//     Navigator:
//     () => Navigator.pop(context); // تشغيل تأثير القصاصات
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     showConfetti();
//
//     return AlertDialog(
//       backgroundColor: Colors.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
//       title: Align(
//         alignment: Alignment.topLeft,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             GestureDetector(
//                 onTap: () => Navigator.pop(context),
//                 child: SvgPicture.asset(Assets.imagesRejected)),
//           ],
//         ),
//       ),
//       titlePadding: EdgeInsetsDirectional.all(16),
//       content: SizedBox(
//         height: MediaQuery.of(context).size.height / 3.5,
//         width: MediaQuery.of(context).size.width / 3.5,
//         child: Column(
//           children: [
//             SizedBox(
//               height: MediaQuery.of(context).size.height / 20,
//             ),
//             Text(
//               widget.title,
//               style: AppTextStyles.style16W500(context),
//             ),
//             SizedBox(height: MediaQuery.of(context).size.height / 25),
//             Padding(
//               padding: EdgeInsets.symmetric(
//                   horizontal: MediaQuery.of(context).size.height / 6),
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   CustomButton(
//                     text: "Ok",
//                     onPressed: showConfetti,
//                   ),
//                   ConfettiWidget(
//                     confettiController: _confettiController,
//                     blastDirectionality: BlastDirectionality.explosive,
//                     shouldLoop: true,
//                     colors: [
//                       Colors.red,
//                       Colors.blue,
//                       Colors.green,
//                       Colors.yellow,
//                       Colors.orange,
//                     ],
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
