// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "../components.dart";

class LoadingTilesWidget extends StatelessWidget {
  final int? count;
  final double? height;
  final double? width;
  final double? padding;
  final double? radius;
  const LoadingTilesWidget({
    super.key,
    this.count,
    this.height,
    this.width,
    this.padding,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: count ?? 4,
      padding: EdgeInsets.symmetric(
        horizontal: padding ?? hPadding,
        vertical: 10,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(radius ?? 0),
          ),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: width ?? double.infinity,
                  height: height ?? 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(radius ?? 0),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class LoadingContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final double? radius;
  const LoadingContainer({super.key, this.height, this.width, this.radius});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius ?? 0),
        ),
      ),
    );
  }
}

class GridLoadingWidget extends StatelessWidget {
  final double? ratio;
  const GridLoadingWidget({super.key, this.ratio});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: hPadding),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: ratio ?? 1.0,
      ),
      itemCount: 16,
      itemBuilder: (context, index) {
        return LoadingContainer(radius: 10);
      },
    );
  }
}
