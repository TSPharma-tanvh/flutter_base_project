part of '../../core.dart';

class BrandLoading extends StatelessWidget {
  final bool logoDark;
  final double? size;
  final String? logo;

  const BrandLoading({
    this.size,
    super.key,
    this.logoDark = false,
    this.logo,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double sizeLoading = size ?? screenWidth * 0.25;

    return Stack(
      alignment: Alignment.center,
      children: [
        SpinKitDualRing(
          color: AppColors.light().mainGreen,
          size: sizeLoading * 0.8,
          duration: const Duration(milliseconds: 1500),
          lineWidth: 4,
        ),
        Container(
          width: sizeLoading * 0.5,
          height: sizeLoading * 0.5,
          decoration: const ShapeDecoration(
            color: Colors.transparent,
            shape: CircleBorder(),
          ),
          child: SvgPicture.asset(
            //not added yet
            logo ?? "",
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
