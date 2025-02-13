import 'package:flutter/material.dart';
import 'package:foodtastic_four_admin/utils/constants/pages.dart';
import 'package:foodtastic_four_admin/utils/device/device_utility.dart';

class UserInputField extends StatelessWidget {
  const UserInputField({super.key, required this.hint, required this.w, this.h = 0.065, required this.type, required this.controller, required this.validator, this.obscureTxt = false, this.suffix, this.color = FAppColor.fGrey, this.max = 1});

  final String hint;
  final double w;
  final double h;
  final TextInputType type;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final bool obscureTxt;
  final Widget? suffix;
  final Color? color;
  final int? max;

  @override
  Widget build(BuildContext context) {
    var size = FDeviceUtility.getDeviceSize(context);
    return FormField(builder: (FormFieldState<String> field) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(height: size.height * h, width: w,
          decoration: BoxDecoration(color: field.hasError ? Colors.red.withOpacity(0.6) : color, borderRadius: BorderRadius.circular(8)),
          alignment: Alignment.center,
          child: TextFormField(
            cursorColor: FAppColor.fGreen,
            style: Theme.of(context).textTheme.labelMedium,
            controller: controller,
            obscureText: obscureTxt,
            keyboardType: type,
            maxLines: max,
            onChanged: (value) => field.didChange(value),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: Theme.of(context).textTheme.labelMedium?.copyWith(color: FAppColor.fBlack.withOpacity(0.4)),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 1.5, color: Colors.red),
                borderRadius: BorderRadius.circular(5),
              ),
              isCollapsed: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: FAppSizes.sm),
              suffixIcon: suffix
            ),
          ),
          ),
          if (field.hasError) Text(field.errorText ?? '', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.red)),
        ],
      );
    });
  }
}
