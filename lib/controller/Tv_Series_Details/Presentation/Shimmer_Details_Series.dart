
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget buildShimmerLoader(BuildContext context) {
  return Column(
    children: [
      // Image Shimmer
      Shimmer.fromColors(
        baseColor: Colors.grey[700]!,
        highlightColor: Colors.grey[500]!,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.3,
          width: double.infinity,
          color: Colors.grey,
        ),
      ),
      const SizedBox(height: 20),

      // Title and rating shimmer
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey[700]!,
              highlightColor: Colors.grey[500]!,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 24,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey[700]!,
                  highlightColor: Colors.grey[500]!,
                  child: Container(
                    width: 50,
                    height: 20,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(width: 10),
                Shimmer.fromColors(
                  baseColor: Colors.grey[700]!,
                  highlightColor: Colors.grey[500]!,
                  child: Container(
                    width: 40,
                    height: 20,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Shimmer.fromColors(
              baseColor: Colors.grey[700]!,
              highlightColor: Colors.grey[500]!,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            Shimmer.fromColors(
              baseColor: Colors.grey[700]!,
              highlightColor: Colors.grey[500]!,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
