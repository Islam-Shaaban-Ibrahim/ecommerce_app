import 'package:ecommerce_app/core/theming/app_colors.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavBarIcon extends StatelessWidget {
  final String imageName;
  final bool isSelected;
  const NavBarIcon(
      {super.key, required this.imageName, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:
            isSelected ? ColorsManager.whiteColor : ColorsManager.primaryColor,
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ImageIcon(
          size: 20.sp,
          AssetImage('assets/images/$imageName.png'),
        ),
      ),
    );
  }
}
