import 'package:cos_work_store/bindings/general_bindings.dart';
import 'package:cos_work_store/utils/constants/colors.dart';
import 'package:cos_work_store/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "COS CONSTRUCTOR ORDER SYSTEM",
      themeMode: ThemeMode.system,
      theme: CosAppTheme.lightTheme,
      darkTheme: CosAppTheme.darkTheme,
      initialBinding: GeneralBindings(),

      /// show loader
      home: const Scaffold(
        backgroundColor: CosColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
