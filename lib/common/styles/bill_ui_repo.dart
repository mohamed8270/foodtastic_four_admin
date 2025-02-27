import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtastic_four_admin/features/products/blocs/food_delivered/food_deliver_bloc.dart';
import 'package:foodtastic_four_admin/features/products/blocs/food_delivered/food_deliver_event.dart';
import 'package:foodtastic_four_admin/features/products/blocs/food_delivered/food_deliver_state.dart';
import 'package:foodtastic_four_admin/utils/constants/pages.dart';
import 'package:foodtastic_four_admin/utils/device/device_utility.dart';

class BillUiRepo extends StatelessWidget {
  const BillUiRepo({super.key, required this.orderToken, required this.orderId, required this.foodName, required this.foodType, required this.quantity, required this.price, required this.userName, required this.email, required this.foodId});

  final String orderToken;
  final String orderId;
  final String foodName;
  final String foodType;
  final String quantity;
  final String price;
  final String userName;
  final String email;
  final String foodId;

  @override
  Widget build(BuildContext context) {
    var size = FDeviceUtility.getDeviceSize(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: BlocBuilder<FoodDeliverBloc, FoodDeliverState>(
        builder: (context, state) {
          return GestureDetector(
            onLongPress: () {
                context.read<FoodDeliverBloc>().add(FoodDeliver(foodId: foodId));
            },
            child: Container(
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
                  child: RotatedBox(quarterTurns: 3, child: Text(orderToken, style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: FAppColor.fWhite, fontWeight: FontWeight.w700, letterSpacing: 1.5))),
                ),
                FAppSizes.spaceSm,
                // ticker order ID
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text('Order ID', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: FAppColor.fBlack.withOpacity(0.5))),
                    FAppSizes.spaceXs,
                    Text(orderId, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: FAppColor.fOrange, fontWeight: FontWeight.w600)),
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
                            child: Text(foodType, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: FAppColor.fWhite, fontWeight: FontWeight.w600)),
                          ),
                        )
                      ],
                    ),
                    FAppSizes.spaceXs,
                    Text.rich(
                      TextSpan(children: [
                        TextSpan(text: foodName, style: Theme.of(context).textTheme.labelLarge),
                        TextSpan(text: '  x  ', style: Theme.of(context).textTheme.labelLarge),
                        TextSpan(text: '  $quantity    ', style: Theme.of(context).textTheme.labelLarge),
                        TextSpan(text: '₹$price', style: Theme.of(context).textTheme.labelLarge),
                      ]),
                    ),
                    FAppSizes.spaceMd,
                    // students details
                    Text('Person details', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: FAppColor.fBlack.withOpacity(0.5))),
                    FAppSizes.spaceXs,
                    Text(userName, style: Theme.of(context).textTheme.labelMedium),
                    Text(email, style: Theme.of(context).textTheme.labelMedium),
                  ],),
                ),
              ],),
            ),
          );
        },
      ),
    );
  }
}
