import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
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
    this.noImageLink =
        'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
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
  final String? noImageLink;

  @override
  Widget build(BuildContext context) {
    if (url == null || url!.isEmpty) {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          boxShadow: shadow,
          border: border,
        ),
        clipBehavior: Clip.antiAlias,
        child: blankImage ??
            Image.network(
              noImageLink ?? '',
              width: width,
              height: height,
              fit: BoxFit.cover,
              errorBuilder: (context, exception, stackTrace) {
                return const Text('Error loading fallback image');
              },
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
          debugPrint("Error when rendering cache image: $error");
          return blankImage != null
              ? ClipRRect(
                  borderRadius: borderRadius ?? BorderRadius.zero,
                  child: Image(
                    image: blankImage!.image,
                    width: width,
                    height: height,
                    fit: fit ?? BoxFit.cover,
                  ),
                )
              : Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    borderRadius: borderRadius,
                    boxShadow: shadow,
                    border: border,
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.network(
                    noImageLink ?? '',
                    fit: BoxFit.cover,
                    width: width,
                    height: height,
                    errorBuilder: (context, exception, stackTrace) {
                      return const Text('Error loading fallback');
                    },
                  ),
                );
        },
      ),
    );
  }

  Widget _renderLoading() {
    return Container(
      width: width,
      height: height ?? 0,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
      ),
      child: const CircularProgressIndicator(),
    );
  }
}
