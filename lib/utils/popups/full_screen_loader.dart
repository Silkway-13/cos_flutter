// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:cos_work_store/utils/constants/colors.dart';

// class CosFullScreenLoader {
//   static void openLoadingDialog(String message, String imagePath) {
//     if (Get.context != null) {
//       showDialog(
//         context: Get.context!,
//         barrierDismissible: false,
//         builder: (BuildContext context) {
//           return WillPopScope(
//             onWillPop: () async => false,
//             child: Dialog(
//               backgroundColor: Colors.transparent,
//               child: SingleChildScrollView(
//                 child: Container(
//                   padding: const EdgeInsets.all(20.0),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Image.asset(imagePath, height: 150.0),
//                       const SizedBox(height: 20.0),
//                       Text(
//                         message,
//                         style: const TextStyle(
//                           color: CosColors.primary,
//                           fontSize: 16.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                       const SizedBox(height: 20.0),
//                       const CircularProgressIndicator(),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       );
//     }
//   }

//   static stopLoading() {
//     Navigator.of(Get.overlayContext!).pop();
//   }
// }

import 'package:cos_work_store/utils/constants/colors.dart';
import 'package:cos_work_store/utils/helpers/helper_functions.dart';
import 'package:cos_work_store/common/widgets/loaders/animation_loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CosFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: CosHelperFunctions.isDarkMode(Get.context!)
              ? CosColors.dark
              : CosColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: SingleChildScrollView(
              // Make the content scrollable
              child: Column(
                mainAxisSize: MainAxisSize
                    .min, // Ensure Column takes only necessary space
                children: [
                  const SizedBox(
                    height: 250,
                  ),
                  CosAnimationLoaderWidget(text: text, animation: animation),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
