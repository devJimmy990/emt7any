import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class StudentDetailsShimmer extends StatelessWidget {
  const StudentDetailsShimmer({required this.count, super.key});
  final int count;

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Column(
      spacing: 12,
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: const CircleAvatar(radius: 50, backgroundColor: Colors.grey),
        ),
        ...List.generate(
          count,
          (index) => Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: 20,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
