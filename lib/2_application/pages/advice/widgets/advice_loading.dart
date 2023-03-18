import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AdviseLoadingWidget extends StatelessWidget {
  const AdviseLoadingWidget({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          40,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff6564A7).withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 80,
            offset: const Offset(0, 10),
          ),
        ],
        color: themeData.colorScheme.primaryContainer,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 100, 30, 100),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.withOpacity(0.1),
          highlightColor: Colors.white.withOpacity(0.5),
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                SkeletonLoader(width: 300),
                SkeletonLoader(width: 300),
                SkeletonLoader(width: 250),
                SkeletonLoader(width: 300),
                SkeletonLoader(width: 200),
                SkeletonLoader(width: 300),
                SkeletonLoader(width: 180),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SkeletonLoader extends StatelessWidget {
  const SkeletonLoader({
    Key? key,
    required this.width,
  }) : super(key: key);
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey,
      ),
    );
  }
}
