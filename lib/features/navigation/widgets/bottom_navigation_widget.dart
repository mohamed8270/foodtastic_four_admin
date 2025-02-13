import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodtastic_four_admin/features/navigation/controller/navigation_bloc.dart';
import 'package:foodtastic_four_admin/features/navigation/model/bottom_nav_inject.dart';
import 'package:foodtastic_four_admin/utils/constants/pages.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {

  late PageController pageController;
  BottomNavModel navModel = Get.put(BottomNavModel());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _mainWrapperBody(),
      bottomNavigationBar: _mainWrapperBottomNav(context),
    );
  }

  PageView _mainWrapperBody() {
    return PageView(
      onPageChanged: (int page) => navModel.onPageChanged(page, context),
      controller: pageController,
      children: navModel.pages,
    );
  }

  BottomAppBar _mainWrapperBottomNav(BuildContext ctx) {
    return BottomAppBar(
      height: 68,
      color: FAppColor.fWhite,
      padding: EdgeInsets.zero,
      child: Container(
        decoration: BoxDecoration(color: Colors.transparent, border: Border(top: BorderSide(width: 1.3, color: FAppColor.fGrey.withOpacity(0.5)))),
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: FAppSizes.lg),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          _bottomAppBarItem(ctx, page: 0, label: FAppText.home, filledIcn: FAppImg.home),
          _bottomAppBarItem(ctx, page: 1, label: FAppText.products, filledIcn: FAppImg.cookingPot),
          _bottomAppBarItem(ctx, page: 2, label: FAppText.profile, filledIcn: FAppImg.profile),
        ],),
        ),
      ),
    );
  }

  Widget _bottomAppBarItem(BuildContext ctx, {required page, required label, required filledIcn}) {
    var con = ctx.watch<BottomNavCubit>().state == page;
    return GestureDetector(
      onTap: () {
        BlocProvider.of<BottomNavCubit>(context).changeSelectedIndex(page);
        pageController.animateToPage(page, duration: const Duration(milliseconds: 10), curve: Curves.fastLinearToSlowEaseIn);
      },
      child: Container(
        color: Colors.transparent,
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          con ? Container(height: 5, width: 30,
            margin: EdgeInsets.zero,
            decoration: const BoxDecoration(
              color: FAppColor.fGreen,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80), bottomRight: Radius.circular(80),)
            ),
          ) : const SizedBox(height: 5),

          FAppSizes.spaceSm,
          SvgPicture.asset(filledIcn, height: 24, width: 24, colorFilter: ColorFilter.mode(con ? FAppColor.fGreen : FAppColor.fBlack.withOpacity(0.5), BlendMode.srcIn),),
          const Gap(3),

          Text(label, style: Theme.of(ctx).textTheme.labelMedium?.copyWith(
            color: con ? FAppColor.fGreen : FAppColor.fBlack.withOpacity(0.5),
          ),),
          FAppSizes.spaceSm,
        ],),
      ),
    );
  }

}
