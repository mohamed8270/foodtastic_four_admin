import 'package:flutter/material.dart';
import 'package:foodtastic_four_admin/utils/constants/pages.dart';
import 'package:foodtastic_four_admin/utils/device/device_utility.dart';

class CustomToggleBtn extends StatelessWidget {
  const CustomToggleBtn({super.key, required this.title, required this.img, this.isSelected = false, required this.tap});

  final String title;
  final String img;
  final bool isSelected;
  final VoidCallback tap;

  @override
  Widget build(BuildContext context) {
    var size = FDeviceUtility.getDeviceSize(context);
    return GestureDetector(
      onTap: tap,
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Container(
          height: size.height * 0.065,
          decoration: BoxDecoration(color: isSelected ? FAppColor.fGreen : FAppColor.fGrey, borderRadius: BorderRadius.circular(30)),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
            child: Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(height: 35, width: 35, child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.asset(img, fit: BoxFit.cover, filterQuality: FilterQuality.high,),),),
              FAppSizes.spaceXs,
              Text(title, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: isSelected ? FAppColor.fWhite : FAppColor.fBlack))
            ],),
          ),
        ),
      ),
    );
  }
}
