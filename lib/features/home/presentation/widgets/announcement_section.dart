import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnnouncementSection extends StatelessWidget {
  const AnnouncementSection({super.key});
  final List<String> bannersPath = const [
    'assets/images/banner1.png',
    'assets/images/banner2.png',
    'assets/images/banner3.png',
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: bannersPath.length,
      itemBuilder: (context, index, realIndex) => Padding(
        padding: const EdgeInsets.all(8),
        child: Image.asset(
          bannersPath[index],
          height: 200.h,
          width: double.infinity,
          fit: BoxFit.fill,
          filterQuality: FilterQuality.high,
        ),
      ),
      options: CarouselOptions(
        autoPlay: true,
        viewportFraction: 0.97,
      ),
    );
  }
}
