import 'package:flutter/material.dart';
import 'package:foodtastic_four_admin/utils/constants/pages.dart';
import 'package:foodtastic_four_admin/utils/device/device_utility.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = FDeviceUtility.getDeviceSize(context);
    FDeviceUtility.setStatusBarColor(FAppColor.fWhite, Brightness.dark);
    return Scaffold(
      body: Center(child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 250, width: 250, child: Image(image: AssetImage(FAppImg.noddlesImg), fit: BoxFit.contain,),),
          FAppSizes.spaceMd,
          Text(FAppText.onBoardingH1, style: Theme.of(context).textTheme.headlineSmall),
          FAppSizes.spaceSm,
          Text(FAppText.onBoardingP, style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w400), textAlign: TextAlign.center),
          FAppSizes.space2Xl,
          GestureDetector(
            onTap: () => context.go('/signup'),
            child: Container(height: size.height * 0.065, width: size.width * 0.85, decoration: BoxDecoration(color: FAppColor.fGreen, borderRadius: BorderRadius.circular(40)),
              alignment: Alignment.center,
              child: Text(FAppText.onBoardingBtn, style: Theme.of(context).textTheme.labelLarge?.copyWith(color: FAppColor.fWhite)),
            ),
          )
        ],
      ),),
    );
  }
}
