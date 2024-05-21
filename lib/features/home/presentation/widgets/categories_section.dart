import 'package:ecommerce_app/core/di/service_locator.dart';
import 'package:ecommerce_app/core/widgets/error_indicator.dart';
import 'package:ecommerce_app/core/widgets/loading_indicator.dart';
import 'package:ecommerce_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/cubit/home_states.dart';
import 'package:ecommerce_app/features/home/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({super.key});

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  final homeCubit = serviceLocator.get<HomeCubit>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280.h,
      child: BlocBuilder(
        bloc: homeCubit..getCategories(),
        builder: (context, state) {
          if (state is GetCategoriesLoading) {
            return const LoadingIndicator();
          } else if (state is GetCategoriesError) {
            return ErrorIndicator(
                message: state.error,
                onPressed: () {
                  homeCubit.getCategories();
                  setState(() {});
                });
          } else if (state is GetCategoriesSuccess) {
            return GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 100 / 144,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                mainAxisExtent: 100.h,
              ),
              itemBuilder: (context, index) => CategoryItem(
                category: state.categories[index],
              ),
              itemCount: state.categories.length,
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
