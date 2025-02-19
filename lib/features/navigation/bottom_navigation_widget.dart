import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodtastic_four_admin/utils/constants/pages.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: _mainWrapperBottomNav(context),
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
          _bottomAppBarItem(ctx, page: 0, label: FAppText.home, filledIcn: FAppImg.home, path: '/bottomNavbar/home'),
          _bottomAppBarItem(ctx, page: 1, label: FAppText.products, filledIcn: FAppImg.cookingPot, path: '/bottomNavbar/orders'),
          _bottomAppBarItem(ctx, page: 2, label: FAppText.profile, filledIcn: FAppImg.profile, path: '/bottomNavbar/profile'),
        ],),
        ),
      ),
    );
  }

  Widget _bottomAppBarItem(BuildContext ctx, {required path, required page, required label, required filledIcn}) {
    final String currentPath = GoRouterState.of(ctx).uri.toString();
    final bool isSelected = currentPath.startsWith(path);
    return GestureDetector(
      onTap: ()  => ctx.go(path),
      child: Container(
        color: Colors.transparent,
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          isSelected ? Container(height: 5, width: 30,
            margin: EdgeInsets.zero,
            decoration: const BoxDecoration(
              color: FAppColor.fGreen,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80), bottomRight: Radius.circular(80),)
            ),
          ) : const SizedBox(height: 5),

          FAppSizes.spaceSm,
          SvgPicture.asset(filledIcn, height: 24, width: 24, colorFilter: ColorFilter.mode(isSelected ? FAppColor.fGreen : FAppColor.fBlack.withOpacity(0.5), BlendMode.srcIn),),
          const Gap(3),

          Text(label, style: Theme.of(ctx).textTheme.labelMedium?.copyWith(
            color: isSelected ? FAppColor.fGreen : FAppColor.fBlack.withOpacity(0.5),
          ),),
          FAppSizes.spaceSm,
        ],),
      ),
    );
  }
}
