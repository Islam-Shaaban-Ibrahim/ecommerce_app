import 'package:ecommerce_app/core/di/service_locator.dart';
import 'package:ecommerce_app/core/widgets/error_indicator.dart';
import 'package:ecommerce_app/core/widgets/loading_indicator.dart';
import 'package:ecommerce_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/cubit/home_states.dart';
import 'package:ecommerce_app/features/home/presentation/screens/home_screen.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/brand_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandSection extends StatefulWidget {
  const BrandSection({super.key});

  @override
  State<BrandSection> createState() => _BrandSectionState();
}

class _BrandSectionState extends State<BrandSection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280.h,
      child: BlocBuilder<HomeCubit, HomeState>(
          bloc: HomeScreen.homeCubitBrands,
          builder: (context, state) {
            if (state is GetBrandsLoading) {
              return const LoadingIndicator();
            } else if (state is GetBrandsError) {
              return ErrorIndicator(
                message: state.error,
                onPressed: () {
                  HomeScreen.homeCubitBrands.getBrands();
                },
              );
            } else if (state is GetBrandsSuccess) {
              return GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.h,
                  mainAxisSpacing: 16.w,
                  mainAxisExtent: 100.h,
                ),
                itemBuilder: (context, index) => BrandItem(
                  brand: HomeScreen.homeCubitBrands.brands[index],
                ),
                itemCount: HomeScreen.homeCubitBrands.brands.length,
              );
            } else {
              return const SizedBox();
            }
          }),
    );
  }
}
