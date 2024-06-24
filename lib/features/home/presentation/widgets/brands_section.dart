import 'package:ecommerce_app/core/di/service_locator.dart';
import 'package:ecommerce_app/core/widgets/error_indicator.dart';
import 'package:ecommerce_app/core/widgets/loading_indicator.dart';
import 'package:ecommerce_app/features/home/presentation/cubit/brands/brands_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/cubit/brands/brands_states.dart';
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
  final brandsCubit = serviceLocator.get<BrandsCubit>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280.h,
      child: BlocBuilder<BrandsCubit, BrandsState>(
          bloc: brandsCubit,
          builder: (context, state) {
            if (state is GetBrandsLoading) {
              return const LoadingIndicator();
            }
            if (state is GetBrandsError) {
              return ErrorIndicator(
                message: state.error,
                onPressed: () {
                  brandsCubit.getBrands();
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
                  brand: brandsCubit.brands[index],
                ),
                itemCount: brandsCubit.brands.length,
              );
            } else {
              return const SizedBox();
            }
          }),
    );
  }
}
