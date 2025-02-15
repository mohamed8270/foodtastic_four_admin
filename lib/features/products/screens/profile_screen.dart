import 'package:flutter/material.dart';
import 'package:foodtastic_four_admin/utils/constants/pages.dart';
import 'package:foodtastic_four_admin/utils/device/device_utility.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = FDeviceUtility.getDeviceSize(context);
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 260, width: 260, child: Image.asset(FAppImg.saladImg, fit: BoxFit.cover, filterQuality: FilterQuality.high,),),
            Text('Mohamed Ibrahim', style: Theme.of(context).textTheme.headlineSmall),
            FAppSizes.spaceXs,
            Text('ibrahimrasith@gmail.com', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: FAppColor.fBlack.withOpacity(0.5))),
            FAppSizes.spaceMd,
            GestureDetector(
              onTap: () {},
              child: Container(height: size.height * 0.06, width: size.width * 0.8,
              decoration: BoxDecoration(color: FAppColor.fGreen, borderRadius: BorderRadius.circular(40)),
                alignment: Alignment.center,
                child: Text(FAppText.logOutTxt, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: FAppColor.fWhite),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
