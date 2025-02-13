import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodtastic_four_admin/common/widgets/user_input_field.dart';
import 'package:foodtastic_four_admin/utils/constants/pages.dart';
import 'package:foodtastic_four_admin/utils/device/device_utility.dart';
import 'package:foodtastic_four_admin/utils/validators/auth_validate.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final _formKey = GlobalKey<FormState>();
  var name = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();

  var validate = AuthValidate();

  bool _obscureTxt = false;
  bool isLoading = false;

  void _toggle() {
    setState(() => _obscureTxt = !_obscureTxt);
  }

  @override
  Widget build(BuildContext context) {
    var size = FDeviceUtility.getDeviceSize(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: FAppSizes.md),
                child: Column( mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 150, width: 250, child: Image(image: AssetImage(FAppImg.signUpImg), fit: BoxFit.contain,),),
                    FAppSizes.spaceSm,
                    Text(FAppText.signUpToJoin, style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w400), textAlign: TextAlign.center),
                    FAppSizes.spaceLg,
                    UserInputField(hint: FAppText.signUpEmployeeId, w: size.width * 0.95, type: TextInputType.name, controller: name, validator: validate.validateName),
                    FAppSizes.spaceMd,
                    UserInputField(hint: FAppText.signUpCounterId, w: size.width * 0.95, type: TextInputType.name, controller: name, validator: validate.validateName),
                    FAppSizes.spaceMd,
                    UserInputField(hint: FAppText.signUpName, w: size.width * 0.95, type: TextInputType.name, controller: name, validator: validate.validateName),
                    FAppSizes.spaceMd,
                    UserInputField(hint: FAppText.signUpEmail, w: size.width * 0.95, type: TextInputType.emailAddress, controller: email, validator: validate.validateEmail,),
                    FAppSizes.spaceMd,
                    UserInputField(hint: FAppText.signUpPassword, w: size.width * 0.95, type: TextInputType.visiblePassword, controller: password, validator: validate.validatePassword, obscureTxt: _obscureTxt,
                    suffix: GestureDetector(
                      onTap: _toggle,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: SvgPicture.asset(_obscureTxt ? FAppImg.eyeOff : FAppImg.eyeOn, colorFilter: ColorFilter.mode(FAppColor.fBlack.withOpacity(0.4), BlendMode.srcIn),),
                        ),),
                    ),
                    FAppSizes.space2Xl,
                    GestureDetector(
                      onTap: () {
                        context.go('/login');
                      },
                      child: Container(
                        height: size.height * 0.065,
                        width: size.width * 0.95,
                        decoration: BoxDecoration(color: FAppColor.fGreen, borderRadius: BorderRadius.circular(50)),
                        alignment: Alignment.center,
                        child: Text(FAppText.signUpTxt, style: Theme.of(context).textTheme.labelLarge?.copyWith(color: FAppColor.fWhite),),
                      ),
                    ),
                    FAppSizes.spaceXl,
                    Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(FAppText.signUpHaveAccount, style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w400)),
                        FAppSizes.spaceXs,
                        GestureDetector(
                          onTap: () => context.go('/login'),
                            child: Text(FAppText.signInTxt, style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w400, color: FAppColor.fGreen))),
                      ]
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
