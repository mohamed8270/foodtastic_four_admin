import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodtastic_four_admin/common/widgets/custom_btn_tab.dart';
import 'package:foodtastic_four_admin/common/widgets/user_input_field.dart';
import 'package:foodtastic_four_admin/utils/constants/pages.dart';
import 'package:foodtastic_four_admin/utils/device/device_utility.dart';
import 'package:foodtastic_four_admin/utils/validators/food_add_validator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var foodName = TextEditingController();
    var description = TextEditingController();
    var calories = TextEditingController();
    var preparedWithIn = TextEditingController();
    var price = TextEditingController();
    var offer = TextEditingController();
    var counter = TextEditingController();
  var validate = FoodValidate();
  var size = FDeviceUtility.getDeviceSize(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
          child: Container(
            decoration: BoxDecoration(color: FAppColor.fWhite, border: Border(bottom: BorderSide(width: 1.3, color: FAppColor.fGrey.withOpacity(0.5)))),
              child: AppBar(backgroundColor: FAppColor.fWhite, leadingWidth: 50, leading: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(FAppImg.logo, colorFilter: const ColorFilter.mode(FAppColor.fGreen, BlendMode.srcIn),),
              ),
              title: Text(FAppText.home, style: Theme.of(context).textTheme.titleLarge),
              )
          )),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: FAppSizes.sm),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FAppSizes.spaceSm,
              Text.rich(TextSpan(children: [
                TextSpan(text: FAppText.heroH1, style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 42, fontWeight: FontWeight.w700)),
                TextSpan(text: FAppText.heroH2, style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 42, fontWeight: FontWeight.w700, color: FAppColor.fGreen)),
                TextSpan(text: FAppText.heroH3, style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 42, fontWeight: FontWeight.w700)),
                TextSpan(text: '.', style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 42, fontWeight: FontWeight.w700, color: FAppColor.fGreen)),
              ])),
              FAppSizes.spaceSm,
              Text(FAppText.heroP, style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w400)),
              // dotted dash widget
              FAppSizes.spaceXl,
              Text(FAppText.whatsSpecial, style: Theme.of(context).textTheme.bodyLarge),
              FAppSizes.spaceXs,
              UserInputField(hint: 'Chicken Biryani', w: size.width * 0.95, type: TextInputType.name, controller: foodName, validator: validate.validateFoodName),
              FAppSizes.spaceXs,
              UserInputField(hint: 'Most famous food in india which...', w: size.width * 0.95, h: 0.1, type: TextInputType.multiline, controller: description, validator: validate.validateDescription, max: 3,),
              FAppSizes.spaceXs,
              UserInputField(hint: '271 Kcal, 13.7 protein', w: size.width * 0.95, type: TextInputType.text, controller: calories, validator: validate.validateFoodName),
              FAppSizes.spaceXs,
              const CustomBtnTab(),
              FAppSizes.spaceXs,
              UserInputField(hint: '45 min (Preparation)', w: size.width * 0.95, type: TextInputType.number, controller: preparedWithIn, validator: validate.validateFoodNumber),
              FAppSizes.spaceXs,
              UserInputField(hint: '₹290', w: size.width * 0.95, type: TextInputType.number, controller: price, validator: validate.validateFoodNumber),
              FAppSizes.spaceXs,
              UserInputField(hint: '20% OFF', w: size.width * 0.95, type: TextInputType.number, controller: offer, validator: validate.validateFoodNumber),
              FAppSizes.spaceXs,
              UserInputField(hint: 'Counter no.', w: size.width * 0.95, type: TextInputType.number, controller: counter, validator: validate.validateFoodNumber),
              FAppSizes.spaceSm,
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: size.height * 0.06,
                  width: size.width * 0.95,
                  decoration: BoxDecoration(color: FAppColor.fGreen, borderRadius: BorderRadius.circular(30),),
                  alignment: Alignment.center,
                  child: Text('Submit', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: FAppColor.fWhite)),
                ),
              ),
              FAppSizes.spaceSm,
            ],
          ),
        ),
      ),
    );
  }
}
