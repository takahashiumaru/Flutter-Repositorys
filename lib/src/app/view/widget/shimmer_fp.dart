import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PleaseWaitSensor extends StatelessWidget {
  const PleaseWaitSensor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white,
      child: SizedBox(
        height: 260,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 2.8 / 3,
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 5,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            return const Card(
              elevation: 5,
              color: Colors.black,
              child: SizedBox(
                height: 120,
                width: 120,
              ),
            );
          },
        ),
      ),
    );
  }
}

class PleaseWaitCageName extends StatelessWidget {
  const PleaseWaitCageName({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white,
      child: Container(
        height: 200,
        color: Colors.black,
      ),
    );
  }
}

class PleaseWaitCageListHoriz extends StatelessWidget {
  const PleaseWaitCageListHoriz({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5),
            child: Container(
              width: 152,
              height: 30,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SensorShimmer extends StatelessWidget {
  const SensorShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Wrap(
        children: List.generate(6, (index) {
          return Shimmer.fromColors(
            period: const Duration(milliseconds: 1000),
            baseColor: const Color(0XFFF4F5F8),
            highlightColor: const Color(0XFFECEDF3),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0XFFF4F5F8),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
              height: 85,
              width: 100,
            ),
          );
        }),
      ),
    );
  }
}

class CageShimmer extends StatelessWidget {
  const CageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Shimmer.fromColors(
          period: const Duration(milliseconds: 1000),
          baseColor: const Color(0XFFF4F5F8),
          highlightColor: const Color(0XFFECEDF3),
          child: Container(
            height: 160,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0XFFF4F5F8),
            ),
          ),
        ),
      ],
    );
  }
}

class ProjectShimmer extends StatelessWidget {
  const ProjectShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Shimmer.fromColors(
          period: const Duration(milliseconds: 1000),
          baseColor: const Color(0XFFF4F5F8),
          highlightColor: const Color(0XFFECEDF3),
          child: Container(
            height: 16,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color(0XFFF4F5F8),
            ),
          ),
        ),
      ],
    );
  }
}

class TaskShimmer extends StatelessWidget {
  const TaskShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(1, (index) {
        return Shimmer.fromColors(
          period: const Duration(milliseconds: 1000),
          baseColor: const Color(0XFFF4F5F8),
          highlightColor: const Color(0XFFECEDF3),
          child: Container(
            height: 100,
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0XFFF4F5F8),
            ),
          ),
        );
      }),
    );
  }
}

class IndexPresentationShimmer extends StatelessWidget {
  const IndexPresentationShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(1, (index) {
        return Shimmer.fromColors(
          period: const Duration(milliseconds: 1000),
          baseColor: const Color(0XFFF4F5F8),
          highlightColor: const Color(0XFFECEDF3),
          child: Container(
            height: 80,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0XFFF4F5F8),
            ),
          ),
        );
      }),
    );
  }
}
