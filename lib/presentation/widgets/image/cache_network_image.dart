import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

const String _noImageLink =
    'https://st4.depositphotos.com/14953852/24787/v/380/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg';

class ImgNetWork extends StatelessWidget {
  const ImgNetWork({
    super.key,
    this.url,
    this.onPress,
    required this.width,
    this.height,
    this.fit,
    this.alignment,
    this.filterQuality,
    this.repeat,
    this.color,
    this.useOldImageOnUrlChange,
    this.margin,
    this.borderRadius,
    this.border,
    this.shadow,
    this.blankImage,
  });

  final String? url;
  final void Function()? onPress;
  final double width;
  final double? height;
  final BoxFit? fit;
  final Alignment? alignment;
  final FilterQuality? filterQuality;
  final ImageRepeat? repeat;
  final Color? color;
  final bool? useOldImageOnUrlChange;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;
  final List<BoxShadow>? shadow;
  final Image? blankImage;

  @override
  Widget build(BuildContext context) {
    if (StringUtilsCore.isNullOrEmpty(url)) {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          boxShadow: shadow,
          border: border,
          color: Colors.grey,
        ),
        clipBehavior: Clip.antiAlias,
        child: blankImage ??
            Image.network(
              _noImageLink,
              fit: BoxFit.cover,
            ),
      );
    }

    return GestureDetector(
      onTap: onPress,
      child: CachedNetworkImage(
        imageUrl: url!,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment ?? Alignment.center,
        placeholder: (context, url) => _renderLoading(),
        repeat: repeat ?? ImageRepeat.noRepeat,
        imageBuilder: (context, imageProvider) => Container(
          margin: margin,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            boxShadow: shadow,
            border: border,
            image: DecorationImage(
              image: imageProvider,
              fit: fit ?? BoxFit.cover,
            ),
          ),
        ),
        color: color,
        useOldImageOnUrlChange: useOldImageOnUrlChange ?? false,
        errorWidget: (context, url, error) {
          return blankImage != null
              ? ClipRRect(
                  borderRadius: borderRadius ?? BorderRadius.zero,
                  child: Image(
                    image: blankImage!.image,
                    width: width,
                    height: height,
                  ),
                )
              : Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    borderRadius: borderRadius,
                    boxShadow: shadow,
                    border: border,
                    color: Colors.grey,
                  ),
                  child: Image.network(
                    _noImageLink,
                    fit: BoxFit.cover,
                  ),
                );
        },
      ),
    );
  }

  Container _renderLoading() {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: shadow,
        border: border,
        color: Colors.grey,
      ),
      child: BrandLoading(
        size: width * 0.35,
      ),
    );
  }
}
