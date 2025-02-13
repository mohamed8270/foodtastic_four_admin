import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtastic_four_admin/common/widgets/custom_toggle_btn.dart';
import 'package:foodtastic_four_admin/utils/constants/pages.dart';
import 'package:foodtastic_four_admin/utils/local_storage/local_storage.dart';

class CustomBtnTab extends StatelessWidget {
  const CustomBtnTab({super.key});

  @override
  Widget build(BuildContext context) {
    var len = LocalStorage.innerText.length;
    return Wrap(
      spacing: FAppSizes.xs,
      runSpacing:  FAppSizes.xs,
      children: List.generate(len, (i) {
        var img = LocalStorage.images;
        var data = LocalStorage.innerText;
        return BlocBuilder<ButtonBloc, ButtonState>(
          builder: (context, state) {
            return CustomToggleBtn(title: data[i], img: img[i], isSelected: state.selectedIndex == i, tap: () {
              context.read<ButtonBloc>().add(SelectButtonEvent(i));
            });
          }
        );
      }),
    );
  }
}


abstract class ButtonEvent extends Equatable {
  const ButtonEvent();
}

class SelectButtonEvent extends ButtonEvent {
  final int selectedIndex;

  const SelectButtonEvent(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}

class ButtonState extends Equatable {
  final int selectedIndex;

  const ButtonState(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}

// Bloc
class ButtonBloc extends Bloc<ButtonEvent, ButtonState> {
  ButtonBloc() : super(const ButtonState(0)) {
    on<SelectButtonEvent>((event, emit) {
      emit(ButtonState(event.selectedIndex));
    });
  }
}