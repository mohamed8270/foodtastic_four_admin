import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:foodtastic_four_admin/common/styles/foods_products_widget.dart';
import 'package:foodtastic_four_admin/common/widgets/custom_btn_tab.dart';
import 'package:foodtastic_four_admin/common/widgets/user_input_field.dart';
import 'package:foodtastic_four_admin/data/repository/food_poduct_repository.dart';
import 'package:foodtastic_four_admin/features/products/blocs/dumb_food_data/dumb_food_bloc.dart';
import 'package:foodtastic_four_admin/features/products/blocs/dumb_food_data/dumb_food_event.dart';
import 'package:foodtastic_four_admin/features/products/blocs/dumb_food_data/dumb_food_state.dart';
import 'package:foodtastic_four_admin/features/products/blocs/food_remove/food_remove_bloc.dart';
import 'package:foodtastic_four_admin/features/products/blocs/food_remove/food_remove_event.dart';
import 'package:foodtastic_four_admin/features/products/blocs/food_remove/food_remove_state.dart';
import 'package:foodtastic_four_admin/features/products/blocs/load_food_data/load_data_bloc.dart';
import 'package:foodtastic_four_admin/features/products/blocs/load_food_data/load_data_event.dart';
import 'package:foodtastic_four_admin/features/products/blocs/load_food_data/load_data_state.dart';
import 'package:foodtastic_four_admin/utils/constants/pages.dart';
import 'package:foodtastic_four_admin/utils/device/device_utility.dart';
import 'package:foodtastic_four_admin/utils/local_storage/local_storage.dart';
import 'package:foodtastic_four_admin/utils/logging/logging.dart';
import 'package:foodtastic_four_admin/utils/validators/food_add_validator.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  final _formKey = GlobalKey<FormState>();
  var foodName = TextEditingController();
  var description = TextEditingController();
  var calories = TextEditingController();
  var preparedWithIn = TextEditingController();
  var price = TextEditingController();
  var offer = TextEditingController();
  var counter = TextEditingController();
  var mealOfDay = TextEditingController();
  var validate = FoodValidate();
  bool status = false;


  @override
  Widget build(BuildContext context) {

    int selectedIndex = context.read<ButtonBloc>().state.selectedIndex;
    String foodType = LocalStorage.innerText[selectedIndex];
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
              BlocBuilder<DumbFoodBloc, DumbFoodState>(
                builder: (context, state) {
                  return Form(
                    key: _formKey,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                      Row(children: [
                        UserInputField(hint: 'Counter no.', w: size.width * 0.6, type: TextInputType.number, controller: counter, validator: validate.validateFoodNumber),
                        FAppSizes.spaceSm,
                        FlutterSwitch(
                          value: status,
                            height: size.height * 0.06,
                            width: size.width * 0.3,
                            activeColor: FAppColor.fGreen,
                            inactiveColor: FAppColor.fGrey,
                            activeText: 'Meal of\nthe day',
                            inactiveText: 'Meal of\nthe day',
                            activeTextColor: FAppColor.fWhite,
                            inactiveTextColor: FAppColor.fBlack,
                            borderRadius: 30,
                            padding: 8,
                            toggleSize: 30,
                            showOnOff: true,
                            valueFontSize: 10, onToggle: (value) => setState(() => status = value),
                        ),
                      ]),
                      FAppSizes.spaceSm,
                      GestureDetector(
                        onTap: () async {
                          _formKey.currentState!.validate();
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            context.read<DumbFoodBloc>().add(DumbFoodData(foodName: foodName.text, description: description.text, calories: calories.text, foodType: foodType, preparedWithIn: int.parse(preparedWithIn.text), price: double.parse(price.text), offer: int.parse(offer.text), counter: int.parse(counter.text), mealOfDay: status));
                            Future.delayed(const Duration(seconds: 5), () => _formKey.currentState!.reset());
                          } else {
                            Get.rawSnackbar(message: 'Unable to store data of foods');
                          }
                        },
                        child: Container(
                          height: size.height * 0.06,
                          width: size.width * 0.95,
                          decoration: BoxDecoration(color: (state is DumbFoodLoading) ? FAppColor.fBlack : FAppColor.fGreen, borderRadius: BorderRadius.circular(30),),
                          alignment: Alignment.center,
                          child: Text((state is DumbFoodLoading) ? 'Processing' : 'Submit', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: FAppColor.fWhite)),
                        ),
                      ),
                      (state is DumbFoodError) ? Text(state.error, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.red)) : const SizedBox(),
                    ],),
                  );
                },
              ),
              FAppSizes.spaceXl,
              // added food items
              Text(FAppText.menuItems, style: Theme.of(context).textTheme.bodyLarge),
              FAppSizes.spaceSm,
              BlocProvider(
                  create: (context) => AllFoodBloc(context.read<FoodProductRepository>())..add(FetchFoodData()),
                  child: BlocBuilder<AllFoodBloc, AllFoodState>(builder: (context, state) {
                    if(state is FoodLoaded) {
                      var len = state.foods.length;
                      return ListView.builder(
                        itemCount: len,
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context, i) {
                        final data = state.foods[i];
                        return BlocBuilder<FoodRemoveBloc, FoodRemoveState>(
                          builder: (context, state) {
                            return FoodsProductsWidget(title: data.foodName, description: data.description, calories: data.calories, minutes: data.preparedWithIn.toString(), offer: data.offer.toString(), foodType: data.foodType, price: data.price,
                              click: () {
                                final removeBloc = context.read<FoodRemoveBloc>();
                                removeBloc.add(FoodRemove(foodId: data.id));
                                AppLogger.debug('Long pressed');
                              },
                            );
                          },
                        );
                      });
                    } else if(state is FoodError) {
                      return Text(state.e, style: Theme.of(context).textTheme.labelMedium);
                    } else if(state is FoodLoading) {
                      return const Padding(
                        padding:  EdgeInsets.all(50),
                        child:  Center(child: SizedBox(height: 18, width: 18, child: CircularProgressIndicator(color: FAppColor.fGreen, strokeCap: StrokeCap.round, strokeWidth: 3, strokeAlign: BorderSide.strokeAlignCenter,),)),
                      );
                    }

                    return Padding(
                      padding: const EdgeInsets.all(50),
                      child: Center(child: Text('Nothing to show! 🍕', style: Theme.of(context).textTheme.labelMedium)),
                    );
                  }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
