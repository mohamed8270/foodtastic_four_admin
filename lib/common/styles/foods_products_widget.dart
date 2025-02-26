import 'package:flutter/material.dart';
import 'package:foodtastic_four_admin/utils/constants/pages.dart';
import 'package:foodtastic_four_admin/utils/device/device_utility.dart';
import 'package:foodtastic_four_admin/utils/helpers/app_helpers.dart';

class FoodsProductsWidget extends StatelessWidget {
  const FoodsProductsWidget({super.key, required this.title, required this.description, required this.calories, required this.minutes, required this.offer, required this.foodType, required this.price, required this.click});


  final String title;
  final String description;
  final String calories;
  final String minutes;
  final String offer;
  final String foodType;
  final int price;
  final VoidCallback click;


  @override
  Widget build(BuildContext context) {
    var size = FDeviceUtility.getDeviceSize(context);
    String img = AppHelpers.handleImgString(foodType);
    Color color = AppHelpers.handleFoodTypeColor(title, description);
    var offerPrice = AppHelpers.calculateOfferPrice(double.parse(price.toString()), double.parse(offer));
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: GestureDetector(
        onLongPress: click,
        child: SizedBox(
          height: size.height * 0.17,
          width: size.width * 0.95,
          child: Row(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: size.width * 0.2, child: Image.asset(img, fit: BoxFit.contain, filterQuality: FilterQuality.high),),
                  FAppSizes.spaceXs,
                  Text('₹${price.toString()}', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w500))
                ],
              ),
              FAppSizes.spaceSm,
              Container(
                width: size.width * 0.7,
                decoration: BoxDecoration(color: FAppColor.fGrey.withOpacity(0.1), borderRadius: BorderRadius.circular(10), border: Border.all(width: 1.5, color: FAppColor.fBlack.withOpacity(0.07))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('⌛ $minutes min   ', style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600)),
                              Text('♨️ $calories', style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600)),
                            ],
                          ),
                          Container(height: 15, width: 15, decoration: BoxDecoration(color: color, shape: BoxShape.circle),)
                        ],
                      ),
                      FAppSizes.spaceXs,
                      Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
                      FAppSizes.spaceSm,
                      Text(description, style: Theme.of(context).textTheme.labelMedium?.copyWith(overflow: TextOverflow.ellipsis), maxLines: 2),
                      FAppSizes.spaceSm,
                      Text('🔥 $offer% OFF up to ₹$offerPrice', style: Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
