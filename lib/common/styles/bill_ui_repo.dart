import 'package:flutter/material.dart';
import 'package:foodtastic_four_admin/utils/constants/pages.dart';
import 'package:foodtastic_four_admin/utils/device/device_utility.dart';

class BillUiRepo extends StatelessWidget {
  const BillUiRepo({super.key});

  @override
  Widget build(BuildContext context) {
    var size = FDeviceUtility.getDeviceSize(context);
    return Container(
      height: size.height * 0.22,
      width: size.width * 0.95,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), border: Border.all(width: 1.5, color: FAppColor.fOrange)),
      alignment: Alignment.center,
      child: Row(children: [
        Container(
          height: size.height * 0.22,
          width: size.width * 0.25,
          decoration: const BoxDecoration(color: FAppColor.fOrange, borderRadius: BorderRadius.horizontal(left: Radius.circular(13))),
          alignment: Alignment.center,
          child: RotatedBox(quarterTurns: 3, child: Text('AR715', style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: FAppColor.fWhite, fontWeight: FontWeight.w700, letterSpacing: 1.5))),
        ),
        FAppSizes.spaceSm,
        // ticker order ID
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Order ID', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: FAppColor.fBlack.withOpacity(0.5))),
            FAppSizes.spaceXs,
            Text('4gf5f62f5626dfy5g7246gh674', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: FAppColor.fOrange, fontWeight: FontWeight.w600)),
            FAppSizes.spaceSm,
            // ordered food details
            Row(
              children: [
                Text('Order details', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: FAppColor.fBlack.withOpacity(0.5))),
                FAppSizes.space2Xl,
                Container(
                  decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(20)),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text('South Indian', style: Theme.of(context).textTheme.labelSmall?.copyWith(color: FAppColor.fWhite, fontWeight: FontWeight.w600)),
                  ),
                )
              ],
            ),
            FAppSizes.spaceXs,
            Text.rich(
              TextSpan(children: [
                TextSpan(text: 'Chicken Biryani', style: Theme.of(context).textTheme.labelLarge),
                TextSpan(text: '  x  ', style: Theme.of(context).textTheme.labelLarge),
                TextSpan(text: '  2    ', style: Theme.of(context).textTheme.labelLarge),
                TextSpan(text: '₹240', style: Theme.of(context).textTheme.labelLarge),
              ]),
            ),
            FAppSizes.spaceXl,
            // students details
            Text('Person details', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: FAppColor.fBlack.withOpacity(0.5))),
            FAppSizes.spaceXs,
            Text('Mohamed Ibrahim', style: Theme.of(context).textTheme.labelMedium),
            Text('ibrahimrasith@gmail.com', style: Theme.of(context).textTheme.labelMedium),
          ],),
        ),
      ],),
    );
  }
}
