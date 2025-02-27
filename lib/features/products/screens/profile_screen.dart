import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtastic_four_admin/data/repository/auth_repository.dart';
import 'package:foodtastic_four_admin/features/authentication/bloc/staff_logout/staff_logout_bloc.dart';
import 'package:foodtastic_four_admin/features/authentication/bloc/staff_logout/staff_logout_event.dart';
import 'package:foodtastic_four_admin/features/authentication/bloc/staff_logout/staff_logout_state.dart';
import 'package:foodtastic_four_admin/features/products/blocs/profile_data/profile_data_bloc.dart';
import 'package:foodtastic_four_admin/features/products/blocs/profile_data/profile_data_event.dart';
import 'package:foodtastic_four_admin/features/products/blocs/profile_data/profile_data_state.dart';
import 'package:foodtastic_four_admin/utils/constants/pages.dart';
import 'package:foodtastic_four_admin/utils/device/device_utility.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = FDeviceUtility.getDeviceSize(context);
    return Scaffold(
      body: Center(
        child: BlocProvider(
          create: (context) => ProfileDataBloc(context.read<AuthRepository>())..add(ProfileData()),
          child: BlocBuilder<ProfileDataBloc, ProfileDataState>(
            builder: (context, state) {
              if(state is ProfileDataLoading) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 260, width: 260, child: Image.asset(FAppImg.saladImg, fit: BoxFit.cover, filterQuality: FilterQuality.high,),),
                      Shimmer.fromColors( baseColor: FAppColor.fGrey,
                        highlightColor: FAppColor.fGrey,
                        direction: ShimmerDirection.ltr,
                        period: const Duration(seconds: 2),
                        child: Container(height: 18, width: 80, decoration: BoxDecoration(color: FAppColor.fWhite, borderRadius: BorderRadius.circular(5)),),
                      ),
                      FAppSizes.spaceXs,
                      Shimmer.fromColors( baseColor: FAppColor.fGrey,
                        highlightColor: FAppColor.fGrey,
                        direction: ShimmerDirection.ltr,
                        period: const Duration(seconds: 2),
                        child: Container(height: 18, width: 120, decoration: BoxDecoration(color: FAppColor.fWhite, borderRadius: BorderRadius.circular(5)),),
                      ),
                      FAppSizes.spaceMd,
                      Shimmer.fromColors(baseColor: FAppColor.fGreen.withOpacity(0.9),
                        highlightColor: FAppColor.fGreen,
                        direction: ShimmerDirection.ltr,
                        period: const Duration(seconds: 2),
                        child: Container(height: size.height * 0.06, width: size.width * 0.8,
                          decoration: BoxDecoration(color: FAppColor.fGreen, borderRadius: BorderRadius.circular(40)),
                        ),
                      )
                    ],
                  );
              } else if(state is ProfileDataError) {
                  return Center(child: Text(state.error, style: Theme.of(context).textTheme.labelMedium,));
              } else if (state is ProfileDataLoaded) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 260, width: 260, child: Image.asset(FAppImg.saladImg, fit: BoxFit.cover, filterQuality: FilterQuality.high,),),
                    Text(state.userRegisterModel.fullName, style: Theme.of(context).textTheme.headlineSmall),
                    FAppSizes.spaceXs,
                    Text(state.userRegisterModel.email, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: FAppColor.fBlack.withOpacity(0.5))),
                    FAppSizes.spaceMd,
                    BlocBuilder<StaffLogoutBloc, StaffLogoutState>(
                      builder: (context, state) {
                        return GestureDetector(
                          onTap: () {
                            context.read<StaffLogoutBloc>().add(StaffLogout());
                            context.go('/login');
                          },
                          child: Container(height: size.height * 0.06, width: size.width * 0.8,
                            decoration: BoxDecoration(color: FAppColor.fGreen, borderRadius: BorderRadius.circular(40)),
                            alignment: Alignment.center,
                            child: Text(FAppText.logOutTxt, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: FAppColor.fWhite),),
                          ),
                        );
                      },
                    )
                  ],
                );
              }
              return Shimmer.fromColors( baseColor: FAppColor.fGrey,
                highlightColor: FAppColor.fGrey,
                direction: ShimmerDirection.ltr,
                period: const Duration(seconds: 2),
                child: Container(height: 16, width: 120, decoration: BoxDecoration(color: FAppColor.fWhite, borderRadius: BorderRadius.circular(5)),),
              );
            },
          ),
        ),
      ),
    );
  }
}
